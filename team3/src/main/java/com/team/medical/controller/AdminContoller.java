package com.team.medical.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.medical.service.AdminService;

@Controller
public class AdminContoller {
	
	@Autowired
	AdminService adService;
	
	//일반회원목록페이지
	@RequestMapping(value = "memberList")
	public String memberList(HttpServletRequest req, Model model) {
		System.out.println("memberList, 페이지");
		adService.memberList(req, model);
		return "admin/memberList";
	}
	//일반회원검색목록페이지
	@RequestMapping(value = "memberSearchList")
	public String memberSearchList(HttpServletRequest req, Model model) {
		System.out.println("memberSearchList, 페이지");
		adService.memberSearchList(req, model);
		return "admin/memberList";
	}
	//일반제제회원목록페이지   
	@RequestMapping(value = "membersanctionList")
	public String membersanctionList(HttpServletRequest req, Model model) {
		System.out.println("membersanctionList, 페이지");
		adService.membersanctionList(req, model);
		return "admin/membersanctionList";
	}
	//일반제제회원검색목록페이지
	@RequestMapping(value = "membersanctionSearchList")
	public String membersanctionSearchList(HttpServletRequest req, Model model) {
		System.out.println("membersanctionSearchList, 페이지");
		adService.membersanctionSearchList(req, model);
		return "admin/membersanctionList";
	}
	//일반탈퇴회원목록페이지  
	@RequestMapping(value = "membersecessionList")
	public String membersecessionList(HttpServletRequest req, Model model) {
		System.out.println("membersecessionList, 페이지");
		adService.membersecessionList(req, model);
		return "admin/membersecessionList";
	}
	//일반탈퇴회원검색목록페이지
	@RequestMapping(value = "membersecessionSearchList")
	public String membersecessionSearchList(HttpServletRequest req, Model model) {
		System.out.println("membersecessionSearchList, 페이지");
		adService.membersecessionSearchList(req, model);
		return "admin/membersecessionList";
	}
	// 일반탈퇴회원삭제 처리 페이지
	@RequestMapping(value = "memberdeletePro")
	public String memberdeletePro(HttpServletRequest req, Model model) {
		System.out.println("memberdeletePro");

		adService.memberdeletePro(req, model);
		
		return "admin/memberdeletePro";
	}
	//일반회원제제관리페이지
	@RequestMapping(value = "membersanctionManage")
	public String membersanctionManage(HttpServletRequest req, Model model) {
		System.out.println("membersanctionManage, 페이지");
		return "admin/membersanctionManage";
	}
	//의사회원목록페이지
	@RequestMapping(value = "doctorList")
	public String doctorList(HttpServletRequest req, Model model) {
		System.out.println("doctorList, 페이지");
		return "admin/doctorList";
	}
	//의사회원탈퇴목록페이지
	@RequestMapping(value = "doctorsecessionList")
	public String doctorsecessionList(HttpServletRequest req, Model model) {
		System.out.println("doctorsecessionList, 페이지");
		return "admin/doctorsecessionList";
	}
	//의사회원제제목록페이지 
	@RequestMapping(value = "doctorsanctionList")
	public String doctorsanctionList(HttpServletRequest req, Model model) {
		System.out.println("doctorsanctionList, 페이지");
		return "admin/doctorsanctionList";
	}
	//의사회원제제관리페이지
	@RequestMapping(value = "doctorsanctionManage")
	public String doctorsanctionManage(HttpServletRequest req, Model model) {
		System.out.println("doctorsanctionManage, 페이지");
		return "admin/doctorsanctionManage";
	}
	//제휴병원목록페이지     
	@RequestMapping(value = "hospitalList")
	public String hospitalList(HttpServletRequest req, Model model) {
		System.out.println("hospitalList, 페이지");
		return "admin/hospitalList";
	}
	//제휴병원추가폼페이지      
	@RequestMapping(value = "hospitalAddForm")
	public String hospitalAddForm(HttpServletRequest req, Model model) {
		System.out.println("hospitalAddForm, 페이지");
		return "admin/hospitalAddForm";
	}
	//제휴병원수정폼페이지
	@RequestMapping(value = "hospitalModifyForm")
	public String hospitalModifyForm(HttpServletRequest req, Model model) {
		System.out.println("hospitalModifyForm, 페이지");
		return "admin/hospitalModifyForm";
	}
	//약정보목록페이지       
	@RequestMapping(value = "drugList")
	public String drugList(HttpServletRequest req, Model model) {
		System.out.println("drugList, 페이지");
		return "admin/drugList";
	}
	//질병정보목록페이지        
	@RequestMapping(value = "diseaseList")
	public String diseaseList(HttpServletRequest req, Model model) {
		System.out.println("diseaseList, 페이지");
		return "admin/diseaseList";
	}
	//운동정보목록페이지         
	@RequestMapping(value = "exerciseList")
	public String exerciseList(HttpServletRequest req, Model model) {
		System.out.println("exerciseList, 페이지");
		return "admin/exerciseList";
	}
	//음식정보목록페이지         
	@RequestMapping(value = "foodList")
	public String foodList(HttpServletRequest req, Model model) {
		System.out.println("foodList, 페이지");
		return "admin/foodList";
	}
	//예방정보목록페이지         
	@RequestMapping(value = "apreventionList")
	public String apreventionList(HttpServletRequest req, Model model) {
		System.out.println("apreventionList, 페이지");
		return "admin/apreventionList";
	}
	//약정보입력폼          
	@RequestMapping(value = "drugAdd")
	public String drugAdd(HttpServletRequest req, Model model) {
		System.out.println("drugAdd, 페이지");
		return "admin/drugAdd";
	}
	//약정보수정폼          
	@RequestMapping(value = "drugModify")
	public String drugModify(HttpServletRequest req, Model model) {
		System.out.println("drugModify, 페이지");
		return "admin/drugModify";
	}
	//질병정보입력폼           
	@RequestMapping(value = "diseaseAdd")
	public String diseaseAdd(HttpServletRequest req, Model model) {
		System.out.println("diseaseAdd, 페이지");
		return "admin/diseaseAdd";
	}
	//질병정보수정폼           
	@RequestMapping(value = "diseaseModify")
	public String diseaseModify(HttpServletRequest req, Model model) {
		System.out.println("diseaseModify, 페이지");
		return "admin/diseaseModify";
	}
	//운동정보입력폼           
	@RequestMapping(value = "exerciseAdd")
	public String exerciseAdd(HttpServletRequest req, Model model) {
		System.out.println("exerciseAdd, 페이지");
		return "admin/exerciseAdd";
	}
	//운동정보수정폼           
	@RequestMapping(value = "exerciseModify")
	public String exerciseModify(HttpServletRequest req, Model model) {
		System.out.println("exerciseModify, 페이지");
		return "admin/exerciseModify";
	}
	//음식정보입력폼           
	@RequestMapping(value = "foodAdd")
	public String foodAdd(HttpServletRequest req, Model model) {
		System.out.println("foodAdd, 페이지");
		return "admin/foodAdd";
	}
	//음식정보수정폼           
	@RequestMapping(value = "foodModify")
	public String foodModify(HttpServletRequest req, Model model) {
		System.out.println("foodModify, 페이지");
		return "admin/foodModify";
	}
	//예방정보입력폼           
	@RequestMapping(value = "apreventionAdd")
	public String apreventionAdd(HttpServletRequest req, Model model) {
		System.out.println("apreventionAdd, 페이지");
		return "admin/apreventionAdd";
	}
	//예방정보입력폼           
	@RequestMapping(value = "apreventionModify")
	public String apreventionModify(HttpServletRequest req, Model model) {
		System.out.println("apreventionModify, 페이지");
		return "admin/apreventionModify";
	}
	//요구사항목록페이지            
	@RequestMapping(value = "requestList")
	public String requestList(HttpServletRequest req, Model model) {
		System.out.println("requestList, 페이지");
		return "admin/requestList";
	}
	//광고신청목록페이지             
	@RequestMapping(value = "eventRequestList")
	public String eventList(HttpServletRequest req, Model model) {
		System.out.println("eventRequestList, 페이지");
		return "admin/eventRequestList";
	}
	//광고등록폼페이지             
	@RequestMapping(value = "adminEventAdd")
	public String eventAdd(HttpServletRequest req, Model model) {
		System.out.println("eventAdd, 페이지");
		return "admin/eventAdd";
	}
	//포인트결제내역목록페이지             
	@RequestMapping(value = "pointList")
	public String pointList(HttpServletRequest req, Model model) {
		System.out.println("pointList, 페이지");
		return "admin/pointList";
	}
	//현금결제내역목록페이지             
	@RequestMapping(value = "cashList")
	public String cashList(HttpServletRequest req, Model model) {
		System.out.println("cashList, 페이지");
		return "admin/cashList";
	}
	//관리자 로그인 페이지
	@RequestMapping(value = "adminLogin")
	public String adminLogin(HttpServletRequest req, Model model) {
		System.out.println("adminLogin, 페이지");
		
		return "admin/adminLogin";
	}
	//관리자 로그인 처리페이지
	@RequestMapping(value = "adminLoginPro")
	public String adminLoginPro(HttpServletRequest req, Model model) {
		System.out.println("adminLoginPro, 페이지");
		
		adService.adminLoginPro(req, model);
		return "admin/adminLoginPro";
	}
}	
