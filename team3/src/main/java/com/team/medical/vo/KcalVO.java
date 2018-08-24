package com.team.medical.vo;

import java.sql.Date;

public class KcalVO {
	private String kcal;		// 칼로리
	private String day;			// 날짜
	private String foodname;	// 음식명

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
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
}
