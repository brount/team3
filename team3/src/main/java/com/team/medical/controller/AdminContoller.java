package com.team.medical.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.medical.service.AdminService;
import com.team.medical.service.CommonService;

@Controller
public class AdminContoller {
	
	@Autowired
	AdminService adService;
	@Autowired
	CommonService coService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminContoller.class);
	
	// 일반회원목록페이지
	@RequestMapping(value = "memberList")
	public String memberList(HttpServletRequest req, Model model) {
		logger.info("memberList, 페이지");
		adService.memberList(req, model);
		return "admin/memberList";
	}
	
	// 일반회원검색목록페이지
	@RequestMapping(value = "memberSearchList")
	public String memberSearchList(HttpServletRequest req, Model model) {
		logger.info("memberSearchList, 페이지");
		adService.memberSearchList(req, model);
		return "admin/memberList";
	}
	
	// 일반제제회원목록페이지   
	@RequestMapping(value = "membersanctionList")
	public String membersanctionList(HttpServletRequest req, Model model) {
		logger.info("membersanctionList, 페이지");
		adService.membersanctionList(req, model);
		return "admin/membersanctionList";
	}
	
	// 일반제제회원검색목록페이지
	@RequestMapping(value = "membersanctionSearchList")
	public String membersanctionSearchList(HttpServletRequest req, Model model) {
		logger.info("membersanctionSearchList, 페이지");
		adService.membersanctionSearchList(req, model);
		return "admin/membersanctionList";
	}
	
	// 일반탈퇴회원목록페이지  
	@RequestMapping(value = "membersecessionList")
	public String membersecessionList(HttpServletRequest req, Model model) {
		logger.info("membersecessionList, 페이지");
		adService.membersecessionList(req, model);
		return "admin/membersecessionList";
	}
	
	// 일반탈퇴회원검색목록페이지
	@RequestMapping(value = "membersecessionSearchList")
	public String membersecessionSearchList(HttpServletRequest req, Model model) {
		logger.info("membersecessionSearchList, 페이지");
		adService.membersecessionSearchList(req, model);
		return "admin/membersecessionList";
	}
	
	// 일반탈퇴회원삭제 처리 페이지
	@RequestMapping(value = "memberdeletePro")
	public String memberdeletePro(HttpServletRequest req, Model model) {
		logger.info("memberdeletePro");

		adService.memberdeletePro(req, model);
		
		return "admin/memberdeletePro";
	}
	
	// 일반회원제제관리페이지
	@RequestMapping(value = "membersanctionManage")
	public String membersanctionManage(HttpServletRequest req, Model model) {
		logger.info("membersanctionManage, 페이지");
		
		adService.membersanctionManage(req,model);
		
		return "admin/membersanctionManage";
	}
	
	// 일반회원제제관리처리페이지
	@RequestMapping(value = "membersanctionManagePro")
	public String membersanctionManagePro(HttpServletRequest req, Model model) {
		logger.info("membersanctionManagePro, 페이지");
		
		adService.membersanctionManagePro(req, model);
		
		return "admin/membersanctionManagePro";
	}

