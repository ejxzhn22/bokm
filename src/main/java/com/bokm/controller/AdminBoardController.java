package com.bokm.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.fileupload.UploadContext;
//import org.omg.CORBA.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bokm.service.BoardService;
import com.bokm.service.MemberService;
import com.bokm.vo.Board;
import com.bokm.vo.BoardReply;
import com.bokm.vo.Criteria;
import com.bokm.vo.Member;
import com.bokm.vo.PageMaker;

@Controller
public class AdminBoardController {
//	board/noticeboardlist,board/frequestionsboardlist,board/qnaboardlist
	@Inject
	private BoardService boardService;
	@Inject
	private MemberService memberService;
	
//	게시판 종류 리스트 조회
	@RequestMapping(value="admin/boardlist", method = RequestMethod.GET)
	public String AdminboardKindList(Board board, Model model,Criteria criteria) {
		System.out.println("==============검색중=====================");
		
		criteria.setBb_bnum("notice");
		int noticecount = boardService.countArticles(criteria);
		model.addAttribute("ncount", noticecount);
		
		criteria.setBb_bnum("frequestions");
		int frequestionscount = boardService.countArticles(criteria);
		model.addAttribute("fcount", frequestionscount);
		
		criteria.setBb_bnum("qna");
		int qnacount = boardService.countArticles(criteria);
		model.addAttribute("qcount", qnacount);
	
	
		
		return "admin/boardlist";
	}
	
//	게시판 전체 리스트 조회
	@RequestMapping(value="admin/boardlist2", method = {RequestMethod.GET, RequestMethod.POST})
	public String AdminboardListView(@RequestParam ("bb_bnum") String bb_bnum,Board board, Model model) {
		List<Board> boardList = boardService.boardListAll(bb_bnum);
		model.addAttribute("list",boardList);
		return "admin/"+bb_bnum+"boardlist";
	}
	
	
//	////////////////////////////////////////////////////////////////////////////
	
//	게시판 상세 정보보기 조회
	@RequestMapping(value="admin/boarddetail", method = RequestMethod.GET)
	public String AdminboardDetailView(Board board, Model model) {
		
		board = boardService.boardDetail(board.getBb_num());
		System.out.println(board);
		model.addAttribute("board",board);
		return "admin/boarddetail";
	}
	
//	///////////////////////////////////////////////////////////////////////////
//	게시글 추가
	@RequestMapping(value="admin/boardinsert", method = RequestMethod.GET)
	public String AdminboardInsert(Model model,Board board) {
		return "admin/boardinsert";
	}
	@RequestMapping(value="admin/boardinsert", method = RequestMethod.POST)
	public String AdminboardInsertView(MultipartFile file,MultipartHttpServletRequest multi, Member member, Model model,Board board) {
		String fileTag = "ufile";
		
//		String filePath = "D:\\bookworkspace\\bokm\\src\\main\\webapp\\resources\\uploadfile\\";
		String filePath = multi.getSession().getServletContext().getRealPath("resources/uploadfile/");
		file = multi.getFile(fileTag);
		System.out.println(file);
		String fileName = file.getOriginalFilename();
		
		try {
			file.transferTo(new File(filePath + fileName));
		}catch(Exception e) {
			System.out.println("업로드 오류");
		}
		
		board.setBb_image(fileName);
		System.out.println(board.getBb_image());
		
		member = memberService.idCheck(member.getMb_email());
		board.setBb_id(member.getMb_id());
		board.setBb_name(member.getMb_name());
		
		int r = boardService.boardInsert(board);
		if(r>0) {
			model.addAttribute("msg", "게시글 작성완료");
			model.addAttribute("url", "../admin/boardlist?bb_bnum="+board.getBb_bnum());
			return "alert";
		}
		return "redirect:admin/boardinsert";
	}
	
//	////////////////////////////////////////////////////////////////////////////
//	게시글 수정
	@RequestMapping(value="admin/boardupdate", method = RequestMethod.GET)
	public String AdminboardUpdate(Model model,Board board) {
//		logger.info("boardupdateGET="+criteria);
		board = boardService.boardDetail(board.getBb_num());
		model.addAttribute("board",board);
		System.out.println(board);
		return "admin/boardupdate";
	}
	@RequestMapping(value="admin/boardupdate", method = RequestMethod.POST)
	public String AdminboardUpdateView(MultipartHttpServletRequest multi,MultipartFile file,Model model,Board board) {
		Board board2 = boardService.boardDetail(board.getBb_num());
		String basePath=multi.getSession().getServletContext().getRealPath("resources/uploadfile/");

		String fileTag = "ufile";
		file = multi.getFile(fileTag);
		String fileName = file.getOriginalFilename();
		if(file.getSize()>0) {
			try {
				file.transferTo(new File(basePath + fileName));
				board.setBb_image(fileName);
			}catch (Exception e) {
				System.out.println("업로드 오류");
			}
		}else {
			board.setBb_image(board2.getBb_image());
			System.out.println("이미지 수정 안했을때 board:"+board);
		}

		int r = boardService.boardUpdate(board);
		System.out.println("이미지 수정 했을때 board:"+board);
		if(r>0) {
//			logger.info("boardupdatePost="+criteria);
			
			model.addAttribute("msg", "게시글 수정완료");
			model.addAttribute("url", "../admin/boardlist?bb_bnum="+board.getBb_bnum());
			return "alert";
		}
		return "redirect:admin/boardupdate";
	}
	
//	////////////////////////////////////////////////////////////
//	게시글 삭제
	@RequestMapping(value="admin/boarddelete",method = RequestMethod.GET)
	public String Admindelete(Model model,Board board) {
		System.out.println("boarddelete"+board);
		int r = boardService.boardDelete(board.getBb_num());
		if(r > 0) {
			model.addAttribute("msg","게시글 삭제 완료 되었습니다.");
			model.addAttribute("url","../admin/boardlist2?bb_bnum="+board.getBb_bnum());
//			model.addAttribute("url","boardlist?"+pageMaker.makeSearch(criteria.getPage())+"&bb_bnum="+criteria.getBb_bnum());
			return "alert";
		}
		return "redirect:admin/boarddetail?bb_num=" + board.getBb_num();
	}
		
//	/////////////////////////////////////////////////////////////////////
//	댓글 리스트
	
