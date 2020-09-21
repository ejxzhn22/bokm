package com.bokm.dao;

import java.util.List;
import java.util.Map;

import com.bokm.vo.Board;
import com.bokm.vo.Delivery;

public interface AdminManagerDAO {
	//대출관리 대출중인 책 목록 가져오기
	public List<Map> adminborrow();
	
	//대출 반납 borrowdetail update
	public int bookreturn(int bd_bo_num);
	
	//대출반납 book state update
	public int bstateupdate(String bd_bcode);
	
	//예약->대출가능 알림 공지
	public int resernotice(Board board);
	
	//예약현황 가져오기 (대출자 반납하고 예약자가 대출 안한지 3일)
	public List<Map> adminreser();
	
	//연체 현황 가져오기
	public List<Map> adminarrears();
	
	//실적 가져오기 moon
	public int performance(String dv_deliveryman);
	
	//delivery 다 가져오기
	public List<String> getDelivery();
}
