package com.team.medical.vo;

import java.sql.Date;

public class ExaminationVO {
	//검진서
	private int COL;					// 검진서번호
	private int guestNo;				// 일반회원번호
	private String guestname;			// 회원이름
	private String height;				// 신장
	private String weight;				// 체중
	private String fatness;				// 비만도
	private String visionl;				// 시력(좌)
	private String visionr;				// 시력(우)
	private String hearingl;			// 청력(좌)
	private String hearingr;			// 청력(우)
	private String bloodpremax;			// 혈압(최고)
	private String bloodpremin;			// 혈압(최저)
	private String urineglucose;		// 요당
	private String urineprotein;		// 요단백
	private String occulthematuria;		// 요잠혈
	private String urineph;				// 요ph
	private String hemoglobin;			// 혈색소
	private String bloodglucose;		// 혈당
	private String totalcholesterol;	// 총콜레스테롤
	private String ast;					// AST(SGOT)
	private String alt;					// ALT(SGPT)
	private String gammagtp;			// 감마지티피
	private String hepatitisscr;		// 간염검사
	private String breastradiography;	// 흉부방사선검사
	private String ecg;					// 심전도검사
	private Date examinationday;		// 검진날짜
	
	public int getCOL() {
		return COL;
	}
	public void setCOL(int cOL) {
		COL = cOL;
	}
	public int getGuestNo() {
		return guestNo;
	}
	public void setGuestNo(int guestNo) {
		this.guestNo = guestNo;
	}
	public String getGuestname() {
		return guestname;
	}
	public void setGuestname(String guestname) {
		this.guestname = guestname;
	}
	public int getGuestno() {
		return guestNo;
	}
	public void setGuestno(int guestNo) {
		this.guestNo = guestNo;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getFatness() {
		return fatness;
	}
	public void setFatness(String fatness) {
		this.fatness = fatness;
	}
	public String getVisionl() {
		return visionl;
	}
	public void setVisionl(String visionl) {
		this.visionl = visionl;
	}
	public String getVisionr() {
		return visionr;
	}
	public void setVisionr(String visionr) {
		this.visionr = visionr;
	}
	public String getHearingl() {
		return hearingl;
	}
	public void setHearingl(String hearingl) {
		this.hearingl = hearingl;
	}
	public String getHearingr() {
		return hearingr;
	}
	public void setHearingr(String hearingr) {
		this.hearingr = hearingr;
	}
	public String getBloodpremax() {
		return bloodpremax;
	}
	public void setBloodpremax(String bloodpremax) {
		this.bloodpremax = bloodpremax;
	}
	public String getBloodpremin() {
		return bloodpremin;
	}
	public void setBloodpremin(String bloodpremin) {
		this.bloodpremin = bloodpremin;
	}
	public String getUrineglucose() {
		return urineglucose;
	}
	public void setUrineglucose(String urineglucose) {
		this.urineglucose = urineglucose;
	}
	public String getUrineprotein() {
		return urineprotein;
	}
	public void setUrineprotein(String urineprotein) {
		this.urineprotein = urineprotein;
	}
	public String getOcculthematuria() {
		return occulthematuria;
	}
	public void setOcculthematuria(String occulthematuria) {
		this.occulthematuria = occulthematuria;
	}
	public String getUrineph() {
		return urineph;
	}
	public void setUrineph(String urineph) {
		this.urineph = urineph;
	}
	public String getHemoglobin() {
		return hemoglobin;
	}
	public void setHemoglobin(String hemoglobin) {
		this.hemoglobin = hemoglobin;
	}
	public String getBloodglucose() {
		return bloodglucose;
	}
	public void setBloodglucose(String bloodglucose) {
		this.bloodglucose = bloodglucose;
	}
	public String getTotalcholesterol() {
		return totalcholesterol;
	}
	public void setTotalcholesterol(String totalcholesterol) {
		this.totalcholesterol = totalcholesterol;
	}
	public String getAst() {
		return ast;
	}
	public void setAst(String ast) {
		this.ast = ast;
	}
	public String getAlt() {
		return alt;
	}
	public void setAlt(String alt) {
		this.alt = alt;
	}
	public String getGammagtp() {
		return gammagtp;
	}
	public void setGammagtp(String gammagtp) {
		this.gammagtp = gammagtp;
	}
	public String getHepatitisscr() {
		return hepatitisscr;
	}
	public void setHepatitisscr(String hepatitisscr) {
		this.hepatitisscr = hepatitisscr;
	}
	public String getBreastradiography() {
		return breastradiography;
	}
	public void setBreastradiography(String breastradiography) {
		this.breastradiography = breastradiography;
	}
	public String getEcg() {
		return ecg;
	}
	public void setEcg(String ecg) {
		this.ecg = ecg;
	}
	public Date getExaminationday() {
		return examinationday;
	}
	public void setExaminationday(Date examinationday) {
		this.examinationday = examinationday;
	}
	
	
	

}
