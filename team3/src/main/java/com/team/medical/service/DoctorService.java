package com.team.medical.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface DoctorService {
	
	public void doctorLogin(HttpServletRequest req, Model model);
	
	// 아이디 중복 확인
	public void confirmId(HttpServletRequest req, Model model);
	
	//회원가입 처리
	public String inputPro(MultipartHttpServletRequest req, Model model);

	//의사회원정보 수정
	public String modifyPro(MultipartHttpServletRequest req, Model model);

	//의사회원 탈퇴
	public void deletePro(HttpServletRequest req, Model model);

	// 내 병원 정보 입력
	public String myHospitalInputPro(MultipartHttpServletRequest req, Model model);

	// 내 병원 정보
	public void myHospitalInfo(HttpServletRequest req, Model model);

	// 의사 정보 가져오기
	public void docInfo(HttpServletRequest req, Model model);

	//검사의뢰 등록
	public void checkupRequestInputPro(HttpServletRequest req, Model model);

	//일반회원 정보 가져오기
	//public void cusInfo(HttpServletRequest req, Model model);*/
}
