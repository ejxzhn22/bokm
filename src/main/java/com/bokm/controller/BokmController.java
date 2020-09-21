package com.bokm.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bokm.dao.SearchDAO;
import com.bokm.service.BokmService;
import com.bokm.service.DeliveryService;
import com.bokm.service.ManagerService;
import com.bokm.vo.Board;
import com.bokm.vo.Book;
import com.bokm.vo.BookRequestVO;
import com.bokm.vo.BorrowDetail;
import com.bokm.vo.Criteria;
import com.bokm.vo.PageMaker;
import com.bokm.vo.Review;


@Controller
public class BokmController {

	@Inject
	BokmService bokmService;
	
	@Inject
	ManagerService managerService;
	@Inject
	DeliveryService deliveryService;
	private static final Logger logger = LoggerFactory.getLogger(BokmController.class);
	
	@RequestMapping(value="mypage",method=RequestMethod.GET)
	public String mypage() {
		logger.info("마이페이지입니다.");
		return "mypage";
	}
	@RequestMapping(value="bookRequestSearch",method=RequestMethod.GET)
	public String bookRequestSearch(Model model,HttpSession session) {
		logger.info("서치창입니다.");
		if(session.getAttribute("user")==null) {
			model.addAttribute("msg","로그인 하세요");
			model.addAttribute("url","login");
			return "alert";
		}
		
		return "bookRequestSearch";
	}
	
	//희망도서 디테일
	@RequestMapping(value="bookRequestDetail",method=RequestMethod.GET)
	public String detail(@RequestParam("isbn") String isbn,Model model) {
		logger.info("디테일 창입니다.");
		
		String bk_icode = isbn.split(" ")[1];
	    System.out.println(isbn);
	    List list = managerService.isbndetail(bk_icode);
	    model.addAttribute("isbn",isbn);
	    model.addAttribute("reserlist", list);
		
		return "bookRequestDetail";
	}
	@RequestMapping(value="bookRequestInfo",method=RequestMethod.GET)
	public String bookRequestInfo() {
		logger.info("희망도서 안내 창입니다.");
		
		return "bookRequestInfo";
	}
	@RequestMapping(value="bookServiceInfo",method=RequestMethod.GET)
	public String bookServiceInfo() {
		logger.info(" 안내 창입니다.");
		
		return "bookServiceInfo";
	}
	
	@RequestMapping(value="bookRequestForm",method=RequestMethod.GET)
	public String bookRequest(@RequestParam("isbn")String isbn,Model model,Locale locale) {
		logger.info("책 신청 창입니다.");
		logger.info("isbn 코드는 "+isbn+"입니다.");
		model.addAttribute("isbn", isbn);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String Date = dateFormat.format(date);
		
		model.addAttribute("time", Date );
		
		return "bookRequestForm";
	}
	@RequestMapping(value="bookRequestForm",method=RequestMethod.POST)
	public String bookRequest(BookRequestVO bookRequestVO,RedirectAttributes rttr) {
		logger.info("책 신청 창입니다.(포스트)");
		logger.info("VO는 "+bookRequestVO);
		int r = bokmService.bookRequest(bookRequestVO);
		logger.info("r은"+r);
		if(r>0) {
		rttr.addFlashAttribute("msg","희망도서 신청 완료되었습니다.");
		return "redirect:bookRequestSearch";
		}
		rttr.addFlashAttribute("msg","이미 도서관에 있는 책입니다.");
		return "redirect:bookRequestSearch";
	}

	/*
	 * @RequestMapping(value="admin/adminHome",method=RequestMethod.GET) public
	 * String adminHome() { logger.info("관리자 화면입니다.");
	 * 
	 * return "admin/adminHome"; }
	 */
	@RequestMapping(value="admin/bookRequestListManager",method=RequestMethod.GET)
	public String bookRequestList(Model model,BookRequestVO bookRequestVO) {
		logger.info("관리자 전용 희망도서 관리 창입니다.");
		bokmService.bookRequestList();
		model.addAttribute("list", bokmService.bookRequestList());
		
		return "admin/bookRequestListManager";
	}
	@RequestMapping(value="admin/bookRequestListDetailManager",method=RequestMethod.GET)
	public String bookRequestListDetail(@RequestParam ("br_num")int br_num,BookRequestVO bookRequestVO,Model model) {
		logger.info("관리자 전용 희망도서 디테일 창입니다.");
		bookRequestVO=bokmService.bookRequestListDetail(br_num);
		model.addAttribute("brd", bookRequestVO);
		model.addAttribute("isbn", bookRequestVO.getBr_bcode());
		return "admin/bookRequestListDetailManager";
	}
	@RequestMapping(value="admin/bookRequestListDetailManager",method=RequestMethod.POST)
	public String bookRequestListDetail(@RequestParam ("br_num")int br_num,BookRequestVO bookRequestVO,Model model,Book bookVO,RedirectAttributes rttr) {
		logger.info("관리자 전용 희망도서 디테일 창에서 승인 누를 때 입니다.");
//		logger.info("book"+bookVO);
		int r = bokmService.bookRequestApprove(br_num);//situation 1로 바꿔주는거
		bokmService.bookInsert(bookVO);
		return "redirect:/admin/adminHome";
	}
	@RequestMapping(value="admin/allBook", method=RequestMethod.GET)
	public String allBook(Book book, Model model) {
		logger.info("관리자 전용 책 다 보기");
		bokmService.bookListAll();
		model.addAttribute("book", bokmService.bookListAll());
		
		return "admin/allBook";
	}
	
