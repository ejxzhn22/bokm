package com.bokm.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bokm.dao.DeliveryDAO;
import com.bokm.service.DeliveryService;
import com.bokm.service.ManagerService;
import com.bokm.service.MemberService;
import com.bokm.vo.Book;
import com.bokm.vo.BorrowDetail;
import com.bokm.vo.Criteria;
import com.bokm.vo.Delivery;
import com.bokm.vo.Member;
import com.bokm.vo.PageMaker;

@Controller
public class DeliveryController {
	@Inject
	DeliveryService deliveryService;
	@Inject
	MemberService memberService;
	@Inject
	ManagerService managerService;
	
	
	@RequestMapping(value="bookDeliveryList",method=RequestMethod.GET)
	public String bookDeliveryList(Model model,HttpSession session,Criteria criteria) throws Exception {
		System.out.println("배송 창입니다.");
		
		if(session.getAttribute("user")==null) {
			model.addAttribute("msg","로그인 하세요");
			model.addAttribute("url","login");
			return "alert";
		}
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCriteria(criteria);
	    pageMaker.setTotalCount(1000);
		
		model.addAttribute("dvlist", deliveryService.bookListAll(criteria));
		model.addAttribute("articles", deliveryService.listCriteria(criteria));
		model.addAttribute("pageMaker", pageMaker);
		
		return "bookDeliveryList";
	}

	@RequestMapping(value="bookDeliveryDetail",method=RequestMethod.GET)
	public String bookDeliveryDetail(@RequestParam("isbn")String bk_icode,Model model) {
		System.out.println("배송 확인 창입니다.");
		;
		model.addAttribute("dvdetail", deliveryService.bookDetail(bk_icode));
		model.addAttribute("dvdvdv", deliveryService.delivery_mmbook(bk_icode));
		
		return "bookDeliveryDetail";
	}

	@RequestMapping(value="bookDeliveryDetail",method=RequestMethod.POST)
	public String bookDeliveryForm(HttpServletRequest req, Delivery delivery,HttpSession session,Model model) {
		System.out.println("배송 여부 확인 창입니다.(포스트)");
		
		Member member=(Member)session.getAttribute("user");
		String dv_bk_id=member.getMb_email();
		String dv_user=member.getMb_name();
		
		String dv_location = req.getParameter("dv_location1") + ",";
		dv_location += req.getParameter("dv_location2") + ",";
		dv_location += req.getParameter("dv_location3") + ",";
		dv_location += req.getParameter("dv_location4") + ",";
		dv_location += req.getParameter("dv_location5");
		
		delivery.setDv_bk_id(dv_bk_id);
		delivery.setDv_location(dv_location);
		delivery.setDv_user(dv_user);
		session.getAttribute("mb_email");
		
		
		deliveryService.deliveryInfo(delivery);
		
		if(session.getAttribute("user")==null) {
			model.addAttribute("msg","로그인 하세요");
			model.addAttribute("url","controller/login");
			return "alert";
		}

		deliveryService.mypageDeliveryComplete(); //배송중->배송완료로 바꿔준다.
		deliveryService.mypage_expectedEqualComplete(); //배송완료항목의 completetime을 정의해준다.
		deliveryService.mypageList(dv_bk_id);
		model.addAttribute("mypage", deliveryService.mypageList(dv_bk_id));
		
		return "mypage_delivery";
			

	}
	@RequestMapping(value="mypage_delivery",method=RequestMethod.GET)
	public String mypage_delivery(HttpSession session,Model model,Delivery delivery) {
		System.out.println("배송 확인 창입니다.");
		
		if(session.getAttribute("user")==null) {
			model.addAttribute("msg","로그인 하세요");
			model.addAttribute("url","controller/login");
			return "alert";
		}
		Member member=(Member)session.getAttribute("user");
		String dv_bk_id=member.getMb_email();

			deliveryService.mypageDeliveryComplete(); //배송중->배송완료로 바꿔준다.
			deliveryService.mypage_expectedEqualComplete(); //배송완료항목의 completetime을 정의해준다.
			deliveryService.mypageList(dv_bk_id);
			model.addAttribute("mypage", deliveryService.mypageList(dv_bk_id));
		return "mypage_delivery";
	}
	@RequestMapping(value="mypage_deliveryPopup",method=RequestMethod.GET)
	public String deliveryPopup(@RequestParam("dv_bcode")String isbn,
			@RequestParam("dv_state")String state,Model model){
		System.out.println("관리자/배송 관리창 배송 팝업입니다.");

		if(state.equals("배송중")) {
			model.addAttribute("dv2", deliveryService.mypage_deliveryPopup2(isbn));
			return "mypage_deliveryPopup2";
		}
		if(state.equals("배송준비")) {
			model.addAttribute("dv3", deliveryService.mypage_deliveryPopup3(isbn));
			return "mypage_deliveryPopup3";
		}
		model.addAttribute("dv1", deliveryService.mypage_deliveryPopup1(isbn));
		return "mypage_deliveryPopup1";
		
		/*
		 * if(deliveryService.mypage_deliveryPopup1(isbn).isEmpty()) { //배송완료에 값이 없을 때에
		 * if(deliveryService.mypage_deliveryPopup2(isbn).isEmpty()) { //배송중에 값이 없을 때에
		 * deliveryService.mypage_deliveryPopup3(isbn); return
		 * "mypage_deliveryPopup3";//배송준비일 때!
		 * 
		 * } return "mypage_deliveryPopup2";//배송중일 때! } return "mypage_deliveryPopup1";
		 * //배송완료일 때!
		 */
	}
	
	
	//배송 현황
	@RequestMapping(value="admin/deliveryRequest",method=RequestMethod.GET)
	public String deliveryRequest(Model model) {
		System.out.println("관리자/배송 관리창입니다.(배송 현황)");
		deliveryService.mypageDeliveryComplete(); //배송중->배송완료로 바꿔준다.
		model.addAttribute("dvlist2",deliveryService.nowDelivery());
		return "admin/deliveryRequest";
	}

