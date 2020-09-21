package com.bokm;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bokm.service.BoardService;
import com.bokm.service.ManagerService;
import com.bokm.vo.Board;
import com.bokm.vo.Criteria;
import com.bokm.vo.Member;
import com.bokm.vo.PageMaker;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private ManagerService managerService;
	@Inject
	private BoardService boardService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpSession session, Criteria criteria) {
		PageMaker pageMaker1 = new PageMaker();
		criteria.setBb_bnum("notice"); //리스트 다중 파라미터로 인해 Criteria클래스에 bb_bnum을 생성해 이중 bnum을 set해줌
		pageMaker1.setCriteria(criteria);
		pageMaker1.setTotalCount(boardService.countArticles(criteria));
		List<Board> boardList1 = boardService.boardListSelect(criteria);
		model.addAttribute("pageMaker1",pageMaker1);
		model.addAttribute("list1",boardList1);
		logger.info("-----------------");
		logger.info("pageMaker:"+pageMaker1);
		logger.info("boardList:",boardList1);
		
		
		PageMaker pageMaker2 = new PageMaker();
		criteria.setBb_bnum("frequestions"); //리스트 다중 파라미터로 인해 Criteria클래스에 bb_bnum을 생성해 이중 bnum을 set해줌
		pageMaker2.setCriteria(criteria);
		pageMaker2.setTotalCount(boardService.countArticles(criteria));
		List<Board> boardList2 = boardService.boardListSelect(criteria);
		model.addAttribute("pageMaker2",pageMaker2);
		model.addAttribute("list2",boardList2);
		logger.info("-----------------");
		logger.info("pageMaker:"+pageMaker2);
		logger.info("boardList:",boardList2);
		
		Member member = (Member)session.getAttribute("user");
		if(member != null) {
			int mb_id = member.getMb_id();
			//개인공지 알림창
			List<Board> alist = managerService.noread(mb_id);
			model.addAttribute("alist", alist);
			System.out.println("개인공지 알림"+alist);
			
			//안읽은 개인공지 건수
			int acount = managerService.noticecount(mb_id);
			model.addAttribute("acount", acount);
			System.out.println("알림갯수"+acount);
		}
		
		//게시판 공지사항 가져오기
			List<Board> nolist = boardService.boardListAll("notice");
			model.addAttribute("nolist", nolist);
			System.out.println("nolist"+ nolist);
		//게시판 자주하는 질문가져오기
			List<Board> frelist = boardService.boardListAll("frequestions");
			model.addAttribute("frelist", frelist);
			System.out.println("frelist"+ frelist);
		return "home";
	}
	
	
	
	
}
