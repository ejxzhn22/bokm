package com.bokm.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bokm.vo.Board;
import com.bokm.vo.BoardReply;
import com.bokm.vo.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String nameSpace = "com.bokm.boardMapper";
	
//	게시판 전체 리스트 조회
	@Override
	public List<Board> boardListAll(String bb_bnum) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".boardListAlll",bb_bnum);
	}
	
//	게시판 해당 고유번호로 리스트 조회
	@Override
	public List<Board> boardListSelect(Criteria criteria) {
		// TODO Auto-generated method stub
		
		
		return sqlSession.selectList(nameSpace+".boardListSelect",criteria);
	}
	
//	전체 개시글 갯수 구하는 메소드(페이징처리)
	@Override
	public int countArticles(Criteria criteria) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace+".countArticles",criteria);
	}
//	///////////////////////////////////////////////////////////////////////////////

//	게시판 상세 정보보기 조회
	@Override
	public Board boardDetail(int bb_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace+".boardDetail",bb_num);
	}

//	게시판 해당 글 조회수
	@Override
	public int boardCntDetail(int bb_num) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace+".boardCntUpdate",bb_num);
	}
	
	
//	게시판 글 추가
	@Override
	public int boardInsert(Board board) {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace+".boardInsert",board);
	}

//	게시판 글 수정
	@Override
	public int boardUpdate(Board board) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace+".boardUpdate",board);
	}

//	게시판 글 삭제
	@Override
	public int boardDelete(int bb_num) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace+".boardDelete",bb_num);
	}
	
	//내가쓴글 갯수
	@Override
	public int boardcount(int mb_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace+".boardcount", mb_id);
	}
	//내가쓴글 목록
	@Override
	public List<Board> myboard(int mb_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".myboard", mb_id);
	}

//	/////////////////////////--댓글--//////////////////////
//	관리자 더보기 댓글조회
	@Override
	public List<BoardReply> boardReplyMoreList(int rp_bb_num, int offset) {
		RowBounds row = new RowBounds(offset,5);
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".boardReplyListSelectMore",rp_bb_num,row);
	}
//	사용자 댓글조회
	@Override
	public List<BoardReply> boardReplyList(int rp_bb_num) {
//		RowBounds row = new RowBounds(offset,5);
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".boardReplyListSelect",rp_bb_num);
	}

	@Override
	public void create(BoardReply boardReply) {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace+".boardReplyCreate",boardReply);
	}

	@Override
	public void update(BoardReply boardReply) {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace+".boardReplyUpdate",boardReply);
	}

	@Override
	public void delete(int rp_num) {
		// TODO Auto-generated method stub
		sqlSession.delete(nameSpace+".boardReplyDelete",rp_num);
		
	}
	

	

}
