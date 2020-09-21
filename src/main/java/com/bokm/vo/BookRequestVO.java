package com.bokm.vo;

public class BookRequestVO {
	private int br_num;
	private String br_id;
	private String br_name;
	private String br_bcode;
	private String br_writer;
	private String br_title;
	private String br_reason;
	private String br_date;
	private int br_situation;
	public int getBr_num() {
		return br_num;
	}
	public void setBr_num(int br_num) {
		this.br_num = br_num;
	}
	public String getBr_id() {
		return br_id;
	}
	public void setBr_id(String br_id) {
		this.br_id = br_id;
	}
	public String getBr_name() {
		return br_name;
	}
	public void setBr_name(String br_name) {
		this.br_name = br_name;
	}
	public String getBr_bcode() {
		return br_bcode;
	}
	public void setBr_bcode(String br_bcode) {
		this.br_bcode = br_bcode;
	}
	public String getBr_writer() {
		return br_writer;
	}
	public void setBr_writer(String br_writer) {
		this.br_writer = br_writer;
	}
	public String getBr_title() {
		return br_title;
	}
	public void setBr_title(String br_title) {
		this.br_title = br_title;
	}
	public String getBr_reason() {
		return br_reason;
	}
	public void setBr_reason(String br_reason) {
		this.br_reason = br_reason;
	}
	public String getBr_date() {
		return br_date;
	}
	public void setBr_date(String br_date) {
		this.br_date = br_date;
	}
	public int getBr_situation() {
		return br_situation;
	}
	public void setBr_situation(int br_situation) {
		this.br_situation = br_situation;
	}
	@Override
	public String toString() {
		return "BookRequestVO [br_num=" + br_num + ", br_id=" + br_id + ", br_name=" + br_name + ", br_bcode="
				+ br_bcode + ", br_writer=" + br_writer + ", br_title=" + br_title + ", br_reason=" + br_reason
				+ ", br_date=" + br_date + ", br_situation=" + br_situation + "]";
	}
	
	
	
	
}
