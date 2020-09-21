package com.bokm.dao;

import java.util.List;
import java.util.Map;

import com.bokm.vo.Review;

public interface SearchDAO {
	
//	/////////////////////--서평--//////////////////////////
	
	
	List<Review> reviewMoreList(String rv_icode, int offset);
	List<Review> reviewList(Review review);
	
    void reviewCreate(Review review);

    void reviewUpdate(Review review);

    void reviewDelete(int rv_id);
    
    List<Map> reviewBookName(int rv_mb_id);

}



//	private SqlSession session;
//	
//	private String search = "com.bokm.search.searchMapper";
//	private String reply = "com.bokm.reply.replyMapper";
//	
//	
//	public List<Review> findReplyByICode(String icode){
//			
//		return session.selectList(reply+".findByICodeWithMember",icode);
//	}
//	
//	public void insertReview(Review replyVO) {
//		session.insert(reply+".insertReview", replyVO);
//	}

