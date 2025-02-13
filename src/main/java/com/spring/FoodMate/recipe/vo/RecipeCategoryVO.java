package com.spring.FoodMate.recipe.vo;

public class RecipeCategoryVO {
    private int category_Id;  // CATEGORY_ID
    private String name;     // NAME
    private int parent_Id; // PARENT_ID

    // 기본 생성자
    public RecipeCategoryVO() {}

    // 생성자 (categoryId, name, parentId를 전달받는 생성자)
    public RecipeCategoryVO(int category_Id, String name, Integer parent_Id) {
        this.category_Id = category_Id;
        this.name = name;
        this.parent_Id = parent_Id;
    }

    
    public int getCategory_Id() {
        return category_Id;
    }

    public void setCategory_Id(int category_Id) {
        this.category_Id = category_Id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getParent_Id() {
        return parent_Id;
    }

    public void setParent_Id(int parent_Id) {
        this.parent_Id = parent_Id;
    }

    @Override
    public String toString() {
        return "RecipeCategoryVO [category_Id=" + category_Id + ", name=" + name + ", parent_Id=" + parent_Id + "]";
    }
}
