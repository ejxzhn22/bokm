package com.bokm.dao;

import java.util.List;
import java.util.Map;

import com.bokm.vo.Member;

public interface MemberDAO {

	// 회원가입
	public int join(Member member);

	// 중복검사
	public Member idCheck(String email);

	// 회원리스트
	public List<Member> list();

	// 아이디로 다 가져오기
	public Member searchbyid(int mb_id);

	// 관리자 회원 수정
	public int updatemember(Member member);

	// 회원리스트
	public List<Member> deletelist();
	
	//아이디 찾기 서비스

	
	public List<Member> resultid2(Member member);
}
