package com.spring.FoodMate.product.dto;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("productDTO")
public class ProductDTO {
	private int pdt_id;
	private String slr_id;
	private String name;
	private String img_path; 
	private int price;
	private int qty;
	private String unit;
	private Integer category_id;
	private int stock; 
	private String status;
	private String description;
	// 여기까지 FoodMate_Product 테이블
	
	private String slr_nickname; // pdt_id 매개로 Join 해서 쓰는 판매자 별명
	private MultipartFile pdt_img; // 실제 이미지 전달용
	
	public void setPdt_id(int pdt_id) { this.pdt_id = pdt_id; }
	public String getSlr_id() { return slr_id; }
	public void setSlr_id(String slr_id) { this.slr_id = slr_id; }
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	public String getImg_path() { return img_path; }
	public void setImg_path(String img_path) { this.img_path = img_path; }
	public int getPrice() { return price; }
	public void setPrice(int price) { this.price = price; }
	public int getQty() { return qty; }
	public void setQty(int qty) { this.qty = qty; }
	public String getUnit() { return unit; }
	public void setUnit(String unit) { this.unit = unit; }
	public Integer getCategory_id() { return category_id; }
	public void setCategory_id(Integer category_id) { this.category_id = category_id; }
	public int getStock() { return stock; }
	public void setStock(int stock) { this.stock = stock; }
	public String getStatus() { return status; }
	public void setStatus(String status) { this.status = status; }
	public String getDescription() {return description;}
	public void setDescription(String description) {this.description = description;}
	public String getSlr_nickname() {return slr_nickname;}
	public void setSlr_nickname(String slr_nickname) {this.slr_nickname = slr_nickname;}
	public int getPdt_id() { return pdt_id; }
	public MultipartFile getPdt_img() {return pdt_img;}
	public void setPdt_img(MultipartFile pdt_img) {this.pdt_img = pdt_img;}
	
	// 예외 로그 기록용
	public String toLogString() {
	    return "ProductDTO{" +
	            "pdt_id=" + pdt_id +
	            ", slr_id='" + slr_id + '\'' +
	            ", name='" + name + '\'' +
	            ", img_path='" + img_path + '\'' +
	            ", price=" + price +
	            ", qty=" + qty +
	            ", unit='" + unit + '\'' +
	            ", category_id=" + category_id +
	            ", stock=" + stock +
	            ", status='" + status + '\'' +
	            ", description='" + description + '\'' +
	            ", slr_nickname='" + slr_nickname + '\'' +
	            '}';
	}
}