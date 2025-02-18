package com.spring.FoodMate.recipe.dto;

import org.springframework.stereotype.Component;

@Component("recipeIngredientDTO")
public class RecipeIngredientDTO {
    private int rcp_id;
    private String ingrd_name;
    private int category_id; //상품카테고리ID
    private int ingrd_qty;
    private String unit;
    
    public int getRcp_id() {		return rcp_id;	}
	public void setRcp_id(int rcp_id) {		this.rcp_id = rcp_id;	}
	public String getIngrd_name() {		return ingrd_name;	}
	public void setIngrd_name(String ingrd_name) {		this.ingrd_name = ingrd_name;	}
	public int getCategory_id() {		return category_id;	}
	public void setCategory_id(int category_id) {		this.category_id = category_id;	}
	public int getIngrd_qty() {		return ingrd_qty;	}
	public void setIngrd_qty(int ingrd_qty) {		this.ingrd_qty = ingrd_qty;	}
	public String getUnit() {		return unit;	}
	public void setUnit(String unit) {		this.unit = unit;	}
	
	public String toLogString() {
        return "RecipeIngredientVO{" +
                "rcp_Id=" + rcp_id +
                ", ingrd_Name='" + ingrd_name + '\'' +
                ", ingrd_Qty='" + ingrd_qty + '\'' +
                ", unit='" + unit + '\'' +
                '}';
    }
}