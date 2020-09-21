/*
bd_bo_num int AI PK 
bd_bcode varchar(100) 
bd_state_num int 
bd_count int 
bd_date varchar(45) 
bd_return_date varchar(45) 
bd_real_extension varchar(45) 
bd_real_return_date varchar(45) 
bd_reason varchar(100) 
bd_arrears varchar(45) 
bd_on_off varchar(45)
 */
package com.bokm.vo;

public class BorrowDetail {
	private int bd_bo_num;
	private String bd_bcode;
	private int bd_state_num;
	private int bd_count;
	private String bd_date;
	private String bd_return;
	private String bd_real_extension;
	private String bd_real_return_date;
	private String bd_reason;
	private String bd_arrears;
	private String bd_on_off;
	private int bd_reservation;
	
	
	public int getBd_reservation() {
		return bd_reservation;
	}
	public void setBd_reservation(int bd_reservation) {
		this.bd_reservation = bd_reservation;
	}
	public int getBd_bo_num() {
		return bd_bo_num;
	}
	public void setBd_bo_num(int bd_bo_num) {
		this.bd_bo_num = bd_bo_num;
	}
	public String getBd_bcode() {
		return bd_bcode;
	}
	public void setBd_bcode(String bd_bcode) {
		this.bd_bcode = bd_bcode;
	}
	public int getBd_state_num() {
		return bd_state_num;
	}
	public void setBd_state_num(int bd_state_num) {
		this.bd_state_num = bd_state_num;
	}
	public int getBd_count() {
		return bd_count;
	}
	public void setBd_count(int bd_count) {
		this.bd_count = bd_count;
	}
	public String getBd_date() {
		return bd_date;
	}
	public void setBd_date(String bd_date) {
		this.bd_date = bd_date;
	}
	public String getBd_return() {
		return bd_return;
	}
	public void setBd_return(String bd_return) {
		this.bd_return = bd_return;
	}
	public String getBd_real_extension() {
		return bd_real_extension;
	}
	public void setBd_real_extension(String bd_real_extension) {
		this.bd_real_extension = bd_real_extension;
	}
	public String getBd_real_return_date() {
		return bd_real_return_date;
	}
	public void setBd_real_return_date(String bd_real_return_date) {
		this.bd_real_return_date = bd_real_return_date;
	}
	public String getBd_reason() {
		return bd_reason;
	}
	public void setBd_reason(String bd_reason) {
		this.bd_reason = bd_reason;
	}
	public String getBd_arrears() {
		return bd_arrears;
	}
	public void setBd_arrears(String bd_arrears) {
		this.bd_arrears = bd_arrears;
	}
	public String getBd_on_off() {
		return bd_on_off;
	}
	public void setBd_on_off(String bd_on_off) {
		this.bd_on_off = bd_on_off;
	}
	@Override
	public String toString() {
		return "BorrowDetail [bd_bo_num=" + bd_bo_num + ", bd_bcode=" + bd_bcode + ", bd_state_num=" + bd_state_num
				+ ", bd_count=" + bd_count + ", bd_date=" + bd_date + ", bd_return=" + bd_return
				+ ", bd_real_extension=" + bd_real_extension + ", bd_real_return_date=" + bd_real_return_date
				+ ", bd_reason=" + bd_reason + ", bd_arrears=" + bd_arrears + ", bd_on_off=" + bd_on_off
				+ ", bd_reservation=" + bd_reservation + "]";
	}
	
	
	
}
