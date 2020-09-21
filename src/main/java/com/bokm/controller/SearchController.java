package com.bokm.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bokm.service.ManagerService;
import com.bokm.service.SearchService;
import com.bokm.vo.BoardReply;
import com.bokm.vo.Book;
import com.bokm.vo.Review;

@Controller
public class SearchController {
	
	@Inject
	private SearchService searchService;
	@Inject
	private ManagerService managerService;
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(HttpServletRequest req,Model model,HttpSession session) {
		if(session.getAttribute("user")==null) {
			model.addAttribute("msg","로그인 하세요");
			model.addAttribute("url","login");
			return "alert";
		}
		searchService.nameSearch(req, model);
		
		return "search";
	}
	@RequestMapping(value="/search/detail", method=RequestMethod.GET)
	public String detail(HttpServletRequest req, Model model, @RequestParam("isbn") String isbn) {
		System.out.println(isbn);
		searchService.detailView(req, model);
		String bk_icode = isbn;
		if(isbn.length()>13) {
			String[] split = isbn.split(" ");
			String isbn10 = split[0];
			bk_icode = split[1];
			}
		
		List list = managerService.isbndetail(bk_icode);
		System.out.println("list"+list);
	    Book book = managerService.selectbook(bk_icode);
	    
	    System.out.println("book"+book);
	    
	    model.addAttribute("isbn", bk_icode);
	    model.addAttribute("reserlist", list);
	    model.addAttribute("book",book);
		
		return "detail";
	}
	
//	/////////////////////////////////////////////////////////////////////
//	댓글 리스트
	
	@ResponseBody
	@RequestMapping(value="review/moreList", method=RequestMethod.POST)
	public ResponseEntity<List<Review>> ReviewMoreList(@RequestParam("rv_icode") String rv_icode,@RequestParam("offset") int offset, Review review){
		
		review.setRv_icode(rv_icode);
		ResponseEntity<List<Review>> entity = null;
		try {
			entity = new ResponseEntity<List<Review>>(searchService.reviewMoreList(review.getRv_icode(),offset),HttpStatus.OK);
			System.out.println("ett=="+entity);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<Review>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	
	}
//	댓글 등록
	@ResponseBody
	@RequestMapping(value="review/replyinsert", method=RequestMethod.POST)
	public ResponseEntity<String> ReviewRegister(Review review){
		ResponseEntity<String> entity = null;
		try {
			searchService.reviewCreate(review);
			entity = new ResponseEntity<>("regSuccess",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
//	댓글 수정
	@ResponseBody
	@RequestMapping(value="review/replyupdate", method=RequestMethod.POST)
	public ResponseEntity<String> ReviewUpdate(@RequestParam("rv_id") int rv_id,Review review){
		ResponseEntity<String> entity = null;
		try {
			review.setRv_id(rv_id);
			searchService.reviewUpdate(review);
			entity = new ResponseEntity<>("modSuccess",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
//	댓글 삭제
	@ResponseBody
	@RequestMapping(value="review/replydelete", method=RequestMethod.POST)
	public ResponseEntity<String> ReviewDelete(@RequestParam("rv_id") int rv_id){
		ResponseEntity<String> entity = null;
		try {
			searchService.reviewDelete(rv_id);
			entity = new ResponseEntity<>("delSuccess", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
