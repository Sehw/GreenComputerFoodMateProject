package com.spring.FoodMate.member.dto;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("sellerDTO")
public class SellerDTO {
	// 로그인
	private String slr_id;
	private String password; // 로그인시에만 사용, 세션 정보 삽입때 사용X
	private String name;
	private String business_no;
	private String email;
	private String phone_num;
	private String status;
	private String nickname;

	// 회원가입 요소
	private String password_confirm;
	private String email_id;
	private String email_domain;
	private String customMail;
	private String bsnum1;
	private String bsnum2;
	private String bsnum3;

	private MultipartFile profileImage;

	public String getSlr_id() { return slr_id; }
	public void setSlr_id(String slr_id) { this.slr_id = slr_id; }
	public String getPassword() { return password; }
	public void setPassword(String password) { this.password = password; }
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	public String getBusiness_no() { return business_no; }
	public void setBusiness_no(String business_no) { this.business_no = business_no; }
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	public String getPhone_num() { return phone_num; }
	public void setPhone_num(String phone_num) { this.phone_num = phone_num; }
	public String getStatus() { return status; }
	public void setStatus(String status) { this.status = status; }
	public String getNickname() { return nickname; }
	public void setNickname(String nickname) { this.nickname = nickname; }
	public String getPassword_confirm() { return password_confirm; }
	public void setPassword_confirm(String password_confirm) { this.password_confirm = password_confirm; }
	public String getEmail_id() { return email_id; }
	public void setEmail_id(String email_id) { this.email_id = email_id; }
	public String getEmail_domain() { return email_domain; }
	public void setEmail_domain(String email_domain) { this.email_domain = email_domain; }
	public String getCustomMail() { return customMail; }
	public void setCustomMail(String customMail) { this.customMail = customMail; }
	public String getBsnum1() { return bsnum1; }
	public void setBsnum1(String bsnum1) { this.bsnum1 = bsnum1; }
	public String getBsnum2() { return bsnum2; }
	public void setBsnum2(String bsnum2) { this.bsnum2 = bsnum2; }
	public String getBsnum3() { return bsnum3; }
	public void setBsnum3(String bsnum3) { this.bsnum3 = bsnum3; }
	public MultipartFile getProfileImage() { return profileImage; }
	public void setProfileImage(MultipartFile profileImage) { this.profileImage = profileImage; }

}