package com.spring.FoodMate.recipe.dto;

import org.springframework.stereotype.Component;

@Component("recipeCategoryDTO")
public class RecipeCategoryDTO {
    private int category_id;  // CATEGORY_ID
    private String name;     // NAME
    private int parent_id; // PARENT_ID

    // 기본 생성자
    public RecipeCategoryDTO() {}

    // 생성자 (categoryId, name, parentId를 전달받는 생성자)
    public RecipeCategoryDTO(int category_id, String name, Integer parent_id) {
        this.category_id = category_id;
        this.name = name;
        this.parent_id = parent_id;
    }

    public int getCategory_id() {		return category_id;	}
	public void setCategory_id(int category_id) {		this.category_id = category_id;	}
	public String getName() {		return name;	}
	public void setName(String name) {		this.name = name;	}
	public int getParent_id() {		return parent_id;	}
	public void setParent_id(int parent_id) {		this.parent_id = parent_id;	}
	
	public String toLogString() {
        return "RecipeCategoryVO [category_Id=" + category_id + ", name=" + name + ", parent_Id=" + parent_id + "]";
    }
}