package com.spring.FoodMate.member.vo;


import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("memberVO")
public class MemberVO {
	private String id;
	private String password;
	private String password_confirm;
	private String name;
	private String ssn6;
	private String ssn1;
	private String gender;
	private String email;
	private String email_domain;
	private String customMail;
	private String phone;
	private String zipcode;
	private String roadAddress;
	private String remainaddress;
	private String deleteidstatus;

	private MultipartFile profileImage;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword_confirm() {
		return password_confirm;
	}
	public void setPassword_confirm(String password_confirm) {
		this.password_confirm = password_confirm;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSsn6() {
		return ssn6;
	}
	public void setSsn6(String ssn6) {
		this.ssn6 = ssn6;
	}
	public String getSsn1() {
		return ssn1;
	}
	public void setSsn1(String ssn1) {
		this.ssn1 = ssn1;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail_domain() {
		return email_domain;
	}
	public void setEmail_domain(String email_domain) {
		this.email_domain = email_domain;
	}
	public String getCustomMail() {
		return customMail;
	}
	public void setCustomMail(String customMail) {
		this.customMail = customMail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getRemainaddress() {
		return remainaddress;
	}
	public void setRemainaddress(String remainaddress) {
		this.remainaddress = remainaddress;
	}
	public MultipartFile getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(MultipartFile profileImage) {
		this.profileImage = profileImage;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDeleteidstatus() {
		return deleteidstatus;
	}
	public void setDeleteidstatus(String deleteidstatus) {
		this.deleteidstatus = deleteidstatus;
	}
}

