package com.team.medical.vo;

import java.sql.Date;

public class MyhealthVO {

	private int guestNo;		// 일반회원번호
	private int calorieno;		// 칼로리번호
	private int birth1; 		// 생년
	private int birth2; 		// 월
	private int birth3; 		// 일
	private int age; 			// 나이 
	private String height;		// 신장
	private String weight;		// 체중
	private String bloodtype; 	// 혈액형
	private String bmi;			// BMI 지수
	private int gender; 		// 성별 - 1: 여자, 2: 남자
	
	public int getGuestNo() {
		return guestNo;
	}
	public void setGuestNo(int guestNo) {
		this.guestNo = guestNo;
	}
	public int getCalorieno() {
		return calorieno;
	}
	public void setCalorieno(int calorieno) {
		this.calorieno = calorieno;
	}
	public int getBirth1() {
		return birth1;
	}
	public void setBirth1(int birth1) {
		this.birth1 = birth1;
	}
	public int getBirth2() {
		return birth2;
	}
	public void setBirth2(int birth2) {
		this.birth2 = birth2;
	}
	public int getBirth3() {
		return birth3;
	}
	public void setBirth3(int birth3) {
		this.birth3 = birth3;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getBloodtype() {
		return bloodtype;
	}
	public void setBloodtype(String bloodtype) {
		this.bloodtype = bloodtype;
	}
	public String getBmi() {
		return bmi;
	}
	public void setBmi(String bmi) {
		this.bmi = bmi;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	
	
	

	
	
	

}
