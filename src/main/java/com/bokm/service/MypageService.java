package com.bokm.service;

import com.bokm.vo.Member;

public interface MypageService {
	
	//정보수정
	public int updateinfo(Member member);
	
	public Member searchbyid(int mb_id);

	//회원탈퇴
	public int delete(int mb_id);

	//myinfo 내정보 가져오기
	public Member myinfo(int mb_id);
}