	@ResponseBody
	@RequestMapping(value="admin/moreList", method=RequestMethod.POST)
	public ResponseEntity<List<BoardReply>> AdminReplyMoreList(@RequestParam("bb_num") int bb_num,@RequestParam("offset") int offset, BoardReply boardReply){
		
		boardReply.setRp_bb_num(bb_num);
		ResponseEntity<List<BoardReply>> entity = null;
		try {
			entity = new ResponseEntity<List<BoardReply>>(boardService.boardReplyMoreList(boardReply.getRp_bb_num(),offset),HttpStatus.OK);

		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<BoardReply>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	
	}
//	댓글 등록
	@ResponseBody
	@RequestMapping(value="admin/replyinsert", method=RequestMethod.POST)
	public ResponseEntity<String> AdminReplyRegister(BoardReply boardReply){
		ResponseEntity<String> entity = null;
		try {
			boardService.create(boardReply);
			entity = new ResponseEntity<>("regSuccess",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
//	댓글 수정
	@ResponseBody
	@RequestMapping(value="admin/replyupdate", method=RequestMethod.POST)
	public ResponseEntity<String> AdminReplyUpdate(@RequestParam("rp_num") int rp_num,BoardReply boardReply){
		ResponseEntity<String> entity = null;
		try {
			boardReply.setRp_num(rp_num);
			boardService.update(boardReply);
			entity = new ResponseEntity<>("modSuccess",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
//	댓글 삭제
	@ResponseBody
	@RequestMapping(value="admin/replydelete", method=RequestMethod.POST)
	public ResponseEntity<String> AdminReplyDelete(@RequestParam("rp_num") int rp_num){
		ResponseEntity<String> entity = null;
		try {
			boardService.delete(rp_num);
			entity = new ResponseEntity<>("delSuccess", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
