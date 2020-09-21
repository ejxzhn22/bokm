/*
 bl_num int AI PK 
 bl_id varchar(45)
 */
package com.bokm.vo;

public class BorrowList {
	private int bl_num;
	private int bl_id;
	
	public int getBl_num() {
		return bl_num;
	}
	public void setBl_num(int bl_num) {
		this.bl_num = bl_num;
	}
	public int getBl_id() {
		return bl_id;
	}
	public void setBl_id(int bl_id) {
		this.bl_id = bl_id;
	}
	
	@Override
	public String toString() {
		return "BorrowList [bl_num=" + bl_num + ", bl_id=" + bl_id + "]";
	}
	
	
}
