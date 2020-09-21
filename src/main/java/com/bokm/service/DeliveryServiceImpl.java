package com.bokm.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bokm.dao.DeliveryDAO;
import com.bokm.vo.Book;
import com.bokm.vo.Criteria;
import com.bokm.vo.Delivery;

@Service
public class DeliveryServiceImpl implements DeliveryService {
	@Inject
	DeliveryDAO deliveryDAO;

	@Override
	public List<Book> bookListAll(Criteria criteria) throws Exception{
		// TODO Auto-generated method stub
		return deliveryDAO.bookListAll(criteria);
	}

	@Override
	public List<Book> listCriteria(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return deliveryDAO.listCriteria(criteria);
	}
	@Override
	public Book bookDetail(String isbn) {
		// TODO Auto-generated method stub
		return deliveryDAO.bookDetail(isbn);
	}

	@Override
	public int deliveryInfo(Delivery delivery) {
		// TODO Auto-generated method stub
		return deliveryDAO.deliveryInfo(delivery);
	}

	@Override
	public List<Delivery> prevDelivery() {
		// TODO Auto-generated method stub
		return deliveryDAO.prevDelivery();
	}

	@Override
	public List<Delivery> nowDelivery() {
		// TODO Auto-generated method stub
		return deliveryDAO.nowDelivery();
	}

	@Override
	public List<Delivery> afterDelivery() {
		// TODO Auto-generated method stub
		return deliveryDAO.afterDelivery();
	}
	
	@Override
	public Delivery deliveryDetail(String isbn) {
		// TODO Auto-generated method stub
		return deliveryDAO.deliveryDetail(isbn);
	}

	@Override
	public int deliveryOk(Delivery delivery) {
		// TODO Auto-generated method stub
		return deliveryDAO.deliveryOk(delivery);
	}

	@Override
	public List<Delivery> mypageList(String dv_bk_id) {
		// TODO Auto-generated method stub
		return deliveryDAO.mypageList(dv_bk_id);
	}

	@Override
	public int mypageDeliveryComplete() {
		// TODO Auto-generated method stub
		return deliveryDAO.mypageDeliveryComplete();
	}

	@Override
	public int managerDeliveryComplete(String isbn) {
		// TODO Auto-generated method stub
		return deliveryDAO.managerDeliveryComplete(isbn);
	}

	@Override
	public int managerDeliveryComplete2(String isbn) {
		// TODO Auto-generated method stub
		return deliveryDAO.managerDeliveryComplete2(isbn);
	}

	@Override
	public int mypage_expectedEqualComplete() {
		// TODO Auto-generated method stub
		return deliveryDAO.mypage_expectedEqualComplete();
	}

	@Override
	public List<Delivery> mypage_deliveryPopup1(String isbn) {
		// TODO Auto-generated method stub
		return deliveryDAO.mypage_deliveryPopup1(isbn);
	}

	@Override
	public List<Delivery> mypage_deliveryPopup2(String isbn) {
		// TODO Auto-generated method stub
		return deliveryDAO.mypage_deliveryPopup2(isbn);	
	}

	@Override
	public List<Delivery> mypage_deliveryPopup3(String isbn) {
		// TODO Auto-generated method stub
		return deliveryDAO.mypage_deliveryPopup3(isbn);	
	}

	
	
	@Override
	public Delivery delivery_mmbook(String isbn) {
		// TODO Auto-generated method stub
		return deliveryDAO.delivery_mmbook(isbn);
	}





}
