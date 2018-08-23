package com.team.medical.vo;

import java.sql.Date;

public class HealthcareVO {
	private String careno;		// 번호
	private String guestid;		// 일반회원Id
	private String caretitle;	// 항목이름
	private String careval;		// 항목수치
	private String reg_date;	// 등록일
	
	public String getCareno() {
		return careno;
	}
	public void setCareno(String careno) {
		this.careno = careno;
	}
	public String getGuestid() {
		return guestid;
	}
	public void setGuestid(String guestid) {
		this.guestid = guestid;
	}
	public String getCaretitle() {
		return caretitle;
	}
	public void setCaretitle(String caretitle) {
		this.caretitle = caretitle;
	}
	public String getCareval() {
		return careval;
	}
	public void setCareval(String careval) {
		this.careval = careval;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
