package com.spring.FoodMate.recipe.dto;

import java.time.LocalDateTime;
import org.springframework.stereotype.Component;

@Component("recipeDTO")
public class RecipeDTO {
    private int rcp_id;
    private String byr_id;
    private String title;
    private String mainimg_path;
    private String food_Name;
    private int category_id;
    private String req_time;
    private String description;
    private LocalDateTime create_date;
    private String status;
    
    // DB 컬럼에 맞춘 필드 
    
    private String nickname;
    
    // 뷰로 가져오는 필드(아마도?)

	public int getRcp_id() {		return rcp_id;	}
	public void setRcp_id(int rcp_id) {		this.rcp_id = rcp_id;	}
	public String getByr_id() {		return byr_id;	}
	public void setByr_id(String byr_id) {		this.byr_id = byr_id;	}
	public String getTitle() {		return title;	}
	public void setTitle(String title) {		this.title = title;	}
	public String getMainimg_path() {		return mainimg_path;	}
	public void setMainimg_path(String mainimg_path) {		this.mainimg_path = mainimg_path;	}
	public String getFood_name() {		return food_Name;	}
	public void setFood_name(String food_Name) {		this.food_Name = food_Name;	}
	public int getCategory_id() {		return category_id;	}
	public void setCategory_id(int category_id) {		this.category_id = category_id;	}
	public String getReq_time() {		return req_time;	}
	public void setReq_time(String req_time) {		this.req_time = req_time;	}
	public String getDescription() {		return description;	}
	public void setDescription(String description) {		this.description = description;	}
	public LocalDateTime getCreate_date() {		return create_date;	}
	public void setCreate_date(LocalDateTime create_date) {		this.create_date = create_date;	}
	public String getStatus() {		return status;	}
	public void setStatus(String status) {		this.status = status;	}
	public String getNickname() {		return nickname;	}
	public void setNickname(String nickname) {		this.nickname = nickname;	}
}