//--------------------------------------------------------------------------------------	

	//의사회원목록페이지
	@RequestMapping(value = "doctorList")
	public String doctorList(HttpServletRequest req, Model model) {
		logger.info("doctorList, 페이지");
		adService.doctorList(req, model);
		return "admin/doctorList";
	}
	
	// 의사회원목록 검색페이지
	@RequestMapping(value = "doctorSearchList")
	public String doctorSearchList(HttpServletRequest req, Model model) {
		logger.info("doctorSearchList, 페이지");
		adService.doctorSearchList(req, model);
		return "admin/doctorList";
	}
	
	//의사회원 승인대기 목록페이지
	@RequestMapping(value = "doctorpermissionList")
	public String doctorpermissionList(HttpServletRequest req, Model model) {
		logger.info("doctorpermissionList, 페이지");
		adService.doctorpermissionList(req, model);
		return "admin/doctorpermissionList";
	}
	
	/*
	// 의사회원 승인대기 검색목록페이지
	@RequestMapping(value = "doctorpermissionSearchList")
	public String doctorpermissionSearchList(HttpServletRequest req, Model model) {
		logger.info("doctorpermissionSearchList, 페이지");
		adService.doctorpermissionSearchList(req, model);
		return "admin/doctorpermissionSearchList";
	}
	
	*/
	

	// 의사회원 탈퇴목록 페이지
	@RequestMapping(value = "doctorsecessionList")
	public String doctorsecessionList(HttpServletRequest req, Model model) {
		logger.info("doctorsecessionList, 페이지");
		adService.doctorsecessionList(req, model);
		return "admin/doctorsecessionList";
	}
		
	// 의사회원 탈퇴목록 검색페이지
	@RequestMapping(value = "doctorsecessionSearcList")
	public String doctorsecessionSearcList(HttpServletRequest req, Model model) {
		logger.info("doctorsecessionSearcList, 페이지");
		adService.doctorsecessionSearcList(req, model);
		return "admin/doctorsecessionSearcList";
	}
		
	
	/*
	// 의사회원 제제목록페이지 
	@RequestMapping(value = "doctorsanctionList")
	public String doctorsanctionList(HttpServletRequest req, Model model) {
		logger.info("doctorpermissionList, 페이지");
		adService.doctorsanctionList(req, model);
		return "admin/doctorsanctionList";
	}
	
	// 의사회원 제제목록 검색페이지
	@RequestMapping(value = "doctorsanctionSearcList")
	public String doctorsanctionSearcList(HttpServletRequest req, Model model) {
		logger.info("doctorsanctionSearcList, 페이지");
		adService.doctorsanctionSearcList(req, model);
		return "admin/doctorsanctionList";
	}
	
	// 의사회원제제관리페이지
	@RequestMapping(value = "doctorsanctionManage")
	public String doctorsanctionManage(HttpServletRequest req, Model model) {
		logger.info("doctorsanctionManage, 페이지");
		return "admin/doctorsanctionManage";
	}

	*/
	
	
	// 의사회원삭제 처리 페이지
	@RequestMapping(value = "doctordeletePro")
	public String doctordeletePro(HttpServletRequest req, Model model) {
		logger.info("doctordeletePro");

		adService.doctordeletePro(req, model);
		
		return "admin/doctordeletePro";
	}
	
	// 의사 승인대기회원 승인 처리 페이지
	@RequestMapping(value = "doctorPermissionPro")
	public String doctorPermissionPro(HttpServletRequest req, Model model) {
		logger.info("doctorPermissionPro");

		adService.doctorPermissionPro(req, model);
		
		return "admin/doctorPermissionPro";
	}
	
	// 의사 제명 처리
	@RequestMapping(value = "doctorExpelPro")
	public String doctorExpelPro(HttpServletRequest req, Model model) {
		logger.info("doctorExpelPro");

		adService.doctorExpelPro(req, model);
		
		return "admin/doctorExpelPro";
	}
//--------------------------------------------------------------------------------------	
	
	// 제휴병원목록페이지     
	@RequestMapping(value = "hospitalList")
	public String hospitalList(HttpServletRequest req, Model model) {
		logger.info("hospitalList, 페이지");
		adService.hospitalList(req, model);
		return "admin/hospitalList";
	}
	
	// 일반병원목록페이지     
	@RequestMapping(value = "hospitalList_none")
	public String hospitalList_none(HttpServletRequest req, Model model) {
		logger.info("hospitalList_none, 페이지");
		adService.hospitalList(req, model);
		return "admin/hospitalList_none";
	}
	
	// 제휴병원목록페이지     
	@RequestMapping(value = "hospitaSearchlList")
	public String hospitaSearchlList(HttpServletRequest req, Model model) {
		logger.info("hospitaSearchlList, 페이지");
		adService.hospitalList(req, model);
		return "admin/hospitalList";
	}
	
	// 일반병원목록페이지     
	@RequestMapping(value = "hospitalSearchList_none")
	public String hospitalSearchList_none(HttpServletRequest req, Model model) {
		logger.info("hospitalSearchList_none, 페이지");
		adService.hospitalList(req, model);
		return "admin/hospitalList_none";
	}
	
	//제휴병원추가폼페이지      
	@RequestMapping(value = "hospitalAddForm")
	public String hospitalAddForm(HttpServletRequest req, Model model) {
		logger.info("hospitalAddForm, 페이지");
		return "admin/hospitalAddForm";
	}
	
	//제휴병원수정폼페이지
	@RequestMapping(value = "hospitalModifyForm")
	public String hospitalModifyForm(HttpServletRequest req, Model model) {
		logger.info("hospitalModifyForm, 페이지");
		return "admin/hospitalModifyForm";
	}
	
