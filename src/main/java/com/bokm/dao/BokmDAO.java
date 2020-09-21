package com.bokm.dao;

import java.util.List;

import com.bokm.vo.Board;
import com.bokm.vo.Book;
import com.bokm.vo.BookRequestVO;
import com.bokm.vo.BorrowDetail;

public interface BokmDAO {
	//리퀘스트! 희망 도서 신청해주는 메소드
	public int bookRequest(BookRequestVO bookRequestVO);
	//관리자 페이지! 희망도서 리스트 뽑아주는 메소드
	public List<BookRequestVO> bookRequestList();
	//관리자 페이지! 희망도서 리스트에서 상세보기 시켜주는 메소드
	public BookRequestVO bookRequestListDetail(int br_num);
	//관리자 페이지! 승인상태 1로 바꿔주는 메소드
	public int bookRequestApprove(int br_num);
	//희망도서->책테이블로 이동
	public int bookInsert(Book bookVO);
	//관리자 페이지! 전체 리스트 뽑아주는 메소드
	public List<Book> bookListAll();
	
	//new 새로생긴거 detail입니다
	public Book allbookDetail(String bk_icode);
	//new 추천도서 만들기
	public int recBook(String bk_icode);
	//new 추천도서 리스트만들기
	public List<Book> recBookList();
	//new 추천도서 해제
	public int notrecBook(String bk_icode);
	//new 인기도서 선택
	public List<BorrowDetail> bookPopular();
	
	
}
