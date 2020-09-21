package com.bokm.vo;

public class Book {
	private int bk_id;
	private String bk_icode;
	private String bk_name;
	private String bk_introduction;
	private String bk_publicday;
	private String bk_publisher;
	private String bk_writer;
	private String bk_image;
	private String bk_quantity;
	private int bk_sg_num;
	private String bk_state;
	private int bk_pop;
	
	public int getBk_pop() {
		return bk_pop;
	}
	public void setBk_pop(int bk_pop) {
		this.bk_pop = bk_pop;
	}
	public int getBk_id() {
		return bk_id;
	}
	public void setBk_id(int bk_id) {
		this.bk_id = bk_id;
	}
	public String getBk_icode() {
		return bk_icode;
	}
	public void setBk_icode(String bk_icode) {
		this.bk_icode = bk_icode;
	}
	public String getBk_name() {
		return bk_name;
	}
	public void setBk_name(String bk_name) {
		this.bk_name = bk_name;
	}
	public String getBk_introduction() {
		return bk_introduction;
	}
	public void setBk_introduction(String bk_introduction) {
		this.bk_introduction = bk_introduction;
	}
	public String getBk_publicday() {
		return bk_publicday;
	}
	public void setBk_publicday(String bk_publicday) {
		this.bk_publicday = bk_publicday;
	}
	public String getBk_publisher() {
		return bk_publisher;
	}
	public void setBk_publisher(String bk_publisher) {
		this.bk_publisher = bk_publisher;
	}
	public String getBk_writer() {
		return bk_writer;
	}
	public void setBk_writer(String bk_writer) {
		this.bk_writer = bk_writer;
	}
	public String getBk_image() {
		return bk_image;
	}
	public void setBk_image(String bk_image) {
		this.bk_image = bk_image;
	}
	public String getBk_quantity() {
		return bk_quantity;
	}
	public void setBk_quantity(String bk_quantity) {
		this.bk_quantity = bk_quantity;
	}
	public int getBk_sg_num() {
		return bk_sg_num;
	}
	public void setBk_sg_num(int bk_sg_num) {
		this.bk_sg_num = bk_sg_num;
	}
	public String getBk_state() {
		return bk_state;
	}
	public void setBk_state(String bk_state) {
		this.bk_state = bk_state;
	}
	@Override
	public String toString() {
		return "Book [bk_id=" + bk_id + ", bk_icode=" + bk_icode + ", bk_name=" + bk_name + ", bk_introduction="
				+ bk_introduction + ", bk_publicday=" + bk_publicday + ", bk_publisher=" + bk_publisher + ", bk_writer="
				+ bk_writer + ", bk_image=" + bk_image + ", bk_quantity=" + bk_quantity + ", bk_sg_num=" + bk_sg_num
				+ ", bk_state=" + bk_state + ", bk_pop=" + bk_pop + "]";
	}
	
	
	
}
