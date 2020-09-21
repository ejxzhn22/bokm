/*
 * String dv_bcode=아이에스비엔코드
String dv_bk_id=배송신청자 아이디
String dv_bk_name=책 타이틀
String dv_location=지역 정보
String dv_requesttime=신청시간
int dv_state=현황(배송 승인 전 = 0 배송승인 = 1 배송승인완료 = 2)
 */

package com.bokm.vo;

public class Delivery {
	private String dv_bcode;
	private String dv_bk_id;
	private String dv_user;
	private String dv_bk_name;
	private String dv_location;
	private String dv_requesttime;
	private String dv_state;
	private String dv_expectedtime;
	private String dv_completetime;
	private String dv_deliveryman;
	
	

	
	@Override
	public String toString() {
		return "Delivery [dv_bcode=" + dv_bcode + ", dv_bk_id=" + dv_bk_id + ", dv_user="
				+ dv_user + ", dv_bk_name=" + dv_bk_name + ", dv_location=" + dv_location + ", dv_requesttime="
				+ dv_requesttime + ", dv_state=" + dv_state + ", dv_expectedtime=" + dv_expectedtime
				+ ", dv_completetime=" + dv_completetime + ", dv_deliveryman=" + dv_deliveryman + "]";
	}



	public String getDv_completetime() {
		return dv_completetime;
	}
	public void setDv_completetime(String dv_completetime) {
		this.dv_completetime = dv_completetime;
	}
	public String getDv_expectedtime() {
		return dv_expectedtime;
	}
	public void setDv_expectedtime(String dv_expectedtime) {
		this.dv_expectedtime = dv_expectedtime;
	}
	public String getDv_user() {
		return dv_user;
	}
	public void setDv_user(String dv_user) {
		this.dv_user = dv_user;
	}
	public String getDv_bcode() {
		return dv_bcode;
	}
	public void setDv_bcode(String dv_bcode) {
		this.dv_bcode = dv_bcode;
	}
	
	
	public String getDv_bk_id() {
		return dv_bk_id;
	}
	public void setDv_bk_id(String dv_bk_id) {
		this.dv_bk_id = dv_bk_id;
	}
	
	
	public String getDv_bk_name() {
		return dv_bk_name;
	}
	public void setDv_bk_name(String dv_bk_name) {
		this.dv_bk_name = dv_bk_name;
	}
	
	
	public String getDv_location() {
		return dv_location;
	}
	public void setDv_location(String dv_location) {
		this.dv_location = dv_location;
	}
	
	
	public String getDv_requesttime() {
		return dv_requesttime;
	}
	public void setDv_requesttime(String dv_requesttime) {
		this.dv_requesttime = dv_requesttime;
	}
	
	
	public String getDv_state() {
		return dv_state;
	}
	public void setDv_state(String dv_state) {
		this.dv_state = dv_state;
	}
	
	public String getDv_deliveryman() {
		return dv_deliveryman;
	}
	public void setDv_deliveryman(String dv_deliveryman) {
		this.dv_deliveryman = dv_deliveryman;
	}
}
