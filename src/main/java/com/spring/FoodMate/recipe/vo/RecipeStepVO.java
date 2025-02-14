package com.spring.FoodMate.recipe.vo;

import org.springframework.stereotype.Component;

@Component
public class RecipeStepVO {
    private int rcp_Id;
    private int rcp_Step;
    private String step_Desc;
    private String stepImg_Path;
    
	public int getRcp_Id() {
		return rcp_Id;
	}
	public void setRcp_Id(int rcp_Id) {
		this.rcp_Id = rcp_Id;
	}
	public int getRcp_Step() {
		return rcp_Step;
	}
	public void setRcp_Step(int rcp_Step) {
		this.rcp_Step = rcp_Step;
	}
	public String getStep_Desc() {
		return step_Desc;
	}
	public void setStep_Desc(String step_Desc) {
		this.step_Desc = step_Desc;
	}
	public String getStepImg_Path() {
		return stepImg_Path;
	}
	public void setStepImg_Path(String stepImg_Path) {
		this.stepImg_Path = stepImg_Path;
	}

}
