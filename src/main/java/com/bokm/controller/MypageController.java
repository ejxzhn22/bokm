package com.bokm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bokm.service.BoardService;
import com.bokm.service.ManagerService;
import com.bokm.service.MemberService;
import com.bokm.service.MypageService;
import com.bokm.service.SearchService;
import com.bokm.vo.Board;
import com.bokm.vo.BoardReply;
import com.bokm.vo.Criteria;
import com.bokm.vo.Member;
import com.bokm.vo.PageMaker;
import com.bokm.vo.Review;

@Controller
public class MypageController {
	@Inject
	private MypageService mypageService;
	@Inject
	private ManagerService managerService;
	@Inject
	private MemberService memberService;
	@Inject
	private SearchService searchService;
	@Inject
	private BoardService boardService;
	
	//마이페이지로 이동
	@RequestMapping(value="movemypage", method=RequestMethod.GET)
	public String moveMypage(@RequestParam ("mb_id")int mb_id, Model model) {
		//연체 변경
		managerService.arrears();
		
		//연체 건수
		int arrcount = managerService.arrearscount(mb_id);
		System.out.println("arrcount"+arrcount);
		model.addAttribute("arrcount", arrcount);
		//대출건수
		System.out.println(mb_id);
		int bcount = managerService.borrowcount(mb_id);
		System.out.println("count"+bcount);
		model.addAttribute("bcount",bcount);
		
		//대출현황
		List blist = managerService.currentborrow(mb_id);
		System.out.println("대출현황"+blist);
		model.addAttribute("blist", blist);
		
		//예약건수
		int rcount = managerService.resercount(mb_id);
		model.addAttribute("rcount", rcount);
		
		//예약현황
		List rlist = managerService.currentreser(mb_id);
		model.addAttribute("rlist", rlist);
		System.out.println("예약현황 "+rlist);
		
		//개인공지사항
		List<Board> nlist = managerService.mynotice(mb_id);
		model.addAttribute("nlist", nlist);
		System.out.println("개인공지 "+nlist);
		
		//개인공지 알림창
		List<Board> alist = managerService.noread(mb_id);
		model.addAttribute("alist", alist);
		System.out.println("개인공지 알림"+alist);
		
		//안읽은 개인공지 건수
		int acount = managerService.noticecount(mb_id);
		model.addAttribute("acount", acount);
		
		//내가쓴글 갯수
		int boardcount = boardService.boardcount(mb_id);
		model.addAttribute("boardcount", boardcount);
		return "mypage";
	}
	


	
	//대출현황으로 이동
	@RequestMapping(value="moveborrowlist", method=RequestMethod.GET)
	public String moveBorrowlist(@RequestParam("mb_id")int mb_id, Model model) {
		//대출현황
		List list = managerService.currentborrow(mb_id);
		System.out.println(list);
				
		model.addAttribute("list", list);
		return "borrowlist";
	}
	
	//대출현황->대출/반납이력으로 이동
	@RequestMapping(value="moveborrowhistory", method=RequestMethod.GET)
	public String moveBorrowhistory(@RequestParam("mb_id")int mb_id, Model model) {
		//대출/반납이력
		System.out.println("mb_id"+mb_id);
		List list = managerService.pastborrow(mb_id);
		System.out.println(list);
		model.addAttribute("list", list);
		
		return "borrowhistory";
	}
	
	//예약현황으로 이동
	@RequestMapping(value="movereservation", method=RequestMethod.GET)
	public String moveReservation(@RequestParam("mb_id")int mb_id, Model model) {
		//예약현황
		List list = managerService.currentreser(mb_id);
		System.out.println(list);
						
		model.addAttribute("rlist", list);
		return "reservation";
	}
	
	//개인공지현황으로 이동
	@RequestMapping(value="movemynotice", method=RequestMethod.GET)
	public String moveMynotice(@RequestParam("mb_id") int mb_id, Model model){
		//개인공지 현황
		List list = managerService.mynotice(mb_id);
		model.addAttribute("nlist", list);
		
		return "mynotice";
	}
	
	//개인공지 삭제
	@RequestMapping(value="noticedel", method=RequestMethod.GET)
	public String noticedel(@RequestParam("bb_num") int bb_num,Model model, HttpSession session) {
		
		int r = managerService.noticedel(bb_num);
		Member member = (Member)session.getAttribute("user");
		int mb_id = member.getMb_id();
		if(r>0) {
			model.addAttribute("msg", "삭제완료");
			model.addAttribute("url", "movemypage?mb_id="+mb_id);
		}else {
			model.addAttribute("msg", "삭제실패");
			model.addAttribute("url", "movemypage?mb_id="+mb_id);
		}
		
		return "alert";
		
	}
	
