package com.spring.FoodMate.post.vo;

import org.springframework.stereotype.Component;

@Component("postVO")
public class postVO {
	private String dong;
	private String sigungu;
	private String doro;
	
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getDoro() {
		return doro;
	}
	public void setDoro(String doro) {
		this.doro = doro;
	}
}
