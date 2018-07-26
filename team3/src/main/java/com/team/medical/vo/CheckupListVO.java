package com.team.medical.vo;

import java.sql.Date;

public class CheckupListVO {

	private int doctorno;
	private int checkuplist;
	private int guestNo;
	private String checkup_kind;
	private String checkup_name;
	private String checkup_opinion;
	private String checkup_contents;
	private Date checkup_date;
	
	public String getCheckup_opinion() {
		return checkup_opinion;
	}
	public void setCheckup_opinion(String checkup_opinion) {
		this.checkup_opinion = checkup_opinion;
	}
	public int getDoctorno() {
		return doctorno;
	}
	public void setDoctorno(int doctorno) {
		this.doctorno = doctorno;
	}
	public int getCheckuplist() {
		return checkuplist;
	}
	public void setCheckuplist(int checkuplist) {
		this.checkuplist = checkuplist;
	}
	public int getGuestNo() {
		return guestNo;
	}
	public void setGuestNo(int guestNo) {
		this.guestNo = guestNo;
	}
	public String getCheckup_name() {
		return checkup_name;
	}
	public void setCheckup_name(String checkup_name) {
		this.checkup_name = checkup_name;
	}
	public String getCheckup_contents() {
		return checkup_contents;
	}
	public void setCheckup_contents(String checkup_contents) {
		this.checkup_contents = checkup_contents;
	}
	
	public String getCheckup_kind() {
		return checkup_kind;
	}
	public void setCheckup_kind(String checkup_kind) {
		this.checkup_kind = checkup_kind;
	}
	public Date getCheckup_date() {
		return checkup_date;
	}
	public void setCheckup_date(Date checkup_date) {
		this.checkup_date = checkup_date;
	}

	
}
