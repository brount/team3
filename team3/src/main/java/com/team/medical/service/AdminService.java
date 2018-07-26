package com.team.medical.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface AdminService {
	
	// 관리자 로그인
	public void adminLoginPro(HttpServletRequest req, Model model);
	
	// 일반회원목록
	public void memberList(HttpServletRequest req, Model model);
	
	// 일반회원목록검색
	public void memberSearchList(HttpServletRequest req, Model model);
	
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
	
	// 의사회원목록
	public void doctorList(HttpServletRequest req, Model model);
	
	
	// 약목록
	public void drugList(HttpServletRequest req, Model model);
}
