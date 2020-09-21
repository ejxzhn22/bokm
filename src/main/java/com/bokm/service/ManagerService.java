package com.bokm.service;

import java.util.List;
import java.util.Map;

import com.bokm.vo.Board;
import com.bokm.vo.Book;
import com.bokm.vo.BorrowDetail;
import com.bokm.vo.BorrowList;

public interface ManagerService {
	//대출신청 borrowdetail insert
	public int borrowdetail(BorrowDetail borrowDetail);
	
	//대출신청 borrowlist insert
	public int borrowlist(int bl_id);
	
	//대출한 책 대출상태를 대출중으로 수정
	public int borrowupdate(String bk_code);
	
	//isbn으로 책이름 저자 이미지 가져오기 
	public Book selectbook(String bd_bcode);
	
	//대출건수 가져오기
	public int borrowcount(int mb_id);
	
	//대출현황 가져오기
	public List<Map> currentborrow(int mb_id);
	
	//대출/반납 목록 가져오기
	public List<Map> pastborrow(int mb_id);
	
	//isbn으로 예약자 유무/정보 가져오기
	public List<Map> isbndetail(String bk_icode);
	
	//예약하기
	public int reservation(Map map);
	
	//예약건수
	public int resercount(int mb_id);
	
	//예약현황 가져오기
	public  List<Map> currentreser(int mb_id);
	
	//예약취소
	public int cancelreser(Book book);
	
	//isbn으로 borrowdetail 예약자 확인
	public List<Map> searchdetail(Map map);
	
	//대출번호로 예약자 유무 확인
	public int searchreser(int bd_bo_num);
	
	//개인공지 가져오기
	public List<Board> mynotice(int mb_id);
	
	//대출번호 가져오기
	public List<Integer> searchnum(String bk_icode);

	//안읽은 개인공지 가져오기
	public List<Board> noread(int mb_id);
	
	//안읽은 개인공지 갯수 가져오기
	public int noticecount(int mb_id);
	
	//개인공지 조회수
	public int noticeup(int bb_num);
	
	//개인공지 삭제
	public int noticedel(int bb_num);
	
	//대출 연장하기
	public int extension(int bd_bo_num);
	
	//연체 update
	public int arrears();
	
	//연체 건수
	public int arrearscount(int mb_id);
	
	
}
