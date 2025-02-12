package com.spring.FoodMate.product.dto;

import org.springframework.stereotype.Component;

@Component("categoryDTO")
public class CategoryDTO {

	private int category_id;
	private String name;
	private Integer parent_id;
	
	public int getCategory_id() {		return category_id;	}
	public void setCategory_id(int category_id) {		this.category_id = category_id;	}
	public String getName() {		return name;	}
	public void setName(String name) {		this.name = name;	}
	public Integer getParent_id() {		return parent_id;	}
	public void setParent_id(Integer parent_id) {		this.parent_id = parent_id;	}
	
}