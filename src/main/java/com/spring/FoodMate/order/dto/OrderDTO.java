package com.spring.FoodMate.order.dto;

public class OrderDTO {
	private int ord_detail_id;	// 상세고유id[시퀀스]
	private int ord_id;			// 주문id[부모키]
	private int pdt_id;			// 상품id
	private String pdt_name;	// 상품 이름
	private int pdt_price;		// 상품 가격
	private int qty;			// 개수
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