//--------------------------------------------------------------------------------------	
	
	// 약정보목록페이지        
	@RequestMapping(value = "drugList")
	public String drugList(HttpServletRequest req, Model model) {
		logger.info("drugList, 페이지");
		adService.drugList(req, model);
		return "admin/drugList";
	}
	
	// 약정보삭제 처리 페이지
	@RequestMapping(value = "drugdeletePro")
	public String drugdeletePro(HttpServletRequest req, Model model) {
		logger.info("drugdeletePro");

		adService.drugdeletePro(req, model);
		
		return "admin/drugdeletePro";
	}
	
	// 약검색목록페이지
	@RequestMapping(value = "drugSearchList")
	public String drugSearchList(HttpServletRequest req, Model model) {
		logger.info("drugSearchList, 페이지");
		adService.drugSearchList(req, model);
		return "admin/drugSearchList";
	}

	// 약정보입력폼           
	@RequestMapping(value = "drugAdd")
	public String drugAdd(HttpServletRequest req, Model model) {
		logger.info("drugAdd, 페이지");
		
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		model.addAttribute("pageNum", pageNum);
		
		return "admin/drugAdd";
	}
	
	// 약정보 추가처리
	@RequestMapping(value = "drugAddPro", method=RequestMethod.POST)
	public String drugAddPro(MultipartHttpServletRequest req, Model model) {
		logger.info("drugAddPro, 페이지");
		
		adService.drugAddPro(req, model);
		
		return "admin/drugAddPro";
	}
	
	// 약정보수정폼           
	@RequestMapping(value = "drugModify")
	public String drugModify(HttpServletRequest req, Model model) {
		logger.info("drugModify, 페이지");
		
		adService.drugModify(req, model);
		
		return "admin/drugModify";
	}
	
	// 약정보 수정처리폼           
	@RequestMapping(value = "drugModifyPro", method=RequestMethod.POST)
	public String drugModifyPro(MultipartHttpServletRequest req, Model model) {
		logger.info("drugModifyPro, 페이지");
		
		adService.drugModifyPro(req, model);
		
		return "admin/drugModifyPro";
	}
	
//--------------------------------------------------------------------------------------		
	
	// 질병정보목록페이지        
	@RequestMapping(value = "diseaseList")
	public String diseaseList(HttpServletRequest req, Model model) {
		logger.info("diseaseList, 페이지");
		adService.diseaseList(req, model);
		return "admin/diseaseList";
	}
	
	// 질병정보삭제 처리 페이지
	@RequestMapping(value = "diseasedeletePro")
	public String diseasedeletePro(HttpServletRequest req, Model model) {
		logger.info("diseasedeletePro");

		adService.diseasedeletePro(req, model);
		
		return "admin/diseasedeletePro";
	}
	
	// 질병검색목록페이지
	@RequestMapping(value = "diseaseSearchList")
	public String diseaseSearchList(HttpServletRequest req, Model model) {
		logger.info("diseaseSearchList, 페이지");
		adService.diseaseSearchList(req, model);
		return "admin/diseaseList";
	}

	// 질병정보입력폼           
	@RequestMapping(value = "diseaseAdd")
	public String diseaseAdd(HttpServletRequest req, Model model) {
		logger.info("diseaseAdd, 페이지");
		
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		model.addAttribute("pageNum", pageNum);
		
		return "admin/diseaseAdd";
	}
	
	// 질병정보 추가처리폼
	@RequestMapping(value = "diseaseAddPro")
	public String diseaseAddPro(HttpServletRequest req, Model model) {
		logger.info("diseaseAddPro, 페이지");
		
		adService.diseaseAddPro(req, model);
		
		return "admin/diseaseAddPro";
	}
	
	// 질병정보수정폼           
	@RequestMapping(value = "diseaseModify")
	public String diseaseModify(HttpServletRequest req, Model model) {
		logger.info("diseaseModify, 페이지");
		
		adService.diseaseModify(req, model);
		
		return "admin/diseaseModify";
	}
	
	// 질병정보 수정처리폼           
	@RequestMapping(value = "diseaseModifyPro")
	public String diseaseModifyPro(HttpServletRequest req, Model model) {
		logger.info("diseaseModifyPro, 페이지");
		
		adService.diseaseModifyPro(req, model);
		
		return "admin/diseaseModifyPro";
	}
	
