package com.bokm.controller;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
public class BoardController {
//	board/noticeboardlist,board/frequestionsboardlist,board/qnaboardlist
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Inject
	private BoardService boardService;
	@Inject
	private MemberService memberService;
	
////	게시판 전체 리스트 조회
//	@RequestMapping(value="admin/board/boardlistadmin", method = RequestMethod.GET)
//	public String boardListView(Board board, Model model) {
//		List<Board> boardList = boardService.boardListAll();
//		model.addAttribute("list",boardList);
//		return "boardlist";
//	}
	
//	게시판 해당 고유번호로 리스트 조회
	@RequestMapping(value="board/boardlist", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardListSelectView(@RequestParam ("bb_bnum") String bb_bnum,Board board, Model model,Criteria criteria) {
		
		System.out.println("==============검색중=====================");
		
		PageMaker pageMaker = new PageMaker();
		criteria.setBb_bnum(bb_bnum); //리스트 다중 파라미터로 인해 Criteria클래스에 bb_bnum을 생성해 이중 bnum을 set해줌
		
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countArticles(criteria));
		List<Board> boardList = boardService.boardListSelect(criteria);
		
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("list",boardList);
		logger.info("-----------------");
		logger.info("pageMaker:"+pageMaker);
		logger.info("boardList:",boardList);

		return bb_bnum+"boardlist";
	}

	
//	////////////////////////////////////////////////////////////////////////////
	
//	게시판 상세 정보보기 조회
	@RequestMapping(value="board/boarddetail", method = {RequestMethod.GET,RequestMethod.POST})
	public String boardDetailView(Board board, Model model,@ModelAttribute("criteria") Criteria criteria, HttpServletRequest req, HttpSession session) {
		
		if(session.getAttribute("user")==null) {
			model.addAttribute("msg","로그인하신 후에 이용해 주세요.");
			model.addAttribute("url","/login");
			return "alert";
		}
		boardService.boardCntDetail(board.getBb_num()); //조회수 증가
		board = boardService.boardDetail(board.getBb_num());
		model.addAttribute("board",board);
		return "boarddetail";
	}
	
//	///////////////////////////////////////////////////////////////////////////
//	게시글 추가
	@RequestMapping(value="board/boardinsert", method = RequestMethod.GET)
	public String boardInsert(Model model,Board board) {
		return "boardinsert";
	}
	@RequestMapping(value="board/boardinsert", method = RequestMethod.POST)
	public String boardInsertView(MultipartFile file,MultipartHttpServletRequest multi, Member member, Model model,Board board) {
		//System.out.println(member);
		//logger.info("member="+member);
		String fileTag = "ufile";
		
//		String filePath = "D:\\bookworkspace\\bokm\\src\\main\\webapp\\resources\\uploadfile\\";
//		getRealPath 까지는 프로젝트의 네임(/bokm) 까지 나옴,, webapp/ 이후부터 경로를 getRealPath에 설정 
		String filePath = multi.getSession().getServletContext().getRealPath("resources/uploadfile/");
		System.out.println("절대경로 테스트============="+multi.getSession().getServletContext().getRealPath("resources/uploadfile/"));
		file = multi.getFile(fileTag);
		System.out.println(file);
		String fileName = file.getOriginalFilename();
		
		try {
			file.transferTo(new File(filePath + fileName));
		}catch(Exception e) {
			System.out.println("업로드 오류");
		}
		
		board.setBb_image(fileName);
		member = memberService.idCheck(member.getMb_email());
		board.setBb_id(member.getMb_id());
		board.setBb_name(member.getMb_name());
		
		int r = boardService.boardInsert(board);
		if(r>0) {
			logger.info("boardinsertPost="+board);
			model.addAttribute("msg", "게시글 작성완료");
			model.addAttribute("url", "boardlist?bb_bnum="+board.getBb_bnum());
			return "alert";
		}
		return "redirect:boardinsert";
	}
	
//	////////////////////////////////////////////////////////////////////////////
//	게시글 수정
	@RequestMapping(value="board/boardupdate", method = RequestMethod.GET)
	public String boardUpdate(Model model,Board board,@ModelAttribute("criteria") Criteria criteria) {
		logger.info("boardupdateGET="+criteria);
		board = boardService.boardDetail(board.getBb_num());
		model.addAttribute("board",board);
		return "boardupdate";
	}
	@RequestMapping(value="board/boardupdate", method = RequestMethod.POST)
	public String boardUpdateView(MultipartHttpServletRequest multi,MultipartFile file,Model model,Board board,Criteria criteria) {
		Board board2 = boardService.boardDetail(board.getBb_num());
		String basePath=multi.getSession().getServletContext().getRealPath("resources/uploadfile/");

		String fileTag = "ufile";
		file = multi.getFile(fileTag);
		String fileName = file.getOriginalFilename();
		
		if(file.getSize()>0) {
			try {
				file.transferTo(new File(basePath + fileName));
				board.setBb_image(fileName);
				System.out.println(board.getBb_image());
			}catch (Exception e) {
				System.out.println("업로드 오류");
			}
		}else {
			board.setBb_image(board2.getBb_image());
			System.out.println("이미지 수정 안했을때 board:"+board);
		}
		int r = boardService.boardUpdate(board);
		if(r>0) {
			logger.info("boardupdatePost="+criteria);
			
			model.addAttribute("msg", "게시글 수정완료");
			model.addAttribute("url", "boardlist?bb_bnum="+criteria.getBb_bnum()+"&searchType="+criteria.getSearchType()
														+"&keyword="+criteria.getKeyword()+"&page="+criteria.getPage());
			return "alert";
		}
		return "redirect:boardupdate";
	}
	
//	////////////////////////////////////////////////////////////
//	게시글 삭제
	@RequestMapping(value="board/boarddelete",method = RequestMethod.GET)
	public String delete(Model model,Board board,Criteria criteria,PageMaker pageMaker) {
		System.out.println("boarddelete"+board);
		System.out.println(criteria.getBb_bnum());
		System.out.println("P"+criteria.getPage());
		
		int r = boardService.boardDelete(board.getBb_num());
		if(r > 0) {
			model.addAttribute("msg","게시글 삭제 완료 되었습니다.");
			model.addAttribute("url","boardlist?bb_bnum="+criteria.getBb_bnum()+"&searchType="+criteria.getSearchType()
													+"&keyword="+criteria.getKeyword()+"&page="+criteria.getPage());
//			model.addAttribute("url","boardlist?"+pageMaker.makeSearch(criteria.getPage())+"&bb_bnum="+criteria.getBb_bnum());
			return "alert";
		}
		return "redirect:boarddetail?bb_num=" + board.getBb_num();
	}
	
//	////////////////////////////댓글////////////////////////////////////////////////////

//  boardReply rp_bb_num 타입 고쳐야함 int로
//	댓글 리스트
	@ResponseBody
	@RequestMapping(value="board/replylist", method=RequestMethod.POST)
	public ResponseEntity<List<BoardReply>> replyList(@RequestParam("bb_num") int bb_num, BoardReply boardReply){
		boardReply.setRp_bb_num(bb_num);
		logger.info("replylist"+boardReply);
		ResponseEntity<List<BoardReply>> entity = null;
		try {
			entity = new ResponseEntity<List<BoardReply>>(boardService.boardReplyList(boardReply.getRp_bb_num()),HttpStatus.OK);
			logger.info("replylist"+entity);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<BoardReply>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	

//	댓글 등록
//	@RequestBody 를 쓰려면 ajax코드에서 "Content-type" : "application/json"을 사용하여 변환하여야한다.
//	또한  data : JSON.stringify({data})를 선언 해줘야한다.
	@ResponseBody
	@RequestMapping(value="board/replyinsert", method=RequestMethod.POST)
	public ResponseEntity<String> replyRegister(BoardReply boardReply) {
		ResponseEntity<String> entity = null;
		try {
			boardService.create(boardReply);
			logger.info("replyinsert"+boardReply);
			entity = new ResponseEntity<>("regSuccess",HttpStatus.OK);
			logger.info("replyinsert"+entity);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

//	댓글 수정 ajax
//	@PathVariable 은 사용 불가. ajax코드에서 조건을 맞춰줘야함
	@ResponseBody
	@RequestMapping(value="board/replyupdate", method= RequestMethod.POST)
	public ResponseEntity<String> replyUpdate(@RequestParam("rp_num") int rp_num,BoardReply boardReply) {
		ResponseEntity<String> entity = null;
	    try {
	        boardReply.setRp_num(rp_num);
	        boardService.update(boardReply);
	        entity = new ResponseEntity<String>("modSuccess", HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
		return entity;

	}

//	댓글삭제
	@ResponseBody
	@RequestMapping(value="board/replydelete", method=RequestMethod.POST)
	public ResponseEntity<String> replyDelete(@RequestParam("rp_num") int rp_num) {
		 logger.info("rpnum"+rp_num);
		ResponseEntity<String> entity = null;
		    try {
		        boardService.delete(rp_num);
		        entity = new ResponseEntity<>("delSuccess", HttpStatus.OK);
		    } catch (Exception e) {
		        e.printStackTrace();
		        entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		    }

		return entity;
	}
	
	
	
}
