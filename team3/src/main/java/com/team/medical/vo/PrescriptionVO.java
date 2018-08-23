package com.team.medical.vo;

import java.sql.Date;

public class PrescriptionVO {
	private int prescriptionNo;			// 처방번호
	private int hospitalno;				// 병원번호
	private int guestno;				// 일반회원번호
	private String symptom;				// 증상
	private String drugname;			// 의약품명칭
	private String drugdosage;			// 의약품투여량
	private String drugrepeat;			// 의약품투여횟수
	private String dosagedate;			// 의약품투여일수
	private String dosageusage;			// 의약품용법
	private String injectionname;		// 주사명칭
	private String injectiondosage;		// 주사투여량
	private String injectionrepeat;		// 주사투여횟수
	private String injectiondate;		// 주사일수
	private String caution;				// 주의사항
	private Date prescriptionDate;		// 처방날짜
	
	public int getPrescriptionNo() {
		return prescriptionNo;
	}
	public void setPrescriptionNo(int prescriptionNo) {
		this.prescriptionNo = prescriptionNo;
	}
	public int getHospitalno() {
		return hospitalno;
	}
	public void setHospitalno(int hospitalno) {
		this.hospitalno = hospitalno;
	}
	public int getGuestno() {
		return guestno;
	}
	public void setGuestno(int guestno) {
		this.guestno = guestno;
	}
	public String getSymptom() {
		return symptom;
	}
	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}
	public String getDrugname() {
		return drugname;
	}
	public void setDrugname(String drugname) {
		this.drugname = drugname;
	}
	public String getDrugdosage() {
		return drugdosage;
	}
	public void setDrugdosage(String drugdosage) {
		this.drugdosage = drugdosage;
	}
	public String getDrugrepeat() {
		return drugrepeat;
	}
	public void setDrugrepeat(String drugrepeat) {
		this.drugrepeat = drugrepeat;
	}
	public String getDosagedate() {
		return dosagedate;
	}
	public void setDosagedate(String dosagedate) {
		this.dosagedate = dosagedate;
	}
	public String getDosageusage() {
		return dosageusage;
	}
	public void setDosageusage(String dosageusage) {
		this.dosageusage = dosageusage;
	}
	public String getInjectionname() {
		return injectionname;
	}
	public void setInjectionname(String injectionname) {
		this.injectionname = injectionname;
	}
	public String getInjectiondosage() {
		return injectiondosage;
	}
	public void setInjectiondosage(String injectiondosage) {
		this.injectiondosage = injectiondosage;
	}
	public String getInjectionrepeat() {
		return injectionrepeat;
	}
	public void setInjectionrepeat(String injectionrepeat) {
		this.injectionrepeat = injectionrepeat;
	}
	public String getInjectiondate() {
		return injectiondate;
	}
	public void setInjectiondate(String injectiondate) {
		this.injectiondate = injectiondate;
	}
	public String getCaution() {
		return caution;
	}
	public void setCaution(String caution) {
		this.caution = caution;
	}
	public Date getPrescriptionDate() {
		return prescriptionDate;
	}
	public void setPrescriptionDate(Date prescriptionDate) {
		this.prescriptionDate = prescriptionDate;
	}
	
	
	
	

}
