package com.bokm.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bokm.vo.Member;

@Repository
public class MemberDAOImp implements MemberDAO{
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.bokm.memberMapper";
	
	@Override
	public int join(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".join",member);
	}

	@Override
	public Member idCheck(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".idCheck",email);
	}

	@Override
	public List<Member> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listmember");
	}

	@Override
	public Member searchbyid(int mb_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".searchbyid",mb_id);
	}

	@Override
	public int updatemember(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".infoupdate",member);
	}

	@Override
	public List<Member> deletelist() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".deletelistmember");
	}





	@Override
	public List<Member> resultid2(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".resultid2", member);
	}

	
	
}
