package com.spring.FoodMate.order.dto;

public class OrderDTO {
	private int ord_detail_id;
	private int ord_id;
	private int pdt_id;
	private String pdt_name;
	private int pdt_price;
	private int qty;
	public int getOrd_detail_id() {
		return ord_detail_id;
	}
	public void setOrd_detail_id(int ord_detail_id) {
		this.ord_detail_id = ord_detail_id;
	}
	public int getOrd_id() {
		return ord_id;
	}
	public void setOrd_id(int ord_id) {
		this.ord_id = ord_id;
	}
	public int getPdt_id() {
		return pdt_id;
	}
	public void setPdt_id(int pdt_id) {
		this.pdt_id = pdt_id;
	}
	public String getPdt_name() {
		return pdt_name;
	}
	public void setPdt_name(String pdt_name) {
		this.pdt_name = pdt_name;
	}
	public int getPdt_price() {
		return pdt_price;
	}
	public void setPdt_price(int pdt_price) {
		this.pdt_price = pdt_price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
}