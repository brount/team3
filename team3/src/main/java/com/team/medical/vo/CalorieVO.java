package com.team.medical.vo;

import java.sql.Date;

public class CalorieVO {
	private int guestNo;
	private int calorieno;
	private String food;
	private int calorie;
	private Date day;
	private int todaycal;

	
	public int getCalorieno() {
		return calorieno;
	}
	public void setCalorieno(int calorieno) {
		this.calorieno = calorieno;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public int getCalorie() {
		return calorie;
	}
	public void setCalorie(int calorie) {
		this.calorie = calorie;
	}
	public int getGuestNo() {
		return guestNo;
	}
	public void setGuestNo(int guestNo) {
		this.guestNo = guestNo;
	}
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	public int getTodaycal() {
		return todaycal;
	}
	public void setTodaycal(int todaycal) {
		this.todaycal = todaycal;
	}

	
	
}
