package com.bokm.dao;

import com.bokm.vo.Member;

public interface MypageDAO {
	//정보수정
	public int updateinfo(Member member);
	
	//mb_id로 찾기
	public Member searchbyid(int mb_id);
	
	//회원탈퇴
	public int delete(int mb_id);
	
	//myinfo 내정보 가져오기
		public Member myinfo(int mb_id);
}

