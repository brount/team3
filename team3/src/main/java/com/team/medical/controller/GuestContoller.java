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

	// 약관동의페이지
	@RequestMapping(value = "guestClauseAgree")
	public String clauseAgree(HttpServletRequest req, Model model) {
		logger.info("clauseAgree, 페이지");
		return "guest/guestClauseAgree";
	}

	// ♬ 일반회원가입정보입력페이지
	@RequestMapping(value = "guestShipForm")
	public String guestShipForm(HttpServletRequest req, Model model) {
		logger.info("guestShipForm, 페이지");
		return "guest/guestShipForm";
	}

	// ♬ 일반회원가입아이디중복확인페이지
	@RequestMapping(value = "confirmId")
	public String confirm(HttpServletRequest req, Model model) {
		logger.info("confirmId, 페이지");

		guService.confirmId(req, model);

		return "guest/confirmId";
	}

	// ♬ 일반회원 이메일 인증버튼클릭시 페이지
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

	// ♬ 일반회원가입정보처리페이지
	@RequestMapping(value = "guestShipPro")
	public String guestShipPro(HttpServletRequest req, Model model) {
		logger.info("guestShipPro, 페이지");
		guService.guestShipPro(req, model);

		return "guest/guestShipPro";
	}

	// ♬ 일반회원정보수정페이지
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

	// ♬ 마이헬스 정보등록페이지
	@RequestMapping(value = "personalAddPro")
	public String personalAddPro(HttpServletRequest req, Model model) {
		logger.info("personalAddPro, 페이지");
		guService.personalAddPro(req, model);
		return "guest/personalAddPro";
	}

	// 마이헬스 수정페이지
	@RequestMapping(value = "personalMof")
	public String personalMof(HttpServletRequest req, Model model) {
		logger.info("personalMof, 페이지");
		guService.myHealth(req, model);
		return "guest/personalMof";
	}

	// 마이헬스 수정처리페이지
	@RequestMapping(value = "personalMofPro")
	public String personalMofPro(HttpServletRequest req, Model model) {
		logger.info("personalMofPro, 페이지");
		guService.personalMofPro(req, model);
		return "guest/personalMofPro";
	}

	// 병원즐겨찾기
	@RequestMapping(value = "bookMarkIn")
	public String bookMarkIn(HttpServletRequest req, Model model) {
		logger.info("bookMarkIn, 페이지");
		guService.bookMarkIn(req, model);
		guService.bookMark(req, model);
		return "guest/bookMark";
	}

	// 즐겨찾는병원페이지
	@RequestMapping(value = "bookMark")
	public String bookMark(HttpServletRequest req, Model model) {
		logger.info("bookMark, 페이지");
		guService.bookMark(req, model);
		return "guest/bookMark";
	}

	// 예약목록페이지
	@RequestMapping(value = "reserveList")
	public String reserveList(HttpServletRequest req, Model model) {
		logger.info("reserveList, 페이지");
		guService.reserveList(req, model);

		return "guest/reserveList";
	}

	// 간단진료페이지
	@RequestMapping(value = "simpleTreat")
	public String simpleTreat(HttpServletRequest req, Model model) {
		logger.info("simpleTreat, 페이지");
		return "guest/simpleTreat";
	}

	// 간단진료 처리페이지
	@RequestMapping(value = "simpleTreatPro")
	public String simpleTreatPro(HttpServletRequest req, Model model) {
		logger.info("simpleTreatPro, 페이지");
		guService.simpleTreatPro(req, model);
		return "guest/simpleTreatPro";
	}

	// ♬개인정보등록페이지
	@RequestMapping(value = "personalAdd")
	public String personalAdd(HttpServletRequest req, Model model) {
		logger.info("personalAdd, 페이지");

		return "guest/personalAdd";
	}

	// 예약신청페이지 
	@RequestMapping(value = "reserveForm")
	public String reserveForm(HttpServletRequest req, Model model) {
		logger.info("reserveForm, 페이지");
		guService.reservehospital(req, model);
		return "guest/reserveForm";
	}

	// 예약신청처리페이지
	@RequestMapping(value = "reservePro")
	public String reservePro(HttpServletRequest req, Model model) {
		logger.info("reservePro, 페이지");
		guService.reservePro(req, model);
		return "guest/reservePro";
	}

	// 검진결과분석페이지
	@RequestMapping(value = "checkAnalyze")
	public String checkAnalyze(HttpServletRequest req, Model model) {
		logger.info("checkAnalyze, 페이지");
		guService.checkAnalyze(req, model);

		return "guest/checkAnalyze";
	}

	// 검진서등록페이지
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

	// 사용자가 등록한 검진서 리스트
	@RequestMapping(value = "checkupRegisterList")
	public String checkupRegisterList(HttpServletRequest req, Model model) {
		logger.info("checkupRegisterList, 페이지");
		guService.checkupRegisterList(req, model);
		return "guest/checkupRegisterList";
	}

	// 사용자가 등록한 검진서 클릭시 분석페이지
	@RequestMapping(value = "checkupRegisterclick")
	public String checkupRegisterclick(HttpServletRequest req, Model model) {
		logger.info("checkupRegisterclick, 페이지");
		guService.checkupRegisterclick(req, model);
		return "guest/checkupRegisterclick";
	}

	// 사용자가 등록한 검진서 삭제
	@RequestMapping(value = "checkdelete")
	public String checkdelete(HttpServletRequest req, Model model) {
		logger.info("checkdelete, 페이지");
		guService.checkdelete(req, model);
		return "guest/checkupRegisterList";
	}

	
