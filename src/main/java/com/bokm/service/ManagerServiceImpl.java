package com.bokm.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bokm.dao.ManagerDAO;
import com.bokm.vo.Board;
import com.bokm.vo.Book;
import com.bokm.vo.BorrowDetail;
import com.bokm.vo.BorrowList;

@Service
public class ManagerServiceImpl implements ManagerService{
	@Inject
	private ManagerDAO managerDAO;
	
	//대출신청 borrowdetail insert
	@Override
	public int borrowdetail(BorrowDetail borrowDetail) {
		// TODO Auto-generated method stub
		return managerDAO.borrowdetail(borrowDetail);
	}
	
	
	//대출신청 borrowlist insert
	@Override
	public int borrowlist(int bl_id) {
		// TODO Auto-generated method stub
		return managerDAO.borrowlist(bl_id);
	}
	
	//대출한 책 대출상태를 대출중으로 수정
	@Override
	public int borrowupdate(String bk_code) {
		// TODO Auto-generated method stub
		return managerDAO.borrowupdate(bk_code);
	}

	//isbn으로 책이름 저자 이미지 가져오기 
	@Override
	public Book selectbook(String bd_bcode) {
		// TODO Auto-generated method stub
		return managerDAO.selectbook(bd_bcode);
	}

	//대출건수 가져오기
	@Override
	public int borrowcount(int mb_id) {
		// TODO Auto-generated method stub
		return managerDAO.borrowcount(mb_id);
	}

	//대출현황 가져오기
	@Override
	public List<Map> currentborrow(int mb_id) {
		// TODO Auto-generated method stub
		return managerDAO.currentborrow(mb_id);
	}
	
	//대출/반납 목록 가져오기
	@Override
	public List<Map> pastborrow(int mb_id) {
		// TODO Auto-generated method stub
		return managerDAO.pastborrow(mb_id);
	}
	
	//isbn으로 예약자 유무/정보 가져오기
	@Override
	public List<Map> isbndetail(String bk_icode) {
		// TODO Auto-generated method stub
		return managerDAO.isbndetail(bk_icode);
	}

	//예약하기
	@Override
	public int reservation(Map map) {
		// TODO Auto-generated method stub
		return managerDAO.reservation(map);
	}
	
	//예약건수
	@Override
	public int resercount(int mb_id) {
		// TODO Auto-generated method stub
		return managerDAO.resercount(mb_id);
	}
	
	//예약현황 가져오기
	@Override
	public List<Map> currentreser(int mb_id) {
		// TODO Auto-generated method stub
		return managerDAO.currentreser(mb_id);
	}
	
	//예약취소
	@Override
	public int cancelreser(Book book) {
		// TODO Auto-generated method stub
		return managerDAO.cancelreser(book);
	}
	
	//isbn으로 borrowdetail 예약자 확인
	@Override
	public List<Map> searchdetail(Map map) {
		// TODO Auto-generated method stub
		return managerDAO.searchdetail(map);
	}

	//대출번호로 예약자 유무 확인
	@Override
	public int searchreser(int bd_bo_num) {
		// TODO Auto-generated method stub
		return managerDAO.searchreser(bd_bo_num);
	}

	//개인공지 가져오기
	@Override
	public List<Board> mynotice(int mb_id) {
		// TODO Auto-generated method stub
		return managerDAO.mynotice(mb_id);
	}
	
	//대출번호 가져오기
	@Override
	public List<Integer> searchnum(String bk_icode) {
		// TODO Auto-generated method stub
		return managerDAO.searchnum(bk_icode);
	}
	
	//안읽은 개인공지 가져오기
	@Override
	public List<Board> noread(int mb_id) {
		// TODO Auto-generated method stub
		return managerDAO.noread(mb_id);
	}
	
	//안읽은 개인공지 갯수 가져오기
	@Override
	public int noticecount(int mb_id) {
		// TODO Auto-generated method stub
		return managerDAO.noticecount(mb_id);
	}
	
	//개인공지 조회수
	@Override
	public int noticeup(int bb_num) {
		// TODO Auto-generated method stub
		return managerDAO.noticeup(bb_num);
	}
	
	//대출 연장하기
	@Override
	public int extension(int bd_bo_num) {
		// TODO Auto-generated method stub
		return managerDAO.extension(bd_bo_num);
	}

	//연체 update
	@Override
	public int arrears() {
		// TODO Auto-generated method stub
		return managerDAO.arrears();
	}

	//연체 건수
	@Override
	public int arrearscount(int mb_id) {
		// TODO Auto-generated method stub
		return managerDAO.arrearscount(mb_id);
	}

	//개인공지 삭제
	@Override
	public int noticedel(int bb_num) {
		// TODO Auto-generated method stub
		return managerDAO.noticedel(bb_num);
	}


}
