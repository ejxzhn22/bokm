package com.bokm.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bokm.vo.Book;
import com.bokm.vo.BookRequestVO;
import com.bokm.vo.BorrowDetail;

@Repository
public class BokmDAOImpl implements BokmDAO {
	@Inject
	SqlSession sqlSession;
	private String namespace= "com.bokm.bookMapper";
	
	@Override
	public int bookRequest(BookRequestVO bookRequestVO) {

		return sqlSession.insert(namespace+".bookRequest",bookRequestVO);
	}

	@Override
	public List<BookRequestVO> bookRequestList() {

		return sqlSession.selectList(namespace+".manager_bookRequestList");
	}

	@Override
	public BookRequestVO bookRequestListDetail(int br_num) {
		
		return sqlSession.selectOne(namespace+".manager_bookRequestListDetail",br_num);
	}

	@Override
	public int bookRequestApprove(int br_num) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".manager_bookRequestApprove",br_num);
	}

	@Override
	public int bookInsert(Book bookVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".manager_insertbook",bookVO);
	}

	@Override
	public List<Book> bookListAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".manager_allbook");
	}

	// new

	@Override
	public Book allbookDetail(String bk_icode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".manager_allbookDetail", bk_icode);

	}

	@Override

	public int recBook(String bk_icode) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".manager_recBook", bk_icode);
	}

	@Override
	public List<Book> recBookList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".manager_recBookList");
	}

	@Override
	public int notrecBook(String bk_icode) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".manager_notrecBook", bk_icode);
	}

	@Override
	public List<BorrowDetail> bookPopular() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".bookPopular");
	}
	
	
	
}
