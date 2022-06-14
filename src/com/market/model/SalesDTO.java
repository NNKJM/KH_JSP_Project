package com.market.model;

public class SalesDTO {
	
	private String sales_date;
	private int sales_count;
	private int sales_total;
	
	public String getSales_date() {
		return sales_date;
	}
	public void setSales_date(String sales_date) {
		this.sales_date = sales_date;
	}
	public int getSales_count() {
		return sales_count;
	}
	public void setSales_count(int sales_count) {
		this.sales_count = sales_count;
	}
	public int getSales_total() {
		return sales_total;
	}
	public void setSales_total(int sales_total) {
		this.sales_total = sales_total;
	}
	
}