//--------------------------------------------------------------------------------------------------	
	// 칼로리등록페이지
	@RequestMapping(value = "caloryAdd")
	public String caloryAdd(HttpServletRequest req, Model model) {
		logger.info("caloryAdd, 페이지");
		guService.caloryAdd(req, model);

		return "guest/caloryAdd2";
	}
	// 칼로리등록처리페이지
	@RequestMapping(value = "todaycal")
	public String todaycal(HttpServletRequest req, Model model) {
		logger.info("todaycal, 페이지");
		guService.todaycal(req, model);
		guService.kcalList(req,model);
		// 칼로리 일자별 리스트
		return "guest/kcalList";
	}
	// 칼로리등록처리페이지
	@RequestMapping(value = "kcalList")
	public String kcalList(HttpServletRequest req, Model model) {
		logger.info("kcalList, 페이지");
		guService.kcalList(req,model);
		// 칼로리 일자별 리스트
		return "guest/kcalList";
	}
	//마이페이지에서 칼로리등록처리페이지
		@RequestMapping(value = "mkcalList")
		public String mkcalList(HttpServletRequest req, Model model) {
			logger.info("mkcalList, 페이지");
			guService.kcalList(req,model);
			// 칼로리 일자별 리스트
			return "guest/mkcalList";
		}
	// 칼로리 일자별 상세페이지
	@RequestMapping(value = "kcalInfo")
	public String kcalInfo(HttpServletRequest req, Model model) {
		logger.info("kcalInfo, 페이지");
		guService.kcalInfo(req,model);
		// 칼로리 일자별 리스트
		return "guest/todaycal";
	}
	// 개인건강관리페이지
	@RequestMapping(value = "personalCare")
	public String personalCare(HttpServletRequest req, Model model) {
		logger.info("personalCare, 페이지");

		guService.myHealth(req, model);

		return "guest/personalCare";
	}

	// (마이페이지버전)개인건강관리페이지
	@RequestMapping(value = "personalCareM")
	public String personalCareM(HttpServletRequest req, Model model) {
		logger.info("personalCareM, 페이지");

		guService.myHealth(req, model);

		return "guest/personalCareM";
	}
	
	
	
	// 음식 검색 페이지
	@RequestMapping(value = "foodSearch")
	public String foodsearch(HttpServletRequest req, Model model) {
		logger.info("foodsearch, 페이지");
		guService.foodkind(req, model);
		
		if(req.getParameter("sc") !=null) {
			model.addAttribute("sc",req.getParameter("sc"));
			model.addAttribute("select",req.getParameter("select"));
			model.addAttribute("pageNum",req.getParameter("pageNum"));
		}
		
		
		return "guest/foodsearch";
	}
	// 음식 검색
	@RequestMapping(value = "foodSearch_sub")
	public String foodsearch1(HttpServletRequest req, Model model) {
		logger.info("foodSearch_sub, 페이지");
		guService.foodsearch(req, model);

		return "guest/foodSearch_sub";
	}
	
	
	
//--------------------------------------------------------------------------------------------------
	
	
	
	

	// 건강검진 목록페이지
	@RequestMapping(value = "guestcheckupResultList")
	public String checkupResultList(HttpServletRequest req, Model model) {
		logger.info("guestcheckupResultList, 페이지");

		guService.guestcheckupResultList(req, model);
		return "guest/guestcheckupResultList";
	}

	// 처방목록페이지
	@RequestMapping(value = "guestexaminationList")
	public String examinationList(HttpServletRequest req, Model model) {
		logger.info("guestexaminationList, 페이지");

		guService.guestexaminationList(req, model);
		return "guest/guestexaminationList";
	}

	// 처방상세페이지
		@RequestMapping(value = "guestexaminationInfo")
		public String guestexaminationInfo(HttpServletRequest req, Model model) {
			logger.info("guestexaminationInfo, 페이지");

			guService.guestexaminationInfo(req, model);
			return"doctor/examinationInfo";
		}
	
	// ♬ 마이페이지
	@RequestMapping(value = "myGuest")
	public String myGuest(HttpServletRequest req, Model model) {
		logger.info("myGuest, 페이지");

		guService.myHealth(req, model);
		return "guest/myGuest";
	}

	// 내 질문목록
	@RequestMapping(value = "myBordList")
	public String myBordList(HttpServletRequest req, Model model) {
		logger.info("myBordList, 페이지");
		guService.myBordList(req, model);
		return "guest/myBordList";
	}

	// ♬ 일반회원로그인
	@RequestMapping(value = "guestLogin")
	public String guestLogin(HttpServletRequest req, Model model) {
		logger.info("guestLogin, 페이지");

		guService.guestLogin(req, model);

		return "guest/guestLoginPro";
	}

	// 일반회원탈퇴비밀번호확인
	@RequestMapping(value = "guestExit")
	public String memberExit(HttpServletRequest req, Model model) {
		logger.info("exitOk, 페이지");
		return "guest/exitOk";
	}

	// 일반회원탈퇴비밀번호확인처리
	@RequestMapping(value = "exitOkPro")
	public String exitOkPro(HttpServletRequest req, Model model) {
		logger.info("exitOkPro, 페이지");
		guService.exitOkPro(req, model);

		return "guest/exitOkPro";
	}

	// 일반회원탈퇴 안내문
	@RequestMapping(value = "guestExitOk")
	public String guestExitOk(HttpServletRequest req, Model model) {
		logger.info("guestExitOk, 페이지");

		return "guest/guestExit";
	}

	@RequestMapping(value = "guestExitPro")
	public String guestExitPro(HttpServletRequest req, Model model) {
		logger.info("guestExitPro, 페이지");

		guService.guestExitPro(req, model);

		return "guest/guestExitPro";
	}

}
