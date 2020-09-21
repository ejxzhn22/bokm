package com.bokm.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bokm.dao.MemberDAO;
import com.bokm.vo.Member;

@Service
public class MemberServiceImp implements MemberService{
	@Inject
	private MemberDAO memberDAO;

	@Override
	public int join(Member member) {
		// TODO Auto-generated method stub
		return memberDAO.join(member);
	}

	@Override
	public Member idCheck(String email) {
		// TODO Auto-generated method stub
		return memberDAO.idCheck(email);
	}

	@Override
	public List<Member> list() {
		// TODO Auto-generated method stub
		return memberDAO.list();
	}

	@Override
	public Member searchbyid(int mb_id) {
		// TODO Auto-generated method stub
		return memberDAO.searchbyid(mb_id);
	}

	@Override
	public int updatemember(Member member) {
		// TODO Auto-generated method stub
		return memberDAO.updatemember(member);
	}

	@Override
	public List<Member> deletelist() {
		// TODO Auto-generated method stub
		return memberDAO.deletelist();
	}


	//아이디 찾기 서비스


	@Override
	public List<Member> resultid2(Member member) {
		// TODO Auto-generated method stub
		return memberDAO.resultid2(member);
	}
	
	
	
	
	

	
}
