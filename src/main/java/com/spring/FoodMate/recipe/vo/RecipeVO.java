package com.spring.FoodMate.recipe.vo;

import java.util.Date;
import org.springframework.stereotype.Component;

@Component("RecipeVO")
public class RecipeVO {
    private int rcp_Id;
    private String byr_Id;
	private int category_Id;
    private String title;
	private String mainImg_Path;
    private String food_Name;
    private String req_Time;
    private String description;
    private Date create_Date;
    private String status;
    
    public int getRcp_Id() {
		return rcp_Id;
	}
	public void setRcp_Id(int rcp_Id) {
		this.rcp_Id = rcp_Id;
	}
	public String getByr_Id() {
		return byr_Id;
	}
	public void setByr_Id(String byr_Id) {
		this.byr_Id = byr_Id;
	}
	public int getCategory_Id() {
		return category_Id;
	}
	public void setCategory_Id(int category_Id) {
		this.category_Id = category_Id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMainImg_Path() {
		return mainImg_Path;
	}
	public void setMainImg_Path(String mainImg_Path) {
		this.mainImg_Path = mainImg_Path;
	}
	public String getFood_Name() {
		return food_Name;
	}
	public void setFood_Name(String food_Name) {
		this.food_Name = food_Name;
	}
	public String getReq_Time() {
		return req_Time;
	}
	public void setReq_Time(String req_Time) {
		this.req_Time = req_Time;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreate_Date() {
		return create_Date;
	}
	public void setCreate_Date(Date create_Date) {
		this.create_Date = create_Date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
