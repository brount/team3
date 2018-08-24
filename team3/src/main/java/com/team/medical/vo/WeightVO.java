package com.team.medical.vo;

import java.sql.Date;

public class WeightVO {
	
	 private String guestid;		// 일반회원아이디
	 private String carevalweight;	// 몸무게
	 private String carevalfat;		// 체지방
	 private String reg_date;		// 날짜

	 public String getReg_date() {
		 return reg_date;
	 }

	 public void setReg_date(String reg_date) {
		 this.reg_date = reg_date;
	 }

	 public WeightVO() {
	 }

	 public WeightVO(String guestid, String carevalweight, String carevalfat, String reg_date) {

		 this.guestid = guestid;
		 this.carevalweight = carevalweight;
		 this.carevalfat = carevalfat;
		 this.reg_date = reg_date;
	 }

	 public String getGuestid() {
		 return guestid;
	 }

	 public void setGuestid(String guestid) {
		 this.guestid = guestid;
	 }

	 public String getCarevalweight() {
		 return carevalweight;
	 }

	 public void setCarevalweight(String carevalweight) {
		 this.carevalweight = carevalweight;
	 }

	 public String getCarevalfat() {
		 return carevalfat;
	 }

	 public void setCarevalfat(String carevalfat) {
		 this.carevalfat = carevalfat;
	 }
}