	//배송 신청
	@RequestMapping(value="admin/deliveryRequestPrev",method=RequestMethod.GET)
	public String deliveryRequestPrev(Model model) {
		System.out.println("관리자/배송 관리창입니다.(배송 신청 목록)");
		model.addAttribute("dvlist",deliveryService.prevDelivery());
		return "admin/deliveryRequestPrev";
	}
	
	
	//배송 완료
	@RequestMapping(value="admin/deliveryRequestAfter",method=RequestMethod.GET)
	public String deliveryRequestAfter(Model model) {
		System.out.println("관리자/배송 관리창입니다.(배송 완료 목록)");
		model.addAttribute("dvlist3",deliveryService.afterDelivery());
		return "admin/deliveryRequestAfter";
	}
	
	
	//배송 완료 
	@RequestMapping(value="admin/deliveryRecognizeDetail",method=RequestMethod.GET)
	public String deliveryRecognizeDetail(@RequestParam("isbn")String isbn,Model model,Delivery delivery) {
		System.out.println("관리자/배송 관리창 상세보기입니다.(배송완료)");
		model.addAttribute("detail", deliveryService.deliveryDetail(isbn));
		//여기서 모두 받아온 애들의 아이디를 포스트쪽으로 넘겨준다
		return "admin/deliveryRecognizeDetail";
	}
	//배송 완료 

	@RequestMapping(value="admin/deliveryRecognizeDetail",method=RequestMethod.POST)
	public String deliveryRecognizeDetail(Delivery delivery,@RequestParam("dv_bk_id")String dv_bk_id) {
		System.out.println("관리자/배송 관리창 상세보기입니다.(배송완료)(포스트)");
		
		Member member=memberService.idCheck(dv_bk_id); //mb_id 찾아오는 mapper문
		
		member.getMb_id();//그 이메일에 대한 mb_id(회원번호)가져오기
		System.out.println(member.getMb_id());
		delivery.getDv_bcode();//isbn코드 가져오기
		System.out.println(delivery.getDv_bcode());
		//배송완료 된 것 대출중인 테이블로 이동

		//여기에 complete time을 now()로 해주는 구문
		deliveryService.managerDeliveryComplete(delivery.getDv_bcode());
		//승인을 누르면 배송완료(관리자 승인)으로 바꿔주는 구문
		deliveryService.managerDeliveryComplete2(delivery.getDv_bcode());
		
		
		//합칠 때 마이페이지 배송완료->대출중으로 가게해주는 구문 넣어주기!
		BorrowDetail borrowDetail = new BorrowDetail();
		String bd_bcode = delivery.getDv_bcode();
		System.out.println("bd_bcode는"+bd_bcode);
		//오류납니다.
		borrowDetail.setBd_bcode(bd_bcode);
		System.out.println("디테일"+borrowDetail);
		 managerService.borrowdetail(borrowDetail);
		 managerService.borrowlist(member.getMb_id());
		 managerService.borrowupdate(borrowDetail.getBd_bcode());
		 
		return "admin/deliveryRequestAfter";
	}
	
	
	//배송 대기 
	@RequestMapping(value="admin/deliveryRequestDetail",method=RequestMethod.GET)
	public String deliveryRequestDetail(@RequestParam("isbn")String isbn,Model model) {
		System.out.println("관리자/배송 관리창 상세보기입니다.(배송 대기)");
		model.addAttribute("detail", deliveryService.deliveryDetail(isbn));
		return "admin/deliveryRequestDetail";
	}
	//배송 대기 포스트
	@RequestMapping(value="admin/deliveryRequestDetail",method=RequestMethod.POST)
	public String deliveryRequestDetail(HttpServletRequest req,Delivery delivery) {
		System.out.println("관리자/배송 관리창 상세보기입니다. (배송 대기)(포스트)");
		deliveryService.deliveryOk(delivery);
		
		return "admin/deliveryRequest";
	}
}
