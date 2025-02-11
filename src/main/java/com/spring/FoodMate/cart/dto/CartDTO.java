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
	
	// 이건 테이블 컬럼대로 만든 필드와 GetSetter
	
	public CartDTO() {}
	// 얘는 기본 생성자. 아래쪽 특수 생성자만 있으면 될 줄 알았는데
	// 기본 생성자가 없으면 스프링에서 못알아먹는다고 함.
	
	public CartDTO(int pdt_id, int qty, String byr_id, String pdt_name) {
        this.pdt_id = pdt_id;
        this.qty = qty;
        this.byr_id = byr_id;
        this.pdt_name = pdt_name;
    }
	// 얘는 특수 생성자. CartSerVice에서 set 메서드로 4개 다 처넣기 귀찮아서 여기서 처리함.
	
	private int price;
	private String slr_id;
	private String nickname;
	private String status;
	private String img_path;
	
	public int getPrice() {		return price;	}
	public void setPrice(int price) {		this.price = price;	}
	public String getSlr_id() {		return slr_id;	}
	public void setSlr_id(String slr_id) {		this.slr_id = slr_id;	}
	public String getNickname() {		return nickname;	}
	public void setNickname(String nickname) {		this.nickname = nickname;	}
	public String getStatus() {		return status;	}
	public void setStatus(String status) {		this.status = status;	}
	public String getImg_path() {		return img_path;	}
	public void setImg_path(String img_path) {		this.img_path = img_path;	}
	
	// 이건 cartList view 에서 받아올 필드와 GetSetter

}