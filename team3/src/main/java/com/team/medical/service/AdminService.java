package com.team.medical.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface AdminService {
	
	// 관리자 로그인
	public void adminLoginPro(HttpServletRequest req, Model model);
	
//--------------------------------------------------------------------------------------
	
	// 일반회원목록
	public void memberList(HttpServletRequest req, Model model);
	
	// 일반회원목록검색
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
	
//--------------------------------------------------------------------------------------	

	// 약목록
	public void drugList(HttpServletRequest req, Model model);

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
	public void exercisedeletePro(HttpServletRequest req, Model model);
	
	// 운동검색목록
	public void exerciseSearchList(HttpServletRequest req, Model model);
	
	// 운동 추가 처리
	public void exerciseAddPro(HttpServletRequest req, Model model);
	
	// 운동 수정 폼
	public void exerciseModify(HttpServletRequest req, Model model); 
	
	// 운동 수정 처리
	public void exerciseModifyPro(HttpServletRequest req, Model model);
	
//--------------------------------------------------------------------------------------
	
	// 예방접종 목록
	public void apreventionList(HttpServletRequest req, Model model);
	
}
