package com.team.medical.vo;

import java.sql.Date;

public class GuestVO {
	private int 	guestNo;		// 회원번호
	private String 	jumin;			// 주민번호
	private String 	guestid;		// 회원아이디
	private String 	guestpwd;		// 회원비밀번호
	private String 	guestname;		// 회원명
	private int 	guestage;		// 회원연령
	private String 	guesttel;		// 회원연락처
	private String 	guestemail;		// 회원이메일
	private String 	address1;		// 우편번호
	private String 	address2;		// 지번 주소
	private String 	address3;		// 도로명 주소
	private String 	favoritehos;	// 즐겨찾는 병원
	private Date 	guestdate;		// 가입일
	private int 	sanctions;		// 제제단계
	private int 	status;			// 탈퇴여부			0 : 일반    -   1 : 탈퇴 or 제명
	private String  reason;			// 제제사유
	
	public  int getGuestNo() {
		return guestNo;
	}
	public void setGuestNo(int guestNo) {
		this.guestNo = guestNo;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getGuestid() {
		return guestid;
	}
	public void setGuestid(String guestid) {
		this.guestid = guestid;
	}
	public String getGuestpwd() {
		return guestpwd;
	}
	public void setGuestpwd(String guestpwd) {
		this.guestpwd = guestpwd;
	}
	public String getGuestname() {
		return guestname;
	}
	public void setGuestname(String guestname) {
		this.guestname = guestname;
	}
	public int getGuestage() {
		return guestage;
	}
	public void setGuestage(int guestage) {
		this.guestage = guestage;
	}
	public String getGuesttel() {
		return guesttel;
	}
	public void setGuesttel(String guesttel) {
		this.guesttel = guesttel;
	}
	public String getGuestemail() {
		return guestemail;
	}
	public void setGuestemail(String guestemail) {
		this.guestemail = guestemail;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public String getFavoritehos() {
		return favoritehos;
	}
	public void setFavoritehos(String favoritehos) {
		this.favoritehos = favoritehos;
	}
	public Date getGuestdate() {
		return guestdate;
	}
	public void setGuestdate(Date guestdate) {
		this.guestdate = guestdate;
	}
	public int getSanctions() {
		return sanctions;
	}
	public void setSanctions(int sanctions) {
		this.sanctions = sanctions;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	

}