	//내가쓴글로 이동
	@RequestMapping(value="movemyboard", method=RequestMethod.GET)
	public String movemyboard(@RequestParam("mb_id") int mb_id, Model model,Criteria criteria) {
		PageMaker pageMaker = new PageMaker();
		criteria.setBb_bnum("qna"); //리스트 다중 파라미터로 인해 Criteria클래스에 bb_bnum을 생성해 이중 bnum을 set해줌
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countArticles(criteria));
		List<Board> boardList = boardService.boardListSelect(criteria);
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("list",boardList);
		//내가쓴글
		List list = boardService.myboard(mb_id);
		model.addAttribute("boardlist", list);
		return "myboard";
	}
	
	//ajax 조회수-------------------------------------------------------
	@ResponseBody
	@RequestMapping(value="noticeup", method=RequestMethod.POST)
	public Map<String, Object> noticeUp(@RequestParam("bb_num") int bb_num, Model model) {
		Map<String, Object> result = new HashMap<>();
		try {
			managerService.noticeup(bb_num);
			result.put("status", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "fail");
		}
		
		return result;
	}
	
	//ajax 개인공지 조회
	@ResponseBody
	@RequestMapping(value="notice", method=RequestMethod.POST)
	public List<Board> notice(@RequestParam("mb_id")int mb_id){
		
		return managerService.mynotice(mb_id);
	}
	
	//-----------------------------------------------------------------

//준영 ========================================================================
	
	//개인정보 관리로 이동
	@RequestMapping(value="infoupdate", method=RequestMethod.GET)
	public String infoupdate(HttpSession session, Model model) {
		 Member member = (Member)session.getAttribute("user");
		 String[] address = member.getMb_address().split(",");
		 for(int i=0; i<address.length; i++) {
			
			 model.addAttribute("mb_address"+i, address[i]);
		 }
		return "infoupdate";
	}
	
	//정보수정
	@RequestMapping(value="infoupdate", method=RequestMethod.POST)
	public String infoupdate(Member member,HttpSession session,HttpServletRequest req,Model model) {
		
		
		String mb_address = req.getParameter("mb_address1") + ",";
		mb_address += req.getParameter("mb_address2") + ",";
		mb_address += req.getParameter("mb_address3") + ",";
		mb_address += req.getParameter("mb_address4") + ",";
		mb_address += req.getParameter("mb_address5");
		
		member.setMb_address(mb_address);
		mypageService.updateinfo(member);
		session.setAttribute("user", member);
		model.addAttribute("msg","수정이되었습니다.");
	
		return "alert";
	}
	
	//사용자 회원탈퇴
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(HttpSession session,Model model){
		 
		 Member member = (Member)session.getAttribute("user");

		 mypageService.delete(member.getMb_id());
		 
		 session.invalidate();
		model.addAttribute("msg", "탈퇴되었습니다.");
		return "alert2";
	}
	
	//관리자 회원탈퇴
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String delete(@RequestParam("mb_id") int mb_id){
		System.out.println(mb_id);
		
		mypageService.delete(mb_id);
		
		
		return "redirect:/admin/adminMemberList";
	}
	
	 //비밀번호 변경
	@RequestMapping(value="updatepw", method=RequestMethod.GET)
	public String updatepw(){
		
		return "updatepw";
	}
	
	@RequestMapping(value="updatepw", method=RequestMethod.POST)
	public String updatepw(@RequestParam("co_mb_pw") String co_mb_pw,HttpSession session,@RequestParam("mb_pw") String mb_pw,Model model){
		
		Member member = (Member)session.getAttribute("user");
		
		
		if(member.getMb_pw().equals(co_mb_pw)) {
			
			member.setMb_pw(mb_pw);
			mypageService.updateinfo(member);
			session.invalidate();
			
			model.addAttribute("msg","변경성공! 다시 로그인해주세요");
			return "alert2";
		}else {
			model.addAttribute("msg","비밀번호가 다릅니다");
			return "alert";
		}
		
	}
	
//	===========================재복====================나의서평=====
	@RequestMapping(value="myreview", method=RequestMethod.GET)
	public String myreview(@RequestParam ("mb_id") int rv_mb_id,Member member, Model model,Review review,
							@RequestParam ("mb_email") String mb_email) {
//		member = memberService.idCheck(member.getMb_email());
//		review.setRv_mb_id(member.getMb_id());
//		System.out.println("member===="+member);
//		review.setRv_mb_id(rv_mb_id);
//		review.setRv_name(member.getMb_name());
//		List<Review> Rlist = searchService.reviewList(review);
		
		List<Map> Rlist = searchService.reviewBookName(rv_mb_id);
		System.out.println("Rlist==========="+Rlist);
		model.addAttribute("rlist",Rlist);
		
		return "myreview";
	}
//	@RequestMapping(value="myreview", method=RequestMethod.POST)
//	public String myreviewView(Member member, Model model, BoardReply boardReply,Review review) {
//		return "myreview";
//	}
	
	
}
	