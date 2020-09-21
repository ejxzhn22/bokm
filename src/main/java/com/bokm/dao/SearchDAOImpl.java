package com.bokm.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.bokm.vo.Review;

@Repository
public class SearchDAOImpl implements SearchDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String nameSpace = "com.bokm.replyMapper";
//	
//	@Override
//	public List<Review> findReplyByICode(String icode){
//
//		return sqlSession.selectList(nameSpace+".findByICodeWithMember",icode);
//	}
	
//	/////////////////////--서평--//////////////////////////
	
//	관리자 더보기 서평조회
	@Override
	public List<Review> reviewMoreList(String rv_icode, int offset) {
		// TODO Auto-generated method stub
		RowBounds row = new RowBounds(offset,5);
		
		return sqlSession.selectList(nameSpace+".reviewListSelectMore",rv_icode,row);
	}
//	사용자 서평 조회
	@Override
	public List<Review> reviewList(Review review) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".reviewListSelect",review);
	}
	@Override
	public void reviewCreate(Review review) {
		// TODO Auto-generated method stub
		sqlSession.insert(nameSpace+".reviewCreate",review);
	}
	@Override
	public void reviewUpdate(Review review) {
		// TODO Auto-generated method stub
		sqlSession.update(nameSpace+".reviewUpdate",review);
	}
	@Override
	public void reviewDelete(int rv_id) {
		// TODO Auto-generated method stub
		sqlSession.delete(nameSpace+".reviewDelete",rv_id);
	}
	@Override
	public List<Map> reviewBookName(int rv_mb_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".reviewbookname",rv_mb_id);
	}

}
