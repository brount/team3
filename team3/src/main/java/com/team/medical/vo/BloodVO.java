package com.team.medical.vo;

import java.sql.Date;

public class BloodVO {
	private String guestid;		// 일반회원아이디
    private String carevalmax;	// 최고혈압
    private String carevalmin;	// 최저혈압
    private String reg_date;	// 날짜

    public BloodVO() {
    }

    public BloodVO(String guestid, String carevalmax, String carevalmin, String reg_date) {
        this.guestid = guestid;
        this.carevalmax = carevalmax;
        this.carevalmin = carevalmin;
        this.reg_date = reg_date;
    }

    public String getGuestid() {
        return guestid;
    }

    public void setGuestid(String guestid) {
        this.guestid = guestid;
    }

    public String getCarevalmax() {
        return carevalmax;
    }

    public void setCarevalmax(String carevalmax) {
        this.carevalmax = carevalmax;
    }

    public String getCarevalmin() {
        return carevalmin;
    }

    public void setCarevalmin(String carevalmin) {
        this.carevalmin = carevalmin;
    }

    public String getReg_date() {
        return reg_date;
    }

    public void setReg_date(String reg_date) {
        this.reg_date = reg_date;
    }
}
