/*
 * ̺ : board
bb_num int AI PK 
bb_title varchar(100) 
bb_content varchar(500) 
bb_name varchar(45) 
bb_image varchar(45) 
bb_date varchar(45) 
bb_readcnt int 
bb_bnum varchar(45) 
bb_del varchar(45)
 */

package com.bokm.vo;


public class Board {

	private int bb_num;
	private String bb_title;
	private String bb_content;
	private String bb_name;
	private String bb_image;
	private String bb_date;
	private int bb_readcnt;
	private String bb_bnum; //게시판 고유번호 : notice,frequestions,qna // ++ personal
	private int bb_del;
	private int bb_id;
	

	
	/*
	 * noticenum 
	 * 1: 예약신청한 도서가 대출신청 가능할때.
	 * 2: 대출신청을 3이내 안했을때 강제취소
	 * 3: 내가쓴글에 답글이 달렸을 때.
	 * 
	 */
	
	public Board() {} //디폴트 생성자 있어야됨.
	// 예약 -> 대출 가능 알림 
	public Board(String bb_name, int noticenum) {
		super();
		switch(noticenum) {
		
		case 1:
			this.bb_title = "*대출신청 가능 알림*";
			this.bb_content = "예약신청하신 도서  '"+bb_name+"' 대출신청 가능합니다. 3일 이내로 대출신청 해주세요.";
			this.bb_name = bb_name;
			this.bb_bnum = "personal";
			break;
			
		case 2:
			this.bb_title = "*예약 신청 강제취소 안내*";
			this.bb_content = "예약신청하신 도서 '"+bb_name+"' 을(를) 3일이내로 대출신청 하지 않아 강제 취소됨을 안내드립니다.";
			this.bb_name = bb_name;
			this.bb_bnum = "personal";
			break;
			
		case 3:
			
			this.bb_title = "*답글이 달렸습니당*";
			this.bb_content = "작성하신 글에 답글이 달렸습니다. 확인하세유";
			this.bb_name = bb_name;
			this.bb_bnum = "personal";
			break;
		}
		
	}

	public int getBb_id() {
		return bb_id;
	}


	public void setBb_id(int bb_id) {
		this.bb_id = bb_id;
	}



	public int getBb_num() {
		return bb_num;
	}

	public void setBb_num(int bb_num) {
		this.bb_num = bb_num;
	}

	public String getBb_title() {
		return bb_title;
	}

	public void setBb_title(String bb_title) {
		this.bb_title = bb_title;
	}

	public String getBb_content() {
		return bb_content;
	}

	public void setBb_content(String bb_content) {
		this.bb_content = bb_content;
	}

	public String getBb_name() {
		return bb_name;
	}

	public void setBb_name(String bb_name) {
		this.bb_name = bb_name;
	}

	public String getBb_image() {
		return bb_image;
	}

	public void setBb_image(String bb_image) {
		this.bb_image = bb_image;
	}

	public String getBb_date() {
		return bb_date;
	}

	public void setBb_date(String bb_date) {
		this.bb_date = bb_date;
	}

	public int getBb_readcnt() {
		return bb_readcnt;
	}

	public void setBb_readcnt(int bb_readcnt) {
		this.bb_readcnt = bb_readcnt;
	}

	public String getBb_bnum() {
		return bb_bnum;
	}

	public void setBb_bnum(String bb_bnum) {
		this.bb_bnum = bb_bnum;
	}

	public int getBb_del() {
		return bb_del;
	}

	public void setBb_del(int bb_del) {
		this.bb_del = bb_del;
	}

	@Override
	public String toString() {
		return "Board [bb_num=" + bb_num + ", bb_title=" + bb_title + ", bb_content=" + bb_content + ", bb_name="
				+ bb_name + ", bb_image=" + bb_image + ", bb_date=" + bb_date + ", bb_readcnt=" + bb_readcnt
				+ ", bb_bnum=" + bb_bnum + ", bb_del=" + bb_del + "]";

	}

}