package com.bokm.dao;

import java.util.List;

import com.bokm.vo.Book;
import com.bokm.vo.Criteria;
import com.bokm.vo.Delivery;

public interface DeliveryDAO {
	//전체 다 뽑아주기
	public List<Book> bookListAll(Criteria criteria) throws Exception;
	//페이징 처리
	public List<Book> listCriteria(Criteria criteria) throws Exception;
	//책에 대한 상세보기
	public Book bookDetail(String isbn);
	//책 정보와 주소정보 넣어주기
	public int deliveryInfo(Delivery delivery);
	//관리자 / 배송 승인 전인 리스트 뽑아주기
	public List<Delivery> prevDelivery();
	//관리자 / 배송 승인 후인 리스트 뽑아주기
	public List<Delivery> nowDelivery();
	//관리자 / 배송 승인 후 배송완료된 리스트 뽑아주기
	public List<Delivery> afterDelivery();
	//관리자 / 배송 승인 리스트 상세보기
	public Delivery deliveryDetail(String isbn);
	//관리자 / 배송 승인해서 업데이트
	public int deliveryOk(Delivery delivery);
	//마이페이지 / 아이디가 같은 것에 리스트 쭉 뽑아오기
	public List<Delivery> mypageList(String dv_bk_id);
	//마이페이지 / 시간이 지나면 배송완료 문구 뜨게하기
	public int mypageDeliveryComplete();
	//관리자 / 배송완료 누르면 배송완료시간 띄워주기
	public int managerDeliveryComplete(String isbn);
	//관리자 / 승인시 '배송완료(집배원 승인)'으로 바꿔주는 구문
	public int managerDeliveryComplete2(String isbn);
	//마이페이지 / 배송완료인 항목에 completetime넣기
	public int mypage_expectedEqualComplete();
	//마이페이지 / 팝업 - 배송완료,관리자승인
	public List<Delivery> mypage_deliveryPopup1(String isbn);
	//마이페이지 / 팝업 - 배송중
	public List<Delivery> mypage_deliveryPopup2(String isbn);
	//마이페이지 / 팝업 - 배송준비
	public List<Delivery> mypage_deliveryPopup3(String isbn);
	
	//새로운거 / 리스트에서 들어갈 때 delivery 가져오기
	public Delivery delivery_mmbook(String isbn);
}
