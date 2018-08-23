package com.team.medical.vo;

import java.sql.Date;

public class ReservationVO {
	//예약목록
	
	private int hospitalno;		 	// 병원번호
	private String hospitalname; 	// 병원명
	private int doctorNo;			// 의사번호
	private int reservationNo;		// 예약번호
	private int guestNo;			// 환자번호
	private Date reservationTime;	// 예약날짜
	private int reservationKind; 	// 예약종류
	
	private String hospitalkind; 	// 진료과
	private String clock;			// 예약시간 - 시
	private String minute; 			// 예약 시간 - 분
	private String symptom; 		// 증상 텍스트
	private String symptomchk; 		// 증상체크
	private int reservationappro; 	// 예약 확인 여부
	
	
	public int getReservationappro() {
		return reservationappro;
	}
	public void setReservationappro(int reservationappro) {
		this.reservationappro = reservationappro;
	}
	public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	
	
	
	public String getHospitalname() {
		return hospitalname;
	}
	public void setHospitalname(String hospitalname) {
		this.hospitalname = hospitalname;
	}
	public int getDoctorNo() {
		return doctorNo;
	}
	public void setDoctorNo(int doctorNo) {
		this.doctorNo = doctorNo;
	}
	public int getGuestNo() {
		return guestNo;
	}
	public void setGuestNo(int guestNo) {
		this.guestNo = guestNo;
	}
	public Date getReservationTime() {
		return reservationTime;
	}
	public void setReservationTime(Date reservationTime) {
		this.reservationTime = reservationTime;
	}
	public int getReservationKind() {
		return reservationKind;
	}
	public void setReservationKind(int reservationKind) {
		this.reservationKind = reservationKind;
	}
	public int getHospitalno() {
		return hospitalno;
	}
	public void setHospitalno(int hospitalno) {
		this.hospitalno = hospitalno;
	}
	public String getHospitalkind() {
		return hospitalkind;
	}
	public void setHospitalkind(String hospitalkind) {
		this.hospitalkind = hospitalkind;
	}
	public String getClock() {
		return clock;
	}
	public void setClock(String clock) {
		this.clock = clock;
	}
	public String getMinute() {
		return minute;
	}
	public void setMinute(String minute) {
		this.minute = minute;
	}
	public String getSymptom() {
		return symptom;
	}
	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}
	public String getSymptomchk() {
		return symptomchk;
	}
	public void setSymptomchk(String symptomchk) {
		this.symptomchk = symptomchk;
	}
	
	

}
