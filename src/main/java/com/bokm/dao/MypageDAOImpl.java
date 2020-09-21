package com.bokm.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bokm.vo.Member;

@Repository
public class MypageDAOImpl implements MypageDAO{
	@Inject
	private SqlSession sqlSession;
	private final String namespace="com.bokm.memberMapper";
	
	@Override
	public int updateinfo(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".infoupdate",member);
	}

	@Override
	public Member searchbyid(int mb_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".searchbyid",mb_id);
	}

	@Override
	public int delete(int mb_id) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".delete",mb_id);
	}
	
	//myinfo 내정보 가져오기
		@Override
		public Member myinfo(int mb_id) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne(namespace+".myinfo", mb_id);
		}
	
	


}
