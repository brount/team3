package com.team.medical.vo;

import java.sql.Date;

public class KcalorieVO {
	
	private int guestno;		// 일반회원번호
	private String foodname;	// 음식명
	private String kcal;		// 칼로리
	private Date day;			// 등록일
	
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
