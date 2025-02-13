package com.spring.FoodMate.recipe.vo;

import org.springframework.stereotype.Component;

@Component
public class RecipeIngredientVO {
    private int rcp_Id;
    private String ingrd_Name;
    private int category_Id; //상품카테고리ID
    private int ingrd_Qty;
    private String unit;
    
	public int getRcp_Id() {
		return rcp_Id;
	}
	public void setRcp_Id(int rcp_Id) {
		this.rcp_Id = rcp_Id;
	}
	public String getIngrd_Name() {
		return ingrd_Name;
	}
	public void setIngrd_Name(String ingrd_Name) {
		this.ingrd_Name = ingrd_Name;
	}
	public int getCategory_Id() {
		return category_Id;
	}
	public void setCategory_Id(int category_Id) {
		this.category_Id = category_Id;
	}
	public int getIngrd_Qty() {
		return ingrd_Qty;
	}
	public void setIngrd_Qty(int ingrd_Qty) {
		this.ingrd_Qty = ingrd_Qty;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}



	    @Override
	    public String toString() {
	        return "RecipeIngredientVO{" +
	                "rcp_Id=" + rcp_Id +
	                ", ingrd_Name='" + ingrd_Name + '\'' +
	                ", ingrd_Qty='" + ingrd_Qty + '\'' +
	                ", unit='" + unit + '\'' +
	                '}';
	    }
	

}
