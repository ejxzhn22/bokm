package com.bokm.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bokm.dao.MypageDAO;
import com.bokm.vo.Member;

@Service
public class MypageServiceImpl implements MypageService{
	@Inject
	private MypageDAO mypageDAO;

	@Override
	public int updateinfo(Member member) {
		// TODO Auto-generated method stub
		return mypageDAO.updateinfo(member);
	}

	@Override
	public Member searchbyid(int mb_id) {
		// TODO Auto-generated method stub
		return mypageDAO.searchbyid(mb_id);
	}

	@Override
	public int delete(int mb_id) {
		// TODO Auto-generated method stub
		return mypageDAO.delete(mb_id);
	}

	//myinfo 내정보 가져오기
	@Override
	public Member myinfo(int mb_id) {
		// TODO Auto-generated method stub
		return mypageDAO.myinfo(mb_id);
	}


}
