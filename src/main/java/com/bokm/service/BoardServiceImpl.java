package com.bokm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bokm.dao.BoardDAO;
import com.bokm.vo.Board;
import com.bokm.vo.BoardReply;
import com.bokm.vo.Criteria;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	BoardDAO boardDAO;
	
//	게시판 전체 리스트 조회(관리자)
	@Override
	public List<Board> boardListAll(String bb_bnum) {
		// TODO Auto-generated method stub
		return boardDAO.boardListAll(bb_bnum);
	}
	
//	게시판 해당 고유번호로 리스트 조회
	@Override
	public List<Board> boardListSelect(Criteria criteria) {
		// TODO Auto-generated method stub
		return boardDAO.boardListSelect(criteria);
	}
	
	@Override
	public int countArticles(Criteria criteria) {
		// TODO Auto-generated method stub
		return boardDAO.countArticles(criteria);
	}
	
//	게시판 상세 정보보기 조회
	@Override
	public Board boardDetail(int bb_num) {
		// TODO Auto-generated method stub
		return boardDAO.boardDetail(bb_num);
	}
//	게시판 해당 글 조회수
	@Override
	public int boardCntDetail(int bb_num) {
		// TODO Auto-generated method stub
		return boardDAO.boardCntDetail(bb_num);
	}

//	게시팔 글 추가
	@Override
	public int boardInsert(Board board) {
		// TODO Auto-generated method stub
		return boardDAO.boardInsert(board);
	}

	@Override
	public int boardUpdate(Board board) {
		// TODO Auto-generated method stub
		return boardDAO.boardUpdate(board);
	}

	@Override
	public int boardDelete(int bb_num) {
		// TODO Auto-generated method stub
		return boardDAO.boardDelete(bb_num);
	}
	
	//내가쓴글 갯수
	@Override
	public int boardcount(int mb_id) {
		// TODO Auto-generated method stub
		return boardDAO.boardcount(mb_id);
	}
	@Override
	public List<Board> myboard(int mb_id) {
		// TODO Auto-generated method stub
		return boardDAO.myboard(mb_id);
	}

		
//	관리자 더보기 댓글조회
	@Override
	public List<BoardReply> boardReplyMoreList(int rp_bb_num, int offset){
		
		return boardDAO.boardReplyMoreList(rp_bb_num, offset);
	}
//	사용자 댓글조회
	@Override
	public List<BoardReply> boardReplyList(int rp_bb_num) {
		// TODO Auto-generated method stub
		return boardDAO.boardReplyList(rp_bb_num);
	}
	@Override
	public void create(BoardReply boardReply) {
		// TODO Auto-generated method stub
		boardDAO.create(boardReply);
		
	}

	@Override
	public void update(BoardReply boardReply) {
		// TODO Auto-generated method stub
		boardDAO.update(boardReply);
	}

	@Override
	public void delete(int rp_num) {
		// TODO Auto-generated method stub
		boardDAO.delete(rp_num);
	}

	
}
