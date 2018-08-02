package com.team.medical.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.medical.service.GuestService;

@Controller
public class GuestContoller {
	
	@Autowired
	GuestService guService;
	
	private static final Logger logger = LoggerFactory.getLogger(GuestContoller.class);
	
	//약관동의페이지
	@RequestMapping(value = "guestClauseAgree")
	public String clauseAgree(HttpServletRequest req, Model model) {
		logger.info("clauseAgree, 페이지");
		return "guest/guestClauseAgree";
	}
	//♬ 일반회원가입정보입력페이지                          
	@RequestMapping(value = "guestShipForm")
	public String guestShipForm(HttpServletRequest req, Model model) {
		logger.info("guestShipForm, 페이지");
		return "guest/guestShipForm";
	}	
	//♬ 일반회원가입아이디중복확인페이지
	@RequestMapping(value = "confirmId")
	public String confirm(HttpServletRequest req, Model model) {
		logger.info("confirmId, 페이지");
		
		guService.confirmId(req, model);

		return "guest/confirmId";
	}	
	
	//♬ 일반회원 이메일 인증버튼클릭시 페이지
	@RequestMapping(value = "findId")
	public String emailkey(HttpServletRequest req, Model model) {
		logger.info("findId, 페이지");
		
		guService.emailkey(req, model);

		return "guest/emailkey";
	}	
	@RequestMapping(value = "emailok")
	public String emailok(HttpServletRequest req, Model model) {
		logger.info("emailok, 페이지");
		
		guService.emailok(req, model);

		return "guest/emailok";
	}	
	//♬ 일반회원가입정보처리페이지                          
	@RequestMapping(value = "guestShipPro")
	public String guestShipPro(HttpServletRequest req, Model model) {
		logger.info("guestShipPro, 페이지");
		guService.guestShipPro(req, model);
		
		return "guest/guestShipPro";
	}	
	//♬ 일반회원정보수정페이지                           
	@RequestMapping(value = "guestModify")
	public String guestModify(HttpServletRequest req, Model model) {
		logger.info("guestModify, 페이지");
		guService.guestModify(req, model);
		
		return "guest/guestModify";
	}	
	// 일반회원정보수정처리
	@RequestMapping(value = "guestModifyPro")
	public String guestModifyPro(HttpServletRequest req, Model model) {
		logger.info("guestModifyPro, 페이지");
		guService.guestModifyPro(req, model);
		
		return "guest/myGuest";
	}	
	// ♬마이헬스페이지                           
	@RequestMapping(value = "myHealth")
	public String myHealth(HttpServletRequest req, Model model) {
		logger.info("myHealth, 페이지");
		guService.myHealth(req, model);
		return "guest/myHealth";
	}	
	//♬ 마이헬스 정보등록페이지
	@RequestMapping(value = "personalAddPro")
	public String personalAddPro(HttpServletRequest req, Model model) {
		logger.info("personalAddPro, 페이지");
		guService.personalAddPro(req, model);
		return "guest/personalAddPro";
	}	
	//  마이헬스 수정페이지
	@RequestMapping(value = "personalMof")
	public String personalMof(HttpServletRequest req, Model model) {
		logger.info("personalMof, 페이지");
		guService.myHealth(req, model);
		return "guest/personalMof";
	}	
	//  마이헬스 수정처리페이지
	@RequestMapping(value = "personalMofPro")
	public String personalMofPro(HttpServletRequest req, Model model) {
		logger.info("personalMofPro, 페이지");
		guService.personalMofPro(req, model);
		return "guest/personalMofPro";
	}	
	// 즐겨찾는병원페이지                            
	@RequestMapping(value = "bookMark")
	public String bookMark(HttpServletRequest req, Model model) {
		logger.info("bookMark, 페이지");
		return "guest/bookMark";
	}	
	// 예약목록페이지                            
	@RequestMapping(value = "reserveList")
	public String reserveList(HttpServletRequest req, Model model) {
		logger.info("reserveList, 페이지");
		guService.reserveList(req, model);

		return "guest/reserveList";
	}
	//간단진료페이지                           
	@RequestMapping(value = "simpleTreat")
	public String simpleTreat(HttpServletRequest req, Model model) {
		logger.info("simpleTreat, 페이지");
		return "guest/simpleTreat";
	}	
	
	
	
	//간단진료 처리페이지                           
		@RequestMapping(value = "simpleTreatPro")
		public String simpleTreatPro(HttpServletRequest req, Model model) {
			logger.info("simpleTreatPro, 페이지");
			guService.simpleTreatPro(req, model);
			return "guest/simpleTreatPro";
		}	
	
	
	//♬개인정보등록페이지                           
	@RequestMapping(value = "personalAdd")
	public String personalAdd(HttpServletRequest req, Model model) {
		logger.info("personalAdd, 페이지");
		
		
		return "guest/personalAdd";
	}	
	
