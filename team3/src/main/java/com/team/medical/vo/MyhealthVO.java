package com.team.medical.vo;

public class MyhealthVO {

	private int    guestNo;
	private int    calorieno;
	private int    birth1; //생년(1994)
	private int    birth2; //월(01)
	private int    birth3; //일(13)
	private int    age; //나이 
	private String height;
	private String weight;
	private String bloodtype; //혈액형
	private String bmi;
	private String gender; // 성별
	

	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
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
	public String getBmi() {
		return bmi;
	}
	public void setBmi(String bmi) {
		this.bmi = bmi;
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
	public String getBloodtype() {
		return bloodtype;
	}
	public void setBloodtype(String bloodtype) {
		this.bloodtype = bloodtype;
	}
	
	

}
