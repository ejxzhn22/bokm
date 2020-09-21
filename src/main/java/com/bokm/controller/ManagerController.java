package com.bokm.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bokm.service.ManagerService;
import com.bokm.vo.Book;
import com.bokm.vo.BorrowDetail;

@Controller
public class ManagerController {
	@Inject
	private ManagerService managerService;
	

	//대출신청으로 이동
	@RequestMapping(value="moveborrow", method=RequestMethod.GET)
	public String moveBorrow(@RequestParam("isbn") String bd_bcode,Model model) {
		bd_bcode= bd_bcode.split(" ")[1];
		Book book = managerService.selectbook(bd_bcode);
		
		model.addAttribute("book", book);
		System.out.println(book);
		
		return "borrow";
	}
	
	//책 대출
	@RequestMapping(value="addborrow", method=RequestMethod.POST)
	public String addborrow(BorrowDetail borrowDetail,@RequestParam("bk_icode")String bk_icode,@RequestParam("bl_id")int bl_id, Model model,Map map) {
		borrowDetail.setBd_bcode(bk_icode);
		System.out.println("디테일"+borrowDetail);
		
		map.put("bk_icode", bk_icode);
		map.put("mb_id",bl_id);
		
		List list = managerService.searchdetail(map);
		
		System.out.println(list);
		
		//예약자가 신청 했을때 
		if(list != null) {
			
			Book book = new Book();
			book.setBk_icode(bk_icode);
			book.setBk_id(bl_id);
			
			int r = managerService.cancelreser(book);
			
			if(r>0) {
				System.out.println("성공");
			}
			else {
				System.out.println("실패");
			}
		}
		
		managerService.borrowdetail(borrowDetail);
		managerService.borrowlist(bl_id);
		managerService.borrowupdate(borrowDetail.getBd_bcode());
		
		model.addAttribute("msg", "대출완료 ㅎ.ㅎ");
		model.addAttribute("url", "movemypage?mb_id="+bl_id);
		return "alert";
	}
	
	//연장
	@RequestMapping(value="extension",method=RequestMethod.GET)
	public String extension(@RequestParam("bd_bo_num")int bd_bo_num,@RequestParam("mb_id") int mb_id, Model model) {
		int r = managerService.extension(bd_bo_num);
		
		if(r>0) {
			model.addAttribute("msg", "연장 완료");
			model.addAttribute("url", "moveborrowlist?mb_id="+mb_id);
			return "alert";
		}else {
			model.addAttribute("msg", "연장 실패");
			model.addAttribute("url", "moveborrowlist?mb_id="+mb_id);
			return "alert";
		}
	}
	
	//책 예약
	@RequestMapping(value="reservation", method=RequestMethod.GET)
	public String reservation(@RequestParam("isbn")String isbn,@RequestParam("mb_id") int mb_id,Model model,Map map) {
		String bk_icode = isbn.split(" ")[1];
		List nlist = managerService.searchnum(bk_icode);
		map.put("bd_bo_num", nlist.get(0));
		map.put("mb_id", mb_id);
		managerService.reservation(map);
		
		model.addAttribute("msg", "예약완료");
		model.addAttribute("url", "movemypage?mb_id="+mb_id);
		
		return "alert";
	}
	
	//예약취소
	@RequestMapping(value="cancelreser", method=RequestMethod.GET)
	public String cancelreser(Book book,Model model) {
		String bk_icode=book.getBk_icode().split(" ")[1];
		book.setBk_icode(bk_icode);
		
		System.out.println(book);
		int r = managerService.cancelreser(book);
		if(r>0) {
			model.addAttribute("msg", "예약취소 완료");
			model.addAttribute("url", "movemypage?mb_id="+book.getBk_id());
			return "alert";
		}else {
			model.addAttribute("msg", "예약취소 실패");
			model.addAttribute("url", "movemypage?mb_id="+book.getBk_id());
			return "alert";
		}
	}
	
}
