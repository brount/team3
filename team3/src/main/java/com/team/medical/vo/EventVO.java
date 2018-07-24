package com.team.medical.vo;

import java.sql.Date;

public class EventVO {
	private int advertisementNo;
	private int doctorno;
	private String advertisementTitle;
	private String advertisementThumbnail;
	private String advertisementImage;
	private String advertisementContents;
	private Date advertisementRegDate;
	private int advertisementPeriod;
	private int advertisementKind;
	private Date advertisementStart;
	private Date advertisementEnd;
	private int advertisementState;
	
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
