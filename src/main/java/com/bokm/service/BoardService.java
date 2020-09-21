package com.bokm.service;

import java.util.List;

import javax.inject.Inject;

import com.bokm.vo.Board;
import com.bokm.vo.BoardReply;
import com.bokm.vo.Criteria;

public interface BoardService {
	 
//	게시판 전체 리스트 조회(관리자)
	public List<Board> boardListAll(String bb_bnum);
	
//	게시판 해당 고유번호로 리스트 조회
	public List<Board> boardListSelect(Criteria criteria);
	
//	전체 개시글 갯수 구하는 메소드(페이징처리)
	public int countArticles(Criteria criteria);
	
//	게시판 상세 정보보기 조회
	public Board boardDetail(int bb_num);
//	게시판 조회수 증가 
	public int boardCntDetail(int bb_num);
	
//	게시판 글 추가
	public int boardInsert(Board board);
	
//	게시판 글 수정
	public int boardUpdate(Board board);
	
//	게시판 글 삭제
	public int boardDelete(int bb_num);
	
//	내가쓴글 갯수
    public int boardcount(int mb_id);
//	내가쓴글 목록
    public List<Board> myboard(int mb_id);

//	/////////////////////--댓글--//////////////////////////
	
	
	List<BoardReply> boardReplyMoreList(int rp_bb_num,int offset);
	List<BoardReply> boardReplyList(int rp_bb_num);

    void create(BoardReply boardReply);

    void update(BoardReply boardReply);

    void delete(int rp_num);
}
