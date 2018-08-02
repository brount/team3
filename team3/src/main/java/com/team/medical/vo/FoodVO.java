package com.team.medical.vo;

import java.sql.Date;

public class FoodVO {
	
	

	// 개인음식관리
	private int    guestNo;
	private String food;
	private int foodcal;
	private int foodno;
	private int foodgram;
	private Date day;   
	private int todaycal;
	
	
	
	public int getGuestNo() {
		return guestNo;
	}
	public void setGuestNo(int guestNo) {
		this.guestNo = guestNo;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public int getFoodcal() {
		return foodcal;
	}
	public void setFoodcal(int foodcal) {
		this.foodcal = foodcal;
	}
	public int getFoodno() {
		return foodno;
	}
	public void setFoodno(int foodno) {
		this.foodno = foodno;
	}
	public int getFoodgram() {
		return foodgram;
	}
	public void setFoodgram(int foodgram) {
		this.foodgram = foodgram;
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
