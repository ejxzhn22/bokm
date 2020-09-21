package com.bokm.vo;
/*
 * 
rp_num int AI PK 
rp_bb_num varchar(45) 
rp_content varchar(500) 
rp_name varchar(45) 
rp_date varchar(45) 
rp_image varchar(45)
 */
public class BoardReply {
	private int rp_num;
	private int rp_bb_num;
	private String rp_content;
	private String rp_name;
	private String rp_date;
	private String rp_image;
	private int rp_mb_id;
	
	public int getRp_mb_id() {
		return rp_mb_id;
	}
	public void setRp_mb_id(int rp_mb_id) {
		this.rp_mb_id = rp_mb_id;
	}
	public int getRp_num() {
		return rp_num;
	}
	public void setRp_num(int rp_num) {
		this.rp_num = rp_num;
	}
	public int getRp_bb_num() {
		return rp_bb_num;
	}
	public void setRp_bb_num(int rp_bb_num) {
		this.rp_bb_num = rp_bb_num;
	}
	public String getRp_content() {
		return rp_content;
	}
	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}
	public String getRp_name() {
		return rp_name;
	}
	public void setRp_name(String rp_name) {
		this.rp_name = rp_name;
	}
	public String getRp_date() {
		return rp_date;
	}
	public void setRp_date(String rp_date) {
		this.rp_date = rp_date;
	}
	public String getRp_image() {
		return rp_image;
	}
	public void setRp_image(String rp_image) {
		this.rp_image = rp_image;
	}
	@Override
	public String toString() {
		return "BoardReply [rp_num=" + rp_num + ", rp_bb_num=" + rp_bb_num + ", rp_content=" + rp_content + ", rp_name="
				+ rp_name + ", rp_date=" + rp_date + ", rp_image=" + rp_image + ", rp_mb_id=" + rp_mb_id
				+ ", getRp_mb_id()=" + getRp_mb_id() + ", getRp_num()=" + getRp_num() + ", getRp_bb_num()="
				+ getRp_bb_num() + ", getRp_content()=" + getRp_content() + ", getRp_name()=" + getRp_name()
				+ ", getRp_date()=" + getRp_date() + ", getRp_image()=" + getRp_image() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
}
