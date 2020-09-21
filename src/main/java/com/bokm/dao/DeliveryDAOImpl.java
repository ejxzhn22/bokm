package com.bokm.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bokm.vo.Book;
import com.bokm.vo.Criteria;
import com.bokm.vo.Delivery;

@Repository
public class DeliveryDAOImpl implements DeliveryDAO {
	@Inject
	SqlSession sqlSession;
	private String namespace= "com.bokm.deliveryMapper";
	
	
	@Override
	public List<Book> bookListAll(Criteria criteria) throws Exception {
		return sqlSession.selectList(namespace+".delivery_allBook",criteria);
	}
	
	@Override
	public List<Book> listCriteria(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listCriteria",criteria);
	}

	@Override
	public Book bookDetail(String isbn) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".delivery_detailBook",isbn);
	}


	@Override
	public int deliveryInfo(Delivery delivery) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".delivery_dvinfo",delivery);
	}


	@Override
	public List<Delivery> prevDelivery() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".manager_prevDelivery");
	}

	@Override
	public List<Delivery> nowDelivery() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".manager_nowDelivery");
	}
	
	@Override
	public List<Delivery> afterDelivery() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".manager_afterDelivery");
	}
	
	@Override
	public Delivery deliveryDetail(String isbn) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".manager_prevDeliveryDetail", isbn);
	}


	@Override
	public int deliveryOk(Delivery delivery) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".manager_deliveryOk",delivery);
	}


	@Override
	public List<Delivery> mypageList(String dv_bk_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".mypage_deliveryList", dv_bk_id);
	}


	@Override
	public int mypageDeliveryComplete() {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".mypage_deliveryComplete");
	}


	@Override
	public int managerDeliveryComplete(String isbn) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".manager_deliveryComplete",isbn);
	}


	@Override
	public int managerDeliveryComplete2(String isbn) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".manager_deliveryComplete2",isbn);
	}


	@Override
	public int mypage_expectedEqualComplete() {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".mypage_expectedEqualComplete");
	}


	@Override
	public List<Delivery> mypage_deliveryPopup1(String isbn) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".mypage_deliveryPopup1", isbn);
	}


	@Override
	public List<Delivery> mypage_deliveryPopup2(String isbn) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".mypage_deliveryPopup2", isbn);
	}


	@Override
	public List<Delivery> mypage_deliveryPopup3(String isbn) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".mypage_deliveryPopup3", isbn);
	}

	@Override
	public Delivery delivery_mmbook(String isbn) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".delivery_mmbook",isbn);
	}








}
