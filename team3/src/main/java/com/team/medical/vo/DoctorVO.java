package com.team.medical.vo;

import java.sql.Date;

public class DoctorVO {
	private int doctorno;				// 의사회원번호
	private int hospitalno;				// 병원등록번호
	private String doctorid;			// 의사회원ID
	private String doctorpwd;			// 의사회원PW
	private String doctorname;			// 의사회원명
	private int doctorappro;			// 승인여부		0 : 승인대기, 1 : 승인, 2 : 탈퇴 ,	3	:	제명	
	private String doctorphone;			// 개인연락처
	private String doctoremail;			// 이메일주소
	private Date doctorregstration;		// 가입신청일
	private int doctorspecialism;		// 전문분야		1 : 내과, 2 : 이비인후과, 3 : 정신의학과, 4 : 외과, 5 : 치과
	private int point;					// 포인트
	private int sanctions;				// 제명 사유		0 : 음란, 1 : 욕설/비방, 2 : 도배, 3 : 광고/홍보, 4 : 허위정보
	private String licence;				// 의사면허이미지
	
	public String getLicence() {
		return licence;
	}
	public void setLicence(String licence) {
		this.licence = licence;
	}
	public int getDoctorno() {
		return doctorno;
	}
	public void setDoctorno(int doctorno) {
		this.doctorno = doctorno;
	}
	public int getHospitalno() {
		return hospitalno;
	}
	public void setHospitalno(int hospitalno) {
		this.hospitalno = hospitalno;
	}
	public String getDoctorid() {
		return doctorid;
	}
	public void setDoctorid(String doctorid) {
		this.doctorid = doctorid;
	}
	public String getDoctorpwd() {
		return doctorpwd;
	}
	public void setDoctorpwd(String doctorpwd) {
		this.doctorpwd = doctorpwd;
	}
	public String getDoctorname() {
		return doctorname;
	}
	public void setDoctorname(String doctorname) {
		this.doctorname = doctorname;
	}
	public int getDoctorappro() {
		return doctorappro;
	}
	public void setDoctorappro(int doctorappro) {
		this.doctorappro = doctorappro;
	}
	public String getDoctorphone() {
		return doctorphone;
	}
	public void setDoctorphone(String doctorphone) {
		this.doctorphone = doctorphone;
	}
	public String getDoctoremail() {
		return doctoremail;
	}
	public void setDoctoremail(String doctoremail) {
		this.doctoremail = doctoremail;
	}
	public Date getDoctorregstration() {
		return doctorregstration;
	}
	public void setDoctorregstration(Date doctorregstration) {
		this.doctorregstration = doctorregstration;
	}
	public int getDoctorspecialism() {
		return doctorspecialism;
	}
	public void setDoctorspecialism(int doctorspecialism) {
		this.doctorspecialism = doctorspecialism;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getSanctions() {
		return sanctions;
	}
	public void setSanctions(int sanctions) {
		this.sanctions = sanctions;
	}
	
	

}
