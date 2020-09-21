package com.bokm.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bokm.service.AdminManagerService;
import com.bokm.service.ManagerService;
import com.bokm.vo.Board;
import com.bokm.vo.Book;
import com.bokm.vo.Delivery;

@Controller
public class AdminManagerController {
	@Inject
	private AdminManagerService adminManagerService;
	@Inject
	private ManagerService managerService;
	
	//admin 홈으로
	@RequestMapping(value = "admin/adminHome", method = RequestMethod.GET)
	public String home(Model model) {
		int i;
		List<String> list= new ArrayList<>();
		list.add("김수진 기사님");
		list.add("문제선 기사님");
		list.add("오동엽 기사님");
		list.add("이재복 기사님");
		list.add("조준영 기사님");
		for(i=0; i<list.size(); i++){
			int r = adminManagerService.performance(list.get(i));
			model.addAttribute("performance"+i, r);
		}
		return "admin/adminHome";
	}
	
	//대출관리로 이동
	@RequestMapping(value="/admin/adminBorrow", method = RequestMethod.GET)
	public String adminBorrow(Model model) {
		List list = adminManagerService.adminborrow();
		model.addAttribute("list", list);
		
		return "/admin/adminBorrow";
	}
	
	//예약관리로 이동
	@RequestMapping(value="/admin/adminReser", method = RequestMethod.GET)
	public String adminReser(Model model) {
		List list = adminManagerService.adminreser();
		model.addAttribute("list", list);
		System.out.println(list);
		
		return "/admin/adminReser";
	}
	
	//예약강제취소
	@RequestMapping(value="/admin/admincancelreser", method=RequestMethod.GET)
	public String cancelreser(@RequestParam("bb_id")int bb_id,Book book,Model model) {
		String bk_icode=book.getBk_icode().split(" ")[1];
		book.setBk_icode(bk_icode);
		
		System.out.println("강제취소 book"+book);
		int r = managerService.cancelreser(book);
		
		Board board = new Board(book.getBk_name(),2);
		board.setBb_id(bb_id);
		adminManagerService.resernotice(board);
		
		if(r>0) {
			model.addAttribute("msg", "예약취소 완료");
			model.addAttribute("url", "/admin/adminReser");
			return "alert";
		}else {
			model.addAttribute("msg", "예약취소 실패");
			model.addAttribute("url", "/admin/adminReser");
			return "alert";
		}
	}
	
	
	//연체관리로 이동
	@RequestMapping(value="/admin/adminArrears", method=RequestMethod.GET)
	public String adminArrears(Model model) {
		//연체 리스트
		List list = adminManagerService.adminarrears();
		System.out.println(list);
		model.addAttribute("list", list);
		
		return "/admin/adminArrears";
	}
	
	//연체료
	@RequestMapping(value="/admin/charge",method=RequestMethod.GET)
	public String charge(@RequestParam("arrearsdate")int arrearsdate, Model model) {
		model.addAttribute("msg", "연체료: "+arrearsdate*500+"원");
		model.addAttribute("url","adminArrears");
		
		return "alert";
	}
	//반납
	@RequestMapping(value="/admin/bookreturn", method=RequestMethod.GET)
	public String bookReturn(@RequestParam("bd_bo_num") int bd_bo_num,@RequestParam("bd_bcode") String bd_bcode, Model model) {
		int r = adminManagerService.bookreturn(bd_bo_num);
		System.out.println("대출번호"+bd_bo_num);
		if(r>0) {
			adminManagerService.bstateupdate(bd_bcode);
			
			model.addAttribute("msg", "반납완료");
			model.addAttribute("url","adminBorrow");
			
			//예약자가 있을 경우 공지발송.
			int reserid = managerService.searchreser(bd_bo_num);
			
			if(reserid > 0 ) {
				
				Book book =managerService.selectbook(bd_bcode);
				Board board = new Board(book.getBk_name(),1);
				board.setBb_id(reserid);
				adminManagerService.resernotice(board);
			}
			
			
			return "alert";
			
		}
		else {
			model.addAttribute("msg", "반납실패");
			model.addAttribute("url","adminBorrow");
			
			return "alert";
		}
	}
	

}
