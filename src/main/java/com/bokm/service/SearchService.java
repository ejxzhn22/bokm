package com.bokm.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.bokm.vo.Review;


public interface SearchService {
	 
	public void nameSearch(HttpServletRequest req, Model model);
	
	public void detailView(HttpServletRequest req, Model model);
	
	List<Review> reviewMoreList(String rv_icode, int offset);
	List<Review> reviewList(Review review);
	
    void reviewCreate(Review review);

    void reviewUpdate(Review review);

    void reviewDelete(int rv_id);
    
    List<Map> reviewBookName(int rv_mb_id);
}
