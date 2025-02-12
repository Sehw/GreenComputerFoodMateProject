package com.spring.FoodMate.mypage.dto;

import org.springframework.stereotype.Component;

@Component("ProfileVO")
public class ProfileDTO {
	private String nickname;
	private String img_path;
	private String BIO; //자기소개
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public String getBIO() {
		return BIO;
	}
	public void setBIO(String bIO) {
		BIO = bIO;
	}
}
