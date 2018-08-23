package com.team.medical.vo;

import java.sql.Date;

public class EventVO {
	private int advertisementNo;			// 광고번호
	private int doctorno;					// 의사회원번호
	private String advertisementTitle;		// 광고제목
	private String advertisementThumbnail;	// 광고섬네일
	private String advertisementImage;		// 광고이미지
	private String advertisementContents;	// 광고내용
	private Date advertisementRegDate;		// 등록일
	private int advertisementPeriod;		// 사용기간
	private int advertisementKind;			// 광고종류
	private Date advertisementStart;		// 광고시작시간
	private Date advertisementEnd;			// 광고종료시간
	private int advertisementState;			// 광고게시상태
	
	public int getAdvertisementNo() {
		return advertisementNo;
	}
	public void setAdvertisementNo(int advertisementNo) {
		this.advertisementNo = advertisementNo;
	}
	public int getDoctorno() {
		return doctorno;
	}
	public void setDoctorno(int doctorno) {
		this.doctorno = doctorno;
	}
	public String getAdvertisementTitle() {
		return advertisementTitle;
	}
	public void setAdvertisementTitle(String advertisementTitle) {
		this.advertisementTitle = advertisementTitle;
	}
	public String getAdvertisementThumbnail() {
		return advertisementThumbnail;
	}
	public void setAdvertisementThumbnail(String advertisementThumbnail) {
		this.advertisementThumbnail = advertisementThumbnail;
	}
	public String getAdvertisementImage() {
		return advertisementImage;
	}
	public void setAdvertisementImage(String advertisementImage) {
		this.advertisementImage = advertisementImage;
	}
	public String getAdvertisementContents() {
		return advertisementContents;
	}
	public void setAdvertisementContents(String advertisementContents) {
		this.advertisementContents = advertisementContents;
	}
	public Date getAdvertisementRegDate() {
		return advertisementRegDate;
	}
	public void setAdvertisementRegDate(Date advertisementRegDate) {
		this.advertisementRegDate = advertisementRegDate;
	}
	public int getAdvertisementPeriod() {
		return advertisementPeriod;
	}
	public void setAdvertisementPeriod(int advertisementPeriod) {
		this.advertisementPeriod = advertisementPeriod;
	}
	public int getAdvertisementKind() {
		return advertisementKind;
	}
	public void setAdvertisementKind(int advertisementKind) {
		this.advertisementKind = advertisementKind;
	}
	public Date getAdvertisementStart() {
		return advertisementStart;
	}
	public void setAdvertisementStart(Date advertisementStart) {
		this.advertisementStart = advertisementStart;
	}
	public Date getAdvertisementEnd() {
		return advertisementEnd;
	}
	public void setAdvertisementEnd(Date advertisementEnd) {
		this.advertisementEnd = advertisementEnd;
	}
	public int getAdvertisementState() {
		return advertisementState;
	}
	public void setAdvertisementState(int advertisementState) {
		this.advertisementState = advertisementState;
	}	
	
	
}
