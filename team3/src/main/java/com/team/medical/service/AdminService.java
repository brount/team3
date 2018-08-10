package com.team.medical.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.medical.vo.DoctorVO;

public interface AdminService {
	
	// 관리자 로그인
	public void adminLoginPro(HttpServletRequest req, Model model);
	
//--------------------------------------------------------------------------------------
	
	// 일반회원목록
	public void memberList(HttpServletRequest req, Model model);
	
	// 일반회원검색목록
	public void memberSearchList(HttpServletRequest req, Model model);
	
	// 일반회원제제관리
	public void membersanctionManage(HttpServletRequest req, Model model);
		
	// 일반회원제제관리 처리페이지
	public void membersanctionManagePro(HttpServletRequest req, Model model);
	
	// 일반제제회원목록
	public void membersanctionList(HttpServletRequest req, Model model);

	// 일반제제회원검색목록
	public void membersanctionSearchList(HttpServletRequest req, Model model);
	
	// 일반탈퇴회원목록
	public void membersecessionList(HttpServletRequest req, Model model);
	
	// 일반탈퇴회원검색목록
	public void membersecessionSearchList(HttpServletRequest req, Model model);
	
	// 일반탈퇴회원삭제
	public void memberdeletePro(HttpServletRequest req, Model model);
		
//--------------------------------------------------------------------------------------
	
	// 의사회원목록
	public void doctorList(HttpServletRequest req, Model model);
	
	// 의사회원검색목록
	public void doctorSearchList(HttpServletRequest req, Model model);
	
	// 의사회원 승인대기목록
	public void doctorpermissionList(HttpServletRequest req, Model model);
	/*	
	// 의사회원 승인대기 검색목록
	public void doctorpermissionSearchList(HttpServletRequest req, Model model);
	*/
	
	/*
	// 의사회원 제제목록페이지 
	public void doctorsanctionList(HttpServletRequest req, Model model);
	
	// 의사회원 제제목록 검색페이지
	public void doctorsanctionSearcList(HttpServletRequest req, Model model);
	*/
	
	// 의사탈퇴회원 목록 검색페이지
	public void doctorsecessionList(HttpServletRequest req, Model model);

	// 의사탈퇴회원 목록 검색페이지
	public void doctorsecessionSearcList(HttpServletRequest req, Model model);

	// 의사 회원삭제
	public void doctordeletePro(HttpServletRequest req, Model model);
	
	// 의사 회원 승인
	public void doctorPermissionPro(HttpServletRequest req, Model model);
	
	// 의사 회원 제명
	public void doctorExpelPro(HttpServletRequest req, Model model);
	
	// 의사 회원 상세페이지
	public void doctorManage(HttpServletRequest req, Model model);
//--------------------------------------------------------------------------------------	
	
	// 병원목록
	public void hospitalList(HttpServletRequest req,Model model);
	
//--------------------------------------------------------------------------------------	

	// 약목록
	public void drugList(HttpServletRequest req, Model model);
	
	// 약목록삭제처리
	public void drugdeletePro(HttpServletRequest req, Model model);
	
	// 약검색목록
	public void drugSearchList(HttpServletRequest req, Model model);
	
	// 약 추가 처리
	public void drugAddPro(MultipartHttpServletRequest req, Model model);
	
	// 약 수정 폼
	public void drugModify(HttpServletRequest req, Model model); 
	
	// 약 수정 처리
	public void drugModifyPro(HttpServletRequest req, Model model);

//--------------------------------------------------------------------------------------	

	// 질병목록
	public void diseaseList(HttpServletRequest req, Model model);
	
	// 질병목록삭제처리
	public void diseasedeletePro(HttpServletRequest req, Model model);
	
	// 질병검색목록
	public void diseaseSearchList(HttpServletRequest req, Model model);
	
	// 질병 추가 처리
	public void diseaseAddPro(HttpServletRequest req, Model model);
	
	// 질병 수정 폼
	public void diseaseModify(HttpServletRequest req, Model model); 
	
	// 질병 수정 처리
	public void diseaseModifyPro(HttpServletRequest req, Model model);
	
//--------------------------------------------------------------------------------------
	
	// 운동목록
	public void exerciseList(HttpServletRequest req, Model model);
	
	// 운동목록삭제처리
	public void exerciseDeletePro(HttpServletRequest req, Model model);
	
	// 운동검색목록
	public void exerciseSearchList(HttpServletRequest req, Model model);
	
	// 운동 추가 처리
	public void exerciseAddPro(MultipartHttpServletRequest req, Model model);
	
	// 운동 수정 폼
	public void exerciseModify(HttpServletRequest req, Model model); 
	
	// 운동 수정 처리
	public void exerciseModifyPro(MultipartHttpServletRequest req, Model model);
	
//------------------------------------------------------------------------------------- 희성

	// 이벤트 추가
	public void eventAdd(MultipartHttpServletRequest req, Model model);
	// 이벤트 수정
	public void eventUp(MultipartHttpServletRequest req, Model model);
	// 이벤트 삭제
	public void eventDel(HttpServletRequest req, Model model);
	
	// 포인트 목록
	public void pointList(HttpServletRequest req, Model model);
	
//--------------------------------------------------------------------------------------
	
	// 공지사항 수정
	public void adminReportModifyView(HttpServletRequest req, Model model);
	// 공지사항 수정처리
	public void adminReportModifyPro(HttpServletRequest req, Model model);
	// 신고게시판 글 삭제
	public void adminReportDeletePro(HttpServletRequest req, Model model);
	// 신고게시판 글 다중삭제
	public void adminReportDeleteProChek(HttpServletRequest req, Model model);

}
