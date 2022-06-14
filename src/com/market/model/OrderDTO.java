package com.market.model;

public class OrderDTO {
	private int order_num;
	private int order_group;
	private String order_userId;
	private String order_userAddr;
	private String order_detailAddr;
	private int order_pnum;
	private String order_pname;
	private String order_image;
	private int order_pqty;
	private int order_price;
	private int order_total;
	private String order_date;
	
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public int getOrder_group() {
		return order_group;
	}
	public void setOrder_group(int order_group) {
		this.order_group = order_group;
	}
	public String getOrder_userId() {
		return order_userId;
	}
	public void setOrder_userId(String order_userId) {
		this.order_userId = order_userId;
	}
	public String getOrder_userAddr() {
		return order_userAddr;
	}
	public void setOrder_userAddr(String order_userAddr) {
		this.order_userAddr = order_userAddr;
	}
	public int getOrder_pnum() {
		return order_pnum;
	}
	public void setOrder_pnum(int order_pnum) {
		this.order_pnum = order_pnum;
	}
	public String getOrder_pname() {
		return order_pname;
	}
	public void setOrder_pname(String order_pname) {
		this.order_pname = order_pname;
	}
	public String getOrder_image() {
		return order_image;
	}
	public void setOrder_image(String order_image) {
		this.order_image = order_image;
	}
	public int getOrder_pqty() {
		return order_pqty;
	}
	public void setOrder_pqty(int order_pqty) {
		this.order_pqty = order_pqty;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public int getOrder_total() {
		return order_total;
	}
	public void setOrder_total(int order_total) {
		this.order_total = order_total;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getOrder_detailAddr() {
		return order_detailAddr;
	}
	public void setOrder_detailAddr(String order_detailAddr) {
		this.order_detailAddr = order_detailAddr;
	}
	
}
