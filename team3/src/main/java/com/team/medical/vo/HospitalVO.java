package com.team.medical.vo;

public class HospitalVO {
   private int hospitalno;					// 병원번호
   private String doctorno;					// 의사번호
   private String hospitalname;				// 병원명
   private String hospitaladdr;				// 병원주소
   private String hospitalphone;			// 병원연락처
   private String hospitalinstruction;		// 병원소개글
   private String mon;						// 진료시간 - 월
   private String tues;						// 진료시간 - 화
   private String wed;						// 진료시간 - 수
   private String thurs;					// 진료시간 - 목
   private String fri;						// 진료시간 - 금
   private String sat;						// 진료시간 - 토
   private String sun;						// 진료시간 - 일
   private String holi;						// 휴무일
   private String hospitalimage;			// 병원 사진
   private String hospitalkind;				// 병원 종류
   private int hospitalstate;				// 제휴 상태	비제휴 : 0, 제휴 : 1
   
   public int getHospitalno() {
      return hospitalno;
   }
   public void setHospitalno(int hospitalno) {
      this.hospitalno = hospitalno;
   }
   public String getDoctorno() {
      return doctorno;
   }
   public void setDoctorno(String doctorno) {
      this.doctorno = doctorno;
   }
   public String getHospitalname() {
      return hospitalname;
   }
   public void setHospitalname(String hospitalname) {
      this.hospitalname = hospitalname;
   }
   public String getHospitaladdr() {
      return hospitaladdr;
   }
   public void setHospitaladdr(String hospitaladdr) {
      this.hospitaladdr = hospitaladdr;
   }
   public String getHospitalphone() {
      return hospitalphone;
   }
   public void setHospitalphone(String hospitalphone) {
      this.hospitalphone = hospitalphone;
   }
   public String getHospitalinstruction() {
      return hospitalinstruction;
   }
   public void setHospitalinstruction(String hospitalinstruction) {
      this.hospitalinstruction = hospitalinstruction;
   }
   public String getMon() {
      return mon;
   }
   public void setMon(String mon) {
      this.mon = mon;
   }
   public String getTues() {
      return tues;
   }
   public void setTues(String tues) {
      this.tues = tues;
   }
   public String getWed() {
      return wed;
   }
   public void setWed(String wed) {
      this.wed = wed;
   }
   public String getThurs() {
      return thurs;
   }
   public void setThurs(String thurs) {
      this.thurs = thurs;
   }
   public String getFri() {
      return fri;
   }
   public void setFri(String fri) {
      this.fri = fri;
   }
   public String getSat() {
      return sat;
   }
   public void setSat(String sat) {
      this.sat = sat;
   }
   public String getSun() {
      return sun;
   }
   public void setSun(String sun) {
      this.sun = sun;
   }
   public String getHoli() {
      return holi;
   }
   public void setHoli(String holi) {
      this.holi = holi;
   }
   public String getHospitalimage() {
      return hospitalimage;
   }
   public void setHospitalimage(String hospitalimage) {
      this.hospitalimage = hospitalimage;
   }
   public String getHospitalkind() {
      return hospitalkind;
   }
   public void setHospitalkind(String hospitalkind) {
      this.hospitalkind = hospitalkind;
   }
   public int getHospitalstate() {
      return hospitalstate;
   }
   public void setHospitalstate(int hospitalstate) {
      this.hospitalstate = hospitalstate;
   }
   
   
}