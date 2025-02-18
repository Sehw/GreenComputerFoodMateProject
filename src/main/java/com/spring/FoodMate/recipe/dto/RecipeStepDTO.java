package com.spring.FoodMate.recipe.dto;

import org.springframework.stereotype.Component;

@Component("recipeStepDTO")
public class RecipeStepDTO {
    private int rcp_id;
    private int rcp_step;
    private String step_desc;
    private String stepimg_path;
    
	public int getRcp_id() {		return rcp_id;	}
	public void setRcp_id(int rcp_id) {		this.rcp_id = rcp_id;	}
	public int getRcp_step() {		return rcp_step;	}
	public void setRcp_step(int rcp_step) {		this.rcp_step = rcp_step;	}
	public String getStep_desc() {		return step_desc;	}
	public void setStep_desc(String step_desc) {		this.step_desc = step_desc;	}
	public String getStepimg_path() {		return stepimg_path;	}
	public void setStepimg_path(String stepimg_path) {		this.stepimg_path = stepimg_path;	}
}