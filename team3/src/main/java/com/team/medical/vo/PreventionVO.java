package com.team.medical.vo;

public class PreventionVO {
	private int preventionCode;				// 예방접종 등록번호
	private String preventionKind;			// 예방접종 종류
	private int countryCode;				// 국가코드
	private int diseaseRcode;				// 질병 번호
	private String preventionContent;		// 접종목적
	
	public int getPreventionCode() {
		return preventionCode;
	}
	public void setPreventionCode(int preventionCode) {
		this.preventionCode = preventionCode;
	}
	public String getPreventionKind() {
		return preventionKind;
	}
	public void setPreventionKind(String preventionKind) {
		this.preventionKind = preventionKind;
	}
	public int getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(int countryCode) {
		this.countryCode = countryCode;
	}
	public int getDiseaseRcode() {
		return diseaseRcode;
	}
	public void setDiseaseRcode(int diseaseRcode) {
		this.diseaseRcode = diseaseRcode;
	}
	public String getPreventionContent() {
		return preventionContent;
	}
	public void setPreventionContent(String preventionContent) {
		this.preventionContent = preventionContent;
	}

	
}
