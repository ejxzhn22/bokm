package com.bokm.vo;
/*
Table: review
Columns:
rv_id int AI PK 
rv_icode varchar(100) 
rv_name varchar(45) 
rv_content varchar(500) 
rv_date datetime
*/
public class Review {
	private int rv_id;
	private String rv_icode;
	private String rv_name;
	private String rv_content;
	private String rv_date;
	private int rv_mb_id;
	
	public int getRv_mb_id() {
		return rv_mb_id;
	}
	public void setRv_mb_id(int rv_mb_id) {
		this.rv_mb_id = rv_mb_id;
	}
	public int getRv_id() {
		return rv_id;
	}
	public void setRv_id(int rv_id) {
		this.rv_id = rv_id;
	}
	public String getRv_icode() {
		return rv_icode;
	}
	public void setRv_icode(String rv_icode) {
		this.rv_icode = rv_icode;
	}
	public String getRv_name() {
		return rv_name;
	}
	public void setRv_name(String rv_name) {
		this.rv_name = rv_name;
	}
	public String getRv_content() {
		return rv_content;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}
	public String getRv_date() {
		return rv_date;
	}
	public void setRv_date(String rv_date) {
		this.rv_date = rv_date;
	}
	@Override
	public String toString() {
		return "Review [rv_id=" + rv_id + ", rv_icode=" + rv_icode + ", rv_name=" + rv_name + ", rv_content="
				+ rv_content + ", rv_date=" + rv_date + ", rv_mb_id=" + rv_mb_id + "]";
	}
	
	
	
}