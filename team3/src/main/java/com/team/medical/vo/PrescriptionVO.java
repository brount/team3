package com.team.medical.vo;

import java.sql.Date;

public class PrescriptionVO {
	private int prescriptionNo;
	private int hospitalno;
	private int guestno;
	private String symptom;
	private String drugname;
	private String drugdosage;
	private int drugrepeat;
	private int dosagedate;
	private String dosageusage;
	private String injectionname;
	private String injectiondosage;
	private int injectionrepeat;
	private int injectiondate;
	private String caution;
	private Date prescriptionDate;
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
	public int getDrugrepeat() {
		return drugrepeat;
	}
	public void setDrugrepeat(int drugrepeat) {
		this.drugrepeat = drugrepeat;
	}
	public int getDosagedate() {
		return dosagedate;
	}
	public void setDosagedate(int dosagedate) {
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
	public int getInjectionrepeat() {
		return injectionrepeat;
	}
	public void setInjectionrepeat(int injectionrepeat) {
		this.injectionrepeat = injectionrepeat;
	}
	public int getInjectiondate() {
		return injectiondate;
	}
	public void setInjectiondate(int injectiondate) {
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
