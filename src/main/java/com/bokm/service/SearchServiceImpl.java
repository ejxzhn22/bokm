package com.bokm.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bokm.dao.SearchDAO;
import com.bokm.vo.Review;

@Service
public class SearchServiceImpl implements SearchService{
	
	@Inject
	private SearchDAO searchDAO;
	
	@Override
	public void nameSearch(HttpServletRequest req, Model model) {
		String query = req.getParameter("query");
		String page = req.getParameter("page");
		// API에서 자료 검색
		try {
			StringBuilder urlBuilder = new StringBuilder("https://dapi.kakao.com/v3/search/book");
			urlBuilder.append("?" + URLEncoder.encode("query","UTF-8")+"="+URLEncoder.encode(query,"UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("page","UTF-8")+"="+URLEncoder.encode(page,"UTF-8"));
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", " KakaoAK 7f9888630b188059895306cf8f51dd72");
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			JSONParser jsonparser = new JSONParser();
			JSONObject jsonobject = (JSONObject) jsonparser.parse(sb.toString());
			model.addAttribute("result", jsonobject);
			model.addAttribute("query",query);
		}catch(ParseException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void detailView(HttpServletRequest req, Model model) {
		String isbn = req.getParameter("isbn"); //isbn풀코드(통합검색-상세정보)
//		마이페이지 에서 isbn코드를 짤라 뒤에께 들어오는 함수 
		if(isbn.length()>13) {
		String[] split = isbn.split(" ");
		String isbn10 = split[0];
		isbn = split[1];
			
		}
		// API에서 자료 검색
		try {
			StringBuilder urlBuilder = new StringBuilder("https://dapi.kakao.com/v3/search/book");
			urlBuilder.append("?" + URLEncoder.encode("query","UTF-8")+"="+URLEncoder.encode(isbn,"UTF-8"));
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", " KakaoAK 7f9888630b188059895306cf8f51dd72");
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			StringBuilder sb = new StringBuilder();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			JSONParser jsonparser = new JSONParser();
			JSONObject jsonobject = (JSONObject) jsonparser.parse(sb.toString());
			model.addAttribute("result", jsonobject);
//			model.addAttribute("reply", searchDAO.reviewMoreList(isbn, offset));
		}catch(ParseException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	@Override
	public List<Review> reviewMoreList(String rv_icode, int offset) {
		// TODO Auto-generated method stub
		return searchDAO.reviewMoreList(rv_icode, offset);
	}

	@Override
	public List<Review> reviewList(Review review) {
		// TODO Auto-generated method stub
		return searchDAO.reviewList(review);
	}

	@Override
	public void reviewCreate(Review review) {
		// TODO Auto-generated method stub
		searchDAO.reviewCreate(review);
	}

	@Override
	public void reviewUpdate(Review review) {
		// TODO Auto-generated method stub
		searchDAO.reviewUpdate(review);
	}

	@Override
	public void reviewDelete(int rv_id) {
		// TODO Auto-generated method stub
		searchDAO.reviewDelete(rv_id);
	}

	@Override
	public List<Map> reviewBookName(int rv_mb_id) {
		// TODO Auto-generated method stub
		return searchDAO.reviewBookName(rv_mb_id);
	}
	
}
