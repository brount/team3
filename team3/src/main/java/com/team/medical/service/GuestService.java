package com.team.medical.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface GuestService {
	// 일반회원 로그인
	public void guestLogin(HttpServletRequest req, Model model);
	// 일반회원 회원탈퇴
	public void guestExitPro(HttpServletRequest req, Model model);
	
	
	// 아이디 중복확인
	public void confirmId(HttpServletRequest req, Model model);
	// 이메일 인증키 발송
	public void emailkey(HttpServletRequest req, Model model);
	// 이메일 인증 처리
	public void emailok(HttpServletRequest req, Model model);
	// 회원가입 처리
	public void guestShipPro(HttpServletRequest req, Model model);
	
	// 회원정보 수정
	public void guestModify(HttpServletRequest req, Model model);
	
	// 회원정보수정 처리
	public void guestModifyPro(HttpServletRequest req, Model model);
	
	// 회원탈퇴처리
	public void exitOkPro(HttpServletRequest req, Model model);
	
	
	
	// 내 질문목록 
	public void myBordList(HttpServletRequest req, Model model);
	//병원 즐겨찾기
	public void bookMarkIn(HttpServletRequest req, Model model);
	// 즐겨찾는 병원
	public void bookMark(HttpServletRequest req, Model model);
	// 마이헬스 정보등록페이지
	public void personalAddPro(HttpServletRequest req, Model model);
	// 마이헬스 정버수수정처리페이지
	public void personalMofPro(HttpServletRequest req, Model model);
	// 마이헬스 등록한 정보 셀렉트 
	public void myHealth(HttpServletRequest req, Model model);
	
	
	// 검진서 등록 처리
	public void checkupRegisterPro(HttpServletRequest req, Model model);
	
	// 등록된 검진서 리스트
	public void checkupRegisterList(HttpServletRequest req, Model model);
	
	// 등록된 검진서 리스트 상세
	public void checkupRegisterclick(HttpServletRequest req, Model model);
	
	// 해당 회원의 검진서 분석결과 조회
	public void checkAnalyze(HttpServletRequest req, Model model);
	
	// 병원예약 클릭시 해당 병원정보 조회후 예약신청페이지에 정보넘김
	public void reservehospital(HttpServletRequest req, Model model);
	
	// 병원예약 처리
	public void reservePro(HttpServletRequest req, Model model);
	
	// 나의 예약목록 셀렉트
	public void reserveList(HttpServletRequest req, Model model);
	
	// 간단진료 인설트
	public void simpleTreatPro(HttpServletRequest req, Model model);
	 
	// 음식검색 후 칼로리 조회
	public void foodsearch(HttpServletRequest req, Model model);
	
	// 하루 칼로리 인서트
	public void todaycal(HttpServletRequest req, Model model);
	
	// 하루 칼로리 업데이트
	public void calorAddModi(HttpServletRequest req, Model model);
	
	// 하루에 한번만 칼로리 등록할 수 있도록 회원의 현재날짜의 칼로리 등록여부 조회
	public void caloryAdd(HttpServletRequest req, Model model);
	
	// 사용자가 새로운음식과 해당하는음식의 칼로리 등록
	public void newfood(HttpServletRequest req, Model model);
	
	// 사용자가 추가한 음식목록
	public void myFoodList(HttpServletRequest req, Model model);
	
	// 사용자가 추가한 음식 수정 윈도우창에 뿌릴 정보
	public void foodmodi(HttpServletRequest req, Model model);
	// 사용자가 추가한 음식 수정
	public void myFoodModi(HttpServletRequest req, Model model);

	// 사용자가 추가한 음식 삭제
	public void myFoodDelete(HttpServletRequest req, Model model);
	
	//건강검진 목록페이지       
	public void guestcheckupResultList(HttpServletRequest req, Model model);
	
	//처방목록페이지        
	public void guestexaminationList(HttpServletRequest req, Model model);
	
	
	
	
}
