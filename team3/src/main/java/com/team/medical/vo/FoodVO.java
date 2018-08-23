package com.team.medical.vo;

import java.sql.Date;

public class FoodVO {
	private String foodkind;		// 식품군
	private String foodname;		// 음식명
	private String gram;			// 일회섭취량
	private String kcal;			// 칼로리
	private String carbohydrate;	// 탄수화물
	private String protein;			// 단백질
	private String fat;				// 지방
	private String sugars;			// 당류
	private String salt;			// 나트륨
	private String cholesterol;		// 콜레스테롤
	private String sfa;				// 포화지방산
	private String tfa;				// 트랜스지방산
	
	public String getFoodkind() {
		return foodkind;
	}
	public void setFoodkind(String foodkind) {
		this.foodkind = foodkind;
	}
	public String getFoodname() {
		return foodname;
	}
	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
	public String getGram() {
		return gram;
	}
	public void setGram(String gram) {
		this.gram = gram;
	}
	public String getKcal() {
		return kcal;
	}
	public void setKcal(String kcal) {
		this.kcal = kcal;
	}
	public String getCarbohydrate() {
		return carbohydrate;
	}
	public void setCarbohydrate(String carbohydrate) {
		this.carbohydrate = carbohydrate;
	}
	public String getProtein() {
		return protein;
	}
	public void setProtein(String protein) {
		this.protein = protein;
	}
	public String getFat() {
		return fat;
	}
	public void setFat(String fat) {
		this.fat = fat;
	}
	public String getSugars() {
		return sugars;
	}
	public void setSugars(String sugars) {
		this.sugars = sugars;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getCholesterol() {
		return cholesterol;
	}
	public void setCholesterol(String cholesterol) {
		this.cholesterol = cholesterol;
	}
	public String getSfa() {
		return sfa;
	}
	public void setSfa(String sfa) {
		this.sfa = sfa;
	}
	public String getTfa() {
		return tfa;
	}
	public void setTfa(String tfa) {
		this.tfa = tfa;
	}
	
}
