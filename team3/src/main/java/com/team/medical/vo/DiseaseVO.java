package com.team.medical.vo;

public class DiseaseVO {
	private int diseaseCode;				// 질병코드
	private String diseaseName;				// 질병명
	private String diseaseDefine;			// 정의
	private String diseaseCause;			// 원인
	private String diseaseSymptom;			// 증상
	private String diseaseDiagnosis;		// 진단
	private String diseaseCure;				// 치료
	private String complications;			// 경과 / 합병증
	private String prevention;				// 예방
	public int getDiseaseCode() {
		return diseaseCode;
	}
	public void setDiseaseCode(int diseaseCode) {
		this.diseaseCode = diseaseCode;
	}
	public String getDiseaseName() {
		return diseaseName;
	}
	public void setDiseaseName(String diseaseName) {
		this.diseaseName = diseaseName;
	}
	public String getDiseaseDefine() {
		return diseaseDefine;
	}
	public void setDiseaseDefine(String diseaseDefine) {
		this.diseaseDefine = diseaseDefine;
	}
	public String getDiseaseCause() {
		return diseaseCause;
	}
	public void setDiseaseCause(String diseaseCause) {
		this.diseaseCause = diseaseCause;
	}
	public String getDiseaseSymptom() {
		return diseaseSymptom;
	}
	public void setDiseaseSymptom(String diseaseSymptom) {
		this.diseaseSymptom = diseaseSymptom;
	}
	public String getDiseaseDiagnosis() {
		return diseaseDiagnosis;
	}
	public void setDiseaseDiagnosis(String diseaseDiagnosis) {
		this.diseaseDiagnosis = diseaseDiagnosis;
	}
	public String getDiseaseCure() {
		return diseaseCure;
	}
	public void setDiseaseCure(String diseaseCure) {
		this.diseaseCure = diseaseCure;
	}
	public String getComplications() {
		return complications;
	}
	public void setComplications(String complications) {
		this.complications = complications;
	}
	public String getPrevention() {
		return prevention;
	}
	public void setPrevention(String prevention) {
		this.prevention = prevention;
	}
	

}
