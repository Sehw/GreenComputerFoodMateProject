package com.spring.FoodMate.member.vo;


import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("sellerVO")
public class Seller {
	private String member_id;
	private String member_password;
	private String password_confirm;
	private String name;
	private String ssn6;
	private String ssn1;
	private String gender;
	private String mail1;
	private String mail2;
	private String customMail;
	private String phone;
	private String zipcode;
	private String roadAddress;
	private String remainaddress;
	private MultipartFile profileImage;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
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
	public String getMail1() {
		return mail1;
	}
	public void setMail1(String mail1) {
		this.mail1 = mail1;
	}
	public String getMail2() {
		return mail2;
	}
	public void setMail2(String mail2) {
		this.mail2 = mail2;
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
}

