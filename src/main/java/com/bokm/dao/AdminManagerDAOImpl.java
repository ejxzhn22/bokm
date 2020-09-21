package com.bokm.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bokm.vo.Board;
import com.bokm.vo.Delivery;

@Repository
public class AdminManagerDAOImpl implements AdminManagerDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.bokm.adminMapper";
	
	//대출관리 대출중인 책 목록 가져오기
	@Override
	public List<Map> adminborrow() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".adminborrow");
	}
	
	//대출 반납 borrowdetail update
	@Override
	public int bookreturn(int bd_bo_num) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".bookreturn", bd_bo_num);
	}
	
	//대출반납 book state update
	@Override
	public int bstateupdate(String bd_bcode) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".bstateupdate", bd_bcode);
	}

	//예약->대출가능 알림 공지
	@Override
	public int resernotice(Board board) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".resernotice", board);
	}

	//예약현황 가져오기 (대출자 반납하고 예약자가 대출 안한지 3일)
	@Override
	public List<Map> adminreser() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".adminreser");
	}

	//연체현황 가져오기
	@Override
	public List<Map> adminarrears() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".adminarrears");
	}

	@Override
	public int performance(String dv_deliveryman) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".performance",dv_deliveryman);
	}

	@Override
	public List<String> getDelivery() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".get_delivery");
	}
	
	

}