//--------------------------------------------------------------------------------------		

	// 운동정보목록페이지  
	@RequestMapping(value = "exerciseList")
	public String exerciseList(HttpServletRequest req, Model model) {
		logger.info("exerciseList, 페이지");
		adService.exerciseList(req, model);
		return "admin/exerciseList";
	}
	
	// 운동정보삭제 처리 페이지
	@RequestMapping(value = "exerciseDeletePro")
	public String exerciseDeletePro(HttpServletRequest req, Model model) {
		logger.info("exerciseDeletePro, 페이지");

		adService.exerciseDeletePro(req, model);
		
		return "admin/exerciseDeletePro";
	}
	
	
	// 운동검색목록페이지
	@RequestMapping(value = "exerciseSearchList")
	public String exerciseSearchList(HttpServletRequest req, Model model) {
		logger.info("exerciseSearchList, 페이지");
		adService.exerciseSearchList(req, model);
		return "admin/exerciseList";
	}

	// 운동정보입력폼           
	@RequestMapping(value = "exerciseAdd")
	public String exerciseAdd(HttpServletRequest req, Model model) {
		logger.info("exerciseAdd, 페이지");
		
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		model.addAttribute("pageNum", pageNum);
		
		return "admin/exerciseAdd";
	}
	
	// 운동정보 추가처리폼
	@RequestMapping(value = "exerciseAddPro")
	public String exerciseAddPro(MultipartHttpServletRequest req, Model model) {
		logger.info("exerciseAddPro, 페이지");
		
		adService.exerciseAddPro(req, model);
		
		return "admin/exerciseAddPro";
	}
	
	// 운동정보수정폼           
	@RequestMapping(value = "exerciseModify")
	public String exerciseModify(HttpServletRequest req, Model model) {
		logger.info("exerciseModify, 페이지");
		
		adService.exerciseModify(req, model);
		
		return "admin/exerciseModify";
	}
	
	// 운동정보 수정처리폼           
	@RequestMapping(value = "exerciseModifyPro")
	public String exerciseModifyPro(MultipartHttpServletRequest req, Model model) {
		logger.info("exerciseModifyPro, 페이지");
		
		adService.exerciseModifyPro(req, model);
		
		return "admin/exerciseModifyPro";
	}
	
//-------------------------------------------------------------------------------------- 
	
	//예방정보목록페이지 
	@RequestMapping(value = "apreventionList")
	public String apreventionList(HttpServletRequest req, Model model) {
		logger.info("apreventionList, 페이지");
		adService.apreventionList(req, model);
		return "admin/apreventionList";
	}
	
	//예방정보입력폼           
	@RequestMapping(value = "apreventionAdd")
	public String apreventionAdd(HttpServletRequest req, Model model) {
		logger.info("apreventionAdd, 페이지");
		return "admin/apreventionAdd";
	}

	//예방정보입력폼           
	@RequestMapping(value = "apreventionModify")
	public String apreventionModify(HttpServletRequest req, Model model) {
		logger.info("apreventionModify, 페이지");
		return "admin/apreventionModify";
	}
	
//-------------------------------------------------------------------------------------- 
	
	//요구사항목록페이지            
	@RequestMapping(value = "requestList")
	public String requestList(HttpServletRequest req, Model model) {
		logger.info("requestList, 페이지");
		return "admin/requestList";
	}
	
	//광고신청목록페이지             
	@RequestMapping(value = "eventRequestList")
	public String eventList(HttpServletRequest req, Model model) {
		logger.info("eventRequestList, 페이지");
		coService.eventList(req, model);
		return "admin/eventRequestList";
	}
	
	//광고등록폼페이지             
	@RequestMapping(value = "adminEventAdd")
	public String eventAdd(HttpServletRequest req, Model model) {
		logger.info("eventAdd, 페이지");
		return "admin/eventAdd";
	}
	
//---------------------------------------------------------------------------------------- 희성
	//광고등록처리페이지             
	@RequestMapping(value = "adminEventAddPro")
	public String eventAddPro(MultipartHttpServletRequest req, Model model) {
		logger.info("eventAddPro, 페이지");
		adService.eventAdd(req,model);
		return "admin/eventAddPro";
	}
	//광고목록수정페이지             
	@RequestMapping(value = "eventModify")
	public String eventModify(HttpServletRequest req, Model model) {
		logger.info("eventModify, 페이지");
		coService.eventInfo(req, model);
		return "admin/eventModify";
	}
	//광고목록수정처리페이지             
	@RequestMapping(value = "eventModifyPro")
	public String eventModifyPro(MultipartHttpServletRequest req, Model model) {
		logger.info("eventModifyPro, 페이지");
		adService.eventUp(req,model);
		coService.eventList(req, model);
		return "admin/eventRequestList";
	}
	//광고등록처리페이지             
	@RequestMapping(value = "eventDel")
	public String eventDel(HttpServletRequest req, Model model) {
		logger.info("eventDel, 페이지");
		adService.eventDel(req,model);
		coService.eventList(req, model);
		return "admin/eventRequestList";
	}
	