	//칼로리등록페이지                            
	@RequestMapping(value = "caloryAdd")
	public String caloryAdd(HttpServletRequest req, Model model) {
		logger.info("caloryAdd, 페이지");
		return "guest/caloryAdd";
	}	
	//개인건강관리페이지                            
	@RequestMapping(value = "personalCare")
	public String personalCare(HttpServletRequest req, Model model) {
		logger.info("personalCare, 페이지");
		
		guService.myHealth(req, model);

		return "guest/personalCare";
	}
	//예약신청페이지  !!! 예약 신청 리스트 따로 필요할 듯 
	@RequestMapping(value = "reserveForm")
	public String reserveForm(HttpServletRequest req, Model model) {
		logger.info("reserveForm, 페이지");
		guService.reservehospital(req, model);
		return "guest/reserveForm";
	}
	//예약신청처리페이지
	@RequestMapping(value = "reservePro")
	public String reservePro(HttpServletRequest req, Model model) {
		logger.info("reservePro, 페이지");
		guService.reservePro(req, model);
		return "guest/reservePro";
	}
	
	
	//검진결과분석페이지                             
	@RequestMapping(value = "checkAnalyze")
	public String checkAnalyze(HttpServletRequest req, Model model) {
		logger.info("checkAnalyze, 페이지");
		guService.checkAnalyze(req, model);
		
		return "guest/checkAnalyze";
	}
	//검진서등록페이지
	@RequestMapping(value = "checkupRegister")
	public String checkupRegister(HttpServletRequest req, Model model) {
		logger.info("checkupRegister, 페이지");
		return "guest/checkupRegister";
	}
	// 검진서 등록 처리페이지
	@RequestMapping(value = "checkupRegisterPro")
	public String checkupRegisterPro(HttpServletRequest req, Model model) {
		logger.info("checkupRegisterPro, 페이지");
		guService.checkupRegisterPro(req, model);

		return "guest/checkupRegisterPro";
	}
	/*
	//음식 검색 칼로리조회 -아침
	@RequestMapping(value = "foodsearch1")
	public String foodsearch1(HttpServletRequest req, Model model) {
		logger.info("foodsearch, 페이지");
		guService.foodsearch(req, model);

		return "guest/foodsearch1";
	}
	//음식 검색 칼로리조회 -점심
		@RequestMapping(value = "foodsearch2")
		public String foodsearch2(HttpServletRequest req, Model model) {
			logger.info("foodsearch, 페이지");
			guService.foodsearch(req, model);

			return "guest/foodsearch2";
		}
	
	//음식 검색 칼로리조회 -저녁
	@RequestMapping(value = "foodsearch3")
	public String foodsearch3(HttpServletRequest req, Model model) {
		logger.info("foodsearch, 페이지");
		guService.foodsearch(req, model);

		return "guest/foodsearch3";
	}

	//아점저 칼로리 등록 후  정보 인설트 
	@RequestMapping(value = "todaycal")
	public String todaycal(HttpServletRequest req, Model model) {
		logger.info("todaycal, 페이지");
		guService.todaycal(req, model);

		return "guest/todaycal";
	}
	*/
	
	// ♬ 마이페이지
	@RequestMapping(value = "myGuest")
	public String myGuest(HttpServletRequest req, Model model) {
		logger.info("myGuest, 페이지");
		return "guest/myGuest";
	}
	
	// 내 질문목록
	@RequestMapping(value = "myBordList")
	public String myBordList(HttpServletRequest req, Model model) {
		logger.info("myBordList, 페이지");
		guService.myBordList(req, model);
		return "guest/myBordList";
	}
	
	//♬ 일반회원로그인
	@RequestMapping(value = "guestLogin")
	public String guestLogin(HttpServletRequest req, Model model) {
		logger.info("guestLogin, 페이지");
		
		guService.guestLogin(req, model);
		
		return "guest/guestLoginPro";
	}	
	//일반회원탈퇴확인페이지                  
	@RequestMapping(value = "guestExit")
	public String memberExit(HttpServletRequest req, Model model) {
		logger.info("guestExit, 페이지");
		return "guest/guestExit";
	}
	@RequestMapping(value = "guestExitPro")
	public String guestExitPro(HttpServletRequest req, Model model) {
		logger.info("guestExitPro, 페이지");
		
		guService.guestExitPro(req, model);
		
		return "guest/guestExitPro";
	}
	
}
