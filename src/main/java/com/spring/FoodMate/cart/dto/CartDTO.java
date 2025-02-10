package com.spring.FoodMate.cart.dto;

import java.time.LocalDateTime;

import org.springframework.stereotype.Component;

@Component("cartDTO")
public class CartDTO {
	private int cart_id;
	private String byr_id;
	private int pdt_id;
	private String pdt_name;
	private int qty;
	private LocalDateTime add_date;
	
	public CartDTO() {}
	
	public CartDTO(int pdt_id, int qty, String byr_id, String pdt_name) {
        this.pdt_id = pdt_id;
        this.qty = qty;
        this.byr_id = byr_id;
        this.pdt_name = pdt_name;
    }
	
	public int getCart_id() {		return cart_id;	}
	public void setCart_id(int cart_id) {		this.cart_id = cart_id;	}
	public String getByr_id() {		return byr_id;	}
	public void setByr_id(String byr_id) {		this.byr_id = byr_id;	}
	public int getPdt_id() {		return pdt_id;	}
	public void setPdt_id(int pdt_id) {		this.pdt_id = pdt_id;	}
	public String getPdt_name() {		return pdt_name;	}
	public void setPdt_name(String pdt_name) {		this.pdt_name = pdt_name;	}
	public int getQty() {		return qty;	}
	public void setQty(int qty) {		this.qty = qty;	}
	public LocalDateTime getAdd_date() {		return add_date;	}
	public void setAdd_date(LocalDateTime add_date) {		this.add_date = add_date;	}

}