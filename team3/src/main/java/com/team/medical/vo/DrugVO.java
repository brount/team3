package com.team.medical.vo;

import java.sql.Date;

public class DrugVO {

	private int drugCode; 				// 약 번호
	private String drugName; 			// 약 이름
	private String drugCompany; 		// 제조회사
	private String drugGroupCode; 		// 약효분류코드
	private String drugGroup; 			// 약효분류
	private String pro_Usual; 			// 전문/일반
	private Date admitDate; 			// 허가일자
	private String temperState; 		// 성상
	private String shape; 				// 약 제형
	private String drugImage; 			// 낱알 이미지
	private String signF; 				// 표시(앞)
	private String signB; 				// 표시(뒤)
	private String drugForm; 			// 약 모양
	private String colorF; 				// 색상(앞)
	private String colorB; 				// 색상(뒤)
	private String splitlineF; 			// 분할선(앞)
	private String splitlineB; 			// 분할선(뒤)
	private int maxAxis; 				// 크기(장축)
	private int minAxis; 				// 크기(단축)
	private int thickness; 				// 크기(두께)
	private Date registDate; 			// 등록일자
	private String markF; 				// 마크내용(앞)
	private String markB; 				// 마크내용(뒤)
	private String markImageF; 			// 마크이미지(앞)
	private String markImageB; 			// 마크이미지(뒤)
	private String markCodeF; 			// 마크코드(앞)
	private String markCodeB; 			// 마크코드(뒤)
	// -----------------------------------------------------
	private String drugStorageMethod; 	// 저장방법
	private String drugEfficacy; 		// 효능 효과
	private String drugUsedCapacity; 	// 용법용량
	private String drugPrecautions; 	// 주의사항

	public int getDrugCode() {
		return drugCode;
	}

	public void setDrugCode(int drugCode) {
		this.drugCode = drugCode;
	}

	public String getDrugName() {
		return drugName;
	}

	public void setDrugName(String drugName) {
		this.drugName = drugName;
	}

	public String getDrugCompany() {
		return drugCompany;
	}

	public void setDrugCompany(String drugCompany) {
		this.drugCompany = drugCompany;
	}

	public String getDrugGroupCode() {
		return drugGroupCode;
	}

	public void setDrugGroupCode(String drugGroupCode) {
		this.drugGroupCode = drugGroupCode;
	}

	public String getDrugGroup() {
		return drugGroup;
	}

	public void setDrugGroup(String drugGroup) {
		this.drugGroup = drugGroup;
	}

	public String getPro_Usual() {
		return pro_Usual;
	}

	public void setPro_Usual(String pro_Usual) {
		this.pro_Usual = pro_Usual;
	}

	public Date getAdmitDate() {
		return admitDate;
	}

	public void setAdmitDate(Date admitDate) {
		this.admitDate = admitDate;
	}

	public String getTemperState() {
		return temperState;
	}

	public void setTemperState(String temperState) {
		this.temperState = temperState;
	}

	public String getShape() {
		return shape;
	}

	public void setShape(String shape) {
		this.shape = shape;
	}

	public String getDrugImage() {
		return drugImage;
	}

	public void setDrugImage(String drugImage) {
		this.drugImage = drugImage;
	}

	public String getSignF() {
		return signF;
	}

	public void setSignF(String signF) {
		this.signF = signF;
	}

	public String getSignB() {
		return signB;
	}

	public void setSignB(String signB) {
		this.signB = signB;
	}

	public String getDrugForm() {
		return drugForm;
	}

	public void setDrugForm(String drugForm) {
		this.drugForm = drugForm;
	}

	public String getColorF() {
		return colorF;
	}

	public void setColorF(String colorF) {
		this.colorF = colorF;
	}

	public String getColorB() {
		return colorB;
	}

	public void setColorB(String colorB) {
		this.colorB = colorB;
	}

	public String getSplitlineF() {
		return splitlineF;
	}

	public void setSplitlineF(String splitlineF) {
		this.splitlineF = splitlineF;
	}

	public String getSplitlineB() {
		return splitlineB;
	}

	public void setSplitlineB(String splitlineB) {
		this.splitlineB = splitlineB;
	}

	public int getMaxAxis() {
		return maxAxis;
	}

	public void setMaxAxis(int maxAxis) {
		this.maxAxis = maxAxis;
	}

	public int getMinAxis() {
		return minAxis;
	}

	public void setMinAxis(int minAxis) {
		this.minAxis = minAxis;
	}

	public int getThickness() {
		return thickness;
	}

	public void setThickness(int thickness) {
		this.thickness = thickness;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public String getMarkF() {
		return markF;
	}

	public void setMarkF(String markF) {
		this.markF = markF;
	}

	public String getMarkB() {
		return markB;
	}

	public void setMarkB(String markB) {
		this.markB = markB;
	}

	public String getMarkImageF() {
		return markImageF;
	}

	public void setMarkImageF(String markImageF) {
		this.markImageF = markImageF;
	}

	public String getMarkImageB() {
		return markImageB;
	}

	public void setMarkImageB(String markImageB) {
		this.markImageB = markImageB;
	}

	public String getMarkCodeF() {
		return markCodeF;
	}

	public void setMarkCodeF(String markCodeF) {
		this.markCodeF = markCodeF;
	}

	public String getMarkCodeB() {
		return markCodeB;
	}

	public void setMarkCodeB(String markCodeB) {
		this.markCodeB = markCodeB;
	}

	public String getDrugStorageMethod() {
		return drugStorageMethod;
	}

	public void setDrugStorageMethod(String drugStorageMethod) {
		this.drugStorageMethod = drugStorageMethod;
	}

	public String getDrugEfficacy() {
		return drugEfficacy;
	}

	public void setDrugEfficacy(String drugEfficacy) {
		this.drugEfficacy = drugEfficacy;
	}

	public String getDrugUsedCapacity() {
		return drugUsedCapacity;
	}

	public void setDrugUsedCapacity(String drugUsedCapacity) {
		this.drugUsedCapacity = drugUsedCapacity;
	}

	public String getDrugPrecautions() {
		return drugPrecautions;
	}

	public void setDrugPrecautions(String drugPrecautions) {
		this.drugPrecautions = drugPrecautions;
	}

}