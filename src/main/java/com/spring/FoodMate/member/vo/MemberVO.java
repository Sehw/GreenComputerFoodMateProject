package com.spring.FoodMate.member.vo;


import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("memberVO")
public class MemberVO {
	// 로그인 & 회원가입
	private String id;
	private String password;
	private String password_confirm;
	private String name;
	private String birth_6;
	private String ssn1;
	private String sex;
	private String email;
	private String email_id;
	private String email_domain;
	private String customMail;
	private String phone_num;
	private String zipcode;
	private String roadAddress;
	private String remainaddress;
	private String deleteidstatus;
	
	private String byr_id;

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
	public String getBirth_6() {
		return birth_6;
	}
	public void setBirth_6(String birth_6) {
		this.birth_6 = birth_6;
	}
	public String getByr_id() {
		return byr_id;
	}
	public void setByr_id(String byr_id) {
		this.byr_id = byr_id;
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
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
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
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getDeleteidstatus() {
		return deleteidstatus;
	}
	public void setDeleteidstatus(String deleteidstatus) {
		this.deleteidstatus = deleteidstatus;
	}
}