	//bookadd 이동
	@RequestMapping(value="admin/bookadd", method=RequestMethod.GET)
	public String bookadd() {
		
		return "admin/bookadd";
	}
	
		
	// 책추가 하기
		@RequestMapping(value="admin/bookInsert", method=RequestMethod.POST)
		public String bookadd(Book book,Model model) {
			System.out.println("book"+book);
			book.setBk_icode(book.getBk_icode().split(" ")[1]);
			int r = bokmService.bookInsert(book);
			
			if(r>0) {
				model.addAttribute("msg","책이 추가되었습니다.");
				model.addAttribute("url", "/admin/allBook");
				
				return "alert";
			}
			return "admin/bookadd";
		}
	
	//new
	  @RequestMapping(value="admin/allBookDetail",method=RequestMethod.GET) 
	  public String allBookDetail(@RequestParam("bk_icode")String bk_icode,Model model) { 
		  logger.info(" 전체 책 상세보기입니다.");
		  model.addAttribute("abd", bokmService.allbookDetail(bk_icode));
		  return "admin/allBookDetail"; 
	  }
	  
	  @RequestMapping(value="admin/allBookDetail",method=RequestMethod.POST) 
	  public String allBookDetail(@RequestParam("bk_icode")String bk_icode) { 
		  logger.info(" 전체 책 상세보기입니다.(포스트)");
		  bokmService.recBook(bk_icode); //1로 바꿔주는 구문
		  return "admin/adminHome"; 
	  }

	  @RequestMapping(value="admin/recBook",method=RequestMethod.GET) 
	  public String recBook(Model model) { 
		  logger.info("추천 책 보기입니다.");
		  model.addAttribute("rec", bokmService.recBookList());
		  return "admin/recBook"; 
	  }

	  @RequestMapping(value="admin/recBook_Popup",method=RequestMethod.GET) 
	  public String recBookPopup(@RequestParam("bk_icode")String bk_icode,Model model) { 
		  logger.info("추천 책 팝업입니다.");
		  model.addAttribute("rbp", bokmService.allbookDetail(bk_icode));
		  return "admin/recBook_Popup"; 
	  }

	  @RequestMapping(value="admin/recBook_Popup",method=RequestMethod.POST) 
	  public String recBookPopup(@RequestParam("bk_icode")String bk_icode) { 
		  logger.info("추천 책 팝업입니다.(포스트)");
		  bokmService.notrecBook(bk_icode);
		  return "admin/recBook_Popup"; 
	  }

	  @RequestMapping(value="bookRecommend",method=RequestMethod.GET) 
	  public String recommend(Model model) { 
		  logger.info("추천도서 입니다.");
		  model.addAttribute("brd", bokmService.recBookList());
		  return "bookRecommend"; 
	  }

	  @RequestMapping(value="bookPopular",method=RequestMethod.GET) 
	  public String bookPopular(Model model) { 
		  logger.info("인기도서 입니다.");
		 List<BorrowDetail> list = bokmService.bookPopular();
		 List<Book> bookList=new ArrayList();
		 for(int i=0; i<list.size(); i++) {
			  Book book=bokmService.allbookDetail(list.get(i).getBd_bcode());
			  book.setBk_sg_num(list.get(i).getBd_count());
			  bookList.add(book);
		 }
		  model.addAttribute("pop", bookList);
		  return "bookPopular"; 
	  }

	  
	  @RequestMapping(value="allBookSearch",method=RequestMethod.GET) 
	  public String allBookSearch( Model model,Criteria criteria) throws Exception { 
		  logger.info("전체도서서치 입니다.");
			PageMaker pageMaker = new PageMaker();
			
			pageMaker.setCriteria(criteria);
			pageMaker.setTotalCount(1000);
			
			model.addAttribute("dvlist", deliveryService.bookListAll(criteria));
			
			model.addAttribute("pageMaker", pageMaker);
		  return "allBookSearch"; 
	  }
}