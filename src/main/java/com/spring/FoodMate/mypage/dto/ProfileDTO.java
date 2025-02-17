package com.spring.FoodMate.mypage.dto;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("profileDTO")
public class ProfileDTO {
	private String byr_id;
	private String nickname;
	private String img_path;
	private String BIO; //자기소개
	private MultipartFile profileImageInput; // 프로필 이미지
	
	// 생성자 (byr_id를 전달받는 생성자)
    public ProfileDTO() {
    }
	
    // 생성자 (byr_id를 전달받는 생성자)
    public ProfileDTO(String byr_id) {
        this.byr_id = byr_id;
    }
	
	public String getByr_id() {
		return byr_id;
	}

	public void setByr_id(String byr_id) {
		this.byr_id = byr_id;
	}

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

	public MultipartFile getProfileImageInput() {
		return profileImageInput;
	}

	public void setProfileImageInput(MultipartFile profileImageInput) {
		this.profileImageInput = profileImageInput;
	}
	
	
}
