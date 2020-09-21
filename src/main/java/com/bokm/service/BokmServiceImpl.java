package com.bokm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bokm.dao.BokmDAO;
import com.bokm.vo.Book;
import com.bokm.vo.BookRequestVO;
import com.bokm.vo.BorrowDetail;

@Service
public class BokmServiceImpl implements BokmService {

	@Inject
	BokmDAO bokmDAO;
	
	@Override
	public int bookRequest(BookRequestVO bookRequestVO) {
		return bokmDAO.bookRequest(bookRequestVO);
	}

	@Override
	public List<BookRequestVO> bookRequestList() {
		return bokmDAO.bookRequestList();
	}

	@Override
	public BookRequestVO bookRequestListDetail(int br_num) {
		
		return bokmDAO.bookRequestListDetail(br_num);
	}

	@Override
	public int bookRequestApprove(int br_num) {
		// TODO Auto-generated method stub
		return bokmDAO.bookRequestApprove(br_num);
	}

	@Override
	public int bookInsert(Book bookVO) {
		// TODO Auto-generated method stub
		return bokmDAO.bookInsert(bookVO);
	}

	@Override
	public List<Book> bookListAll() {
		// TODO Auto-generated method stub
		return bokmDAO.bookListAll();
	}

	@Override
	public Book allbookDetail(String bk_icode) {
		// TODO Auto-generated method stub
		return bokmDAO.allbookDetail(bk_icode);
	}

	@Override
	public int recBook(String bk_icode) {
		// TODO Auto-generated method stub
		return bokmDAO.recBook(bk_icode);
	}

	@Override
	public List<Book> recBookList() {
		// TODO Auto-generated method stub
		return bokmDAO.recBookList();
	}

	@Override
	public int notrecBook(String bk_icode) {
		// TODO Auto-generated method stub
		return bokmDAO.notrecBook(bk_icode);
	}

	@Override
	public List<BorrowDetail> bookPopular() {
		// TODO Auto-generated method stub
		return bokmDAO.bookPopular();
	}

}
