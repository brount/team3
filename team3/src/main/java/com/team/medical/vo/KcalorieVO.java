package com.team.medical.vo;

import java.sql.Date;

public class KcalorieVO {
	private int guestno	;
	private String foodname;
	private String kcal;
	private Date day;
	
	public int getGuestno() {
		return guestno;
	}
	public void setGuestno(int guestno) {
		this.guestno = guestno;
	}
	public String getFoodname() {
		return foodname;
	}
	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
	public String getKcal() {
		return kcal;
	}
	public void setKcal(String kcal) {
		this.kcal = kcal;
	}
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
}