//---------------------------------------------------------------------------------------- 희성

	
	//포인트결제내역목록페이지             
	@RequestMapping(value = "pointList")
	public String pointList(HttpServletRequest req, Model model) {
		logger.info("pointList, 페이지");
		adService.pointList(req, model);
		return "admin/pointList";
	}
	
	//관리자 로그인 페이지
	@RequestMapping(value = "adminLogin")
	public String adminLogin(HttpServletRequest req, Model model) {
		logger.info("adminLogin, 페이지");
		
		return "admin/adminLogin";
	}
	
	//관리자 로그인 처리페이지
	@RequestMapping(value = "adminLoginPro")
	public String adminLoginPro(HttpServletRequest req, Model model) {
		logger.info("adminLoginPro, 페이지");
		
		adService.adminLoginPro(req, model);
		return "admin/adminLoginPro";
	}
	
//---------------------------------------------------------------------------------------- 나다
	
	// 신고요청 목록          
	@RequestMapping(value = "adminReportList")
	public String adminReportBoardList(HttpServletRequest req, Model model) {
		logger.info("adminReportList, 페이지");
		
		coService.reportBoardList(req, model);
		
		return "admin/adminReportList";
	}
	
	// 신고요청 상세페이지 
	@RequestMapping(value = "adminReportInfo")
	public String adminReportInfo(HttpServletRequest req, Model model) {
		logger.info("adminReport, 페이지");
		
		coService.reportBoardInfo(req, model);
		
		return "admin/adminReportInfo";
	}
	
	// 신고요청 공지사항 추가     
	@RequestMapping(value = "adminReportAdd")
	public String adminReportAdd(HttpServletRequest req, Model model) {
		logger.info("adminReportAdd, 페이지");
		
		int kind = Integer.parseInt(req.getParameter("kind"));
		
		int num = 0;
		int ref = 1; // 그룹화 아이디
		int pageNum = 1; //페이지
		// 답변글
		// contentForm.jsp에서 get방식으로 넘긴 값 num, ref, ref_step, ref_level를 받는다.
		if(req.getParameter("num") != null) {
			num = Integer.parseInt(req.getParameter("num"));
			ref = Integer.parseInt(req.getParameter("ref"));
			pageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		model.addAttribute("num", num);
		model.addAttribute("ref", ref);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("kind", kind);
		
		return "admin/adminReportAdd";
	}
	
	// 신고요청 공지사항 추가처리
	@RequestMapping(value = "adminReportAddPro")
	public String adminReportAddPro(HttpServletRequest req, Model model) {
		logger.info("adminReportAddPro, 페이지");
		
		coService.boardAddPro(req,model);
		
		coService.reportBoardList(req, model);
		
		return "admin/adminReportList";
	}
	
	// 고객센터 수정상세페이지
	@RequestMapping(value="adminReportModifyView")
	public String adminReportModifyView(HttpServletRequest req, Model model) {
		logger.info("adminReportModifyView, 페이지");
		
		adService.adminReportModifyView(req, model);
		
		return "admin/adminReportModifyView";
	}
	
	// 고객센터 수정처리페이지
	@RequestMapping(value = "adminReportModifyPro")
	public String adminReportModifyPro(HttpServletRequest req, Model model) {
		logger.info("adminReportModifyPro, 페이지");
		
		adService.adminReportModifyPro(req, model);
		
		return "admin/adminReportModifyPro";
	}
	
	// 고객센터 삭제처리페이지
	@RequestMapping(value = "adminReportDeletePro")
	public String adminReportDeletePro(HttpServletRequest req, Model model) {
		logger.info("adminReportDeletePro, 페이지");
		
		adService.adminReportDeletePro(req, model);
		
		return "admin/adminReportDeletePro";
	}
	
	// 고객센터 삭제처리페이지
	@RequestMapping(value = "adminReportDeleteProChek")
	public String adminReportDeleteProChek(HttpServletRequest req, Model model) {
		logger.info("adminReportDeleteProChek, 페이지");
		
		adService.adminReportDeleteProChek(req, model);
		
		coService.reportBoardList(req, model);
		
		return "admin/adminReportList";
	}
	
//---------------------------------------------------------------------------------------- 나다
}	
