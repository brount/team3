package com.team.medical.vo;

import java.util.Date;

public class PointVO {
   
   private int pointNo;			// 포인트 넘버
   private int doctorno;		// 의사회원번호
   private int point;			// 포인트내역
   private int status;			// 포인트상태 	1 : 획득포인트,		2 : 사용포인트
   private Date cum_date;		// 획득/사용 시간
   
   public int getPointNo() {
      return pointNo;
   }
   public void setPointNo(int pointNo) {
      this.pointNo = pointNo;
   }
   public int getDoctorno() {
      return doctorno;
   }
   public void setDoctorno(int doctorno) {
      this.doctorno = doctorno;
   }
   public int getPoint() {
      return point;
   }
   public void setPoint(int point) {
      this.point = point;
   }
   public int getStatus() {
      return status;
   }
   public void setStatus(int status) {
      this.status = status;
   }
   public Date getCum_date() {
      return cum_date;
   }
   public void setCum_date(Date cum_date) {
      this.cum_date = cum_date;
   }
   
   
}