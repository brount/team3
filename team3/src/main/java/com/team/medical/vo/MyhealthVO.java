package com.team.medical.vo;

import java.sql.Date;

public class MyhealthVO {

	private int    guestNo;
	private int    calorieno;
	private int    birth1; //생년(1994)
	private int    birth2; //월(01)
	private int    birth3; //일(13)
	private int    age; //나이 
	private int height;
	private int weight;
	private String bloodtype; //혈액형
	private int bmi;
	private int gender; // 성별 - 1: 여자, 2: 남자

	
	
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
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public String getBloodtype() {
		return bloodtype;
	}
	public void setBloodtype(String bloodtype) {
		this.bloodtype = bloodtype;
	}
	public int getBmi() {
		return bmi;
	}
	public void setBmi(int bmi) {
		this.bmi = bmi;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	
	
	

	
	
	

}
