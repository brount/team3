package com.team.medical.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.medical.service.CommonService;
import com.team.medical.service.DoctorService;

@Controller
public class DoctorContoller {

	@Autowired
	DoctorService docService;
	@Autowired
	CommonService coService;

	private static final Logger logger = LoggerFactory.getLogger(AdminContoller.class);

	// 약관동의페이지
	@RequestMapping(value = "doctorClauseAgree")
	public String clauseAgree(HttpServletRequest req, Model model) {
		logger.info("clauseAgree, 페이지");
		return "doctor/doctorClauseAgree";
	}

	// 의사회원가입정보입력페이지
	@RequestMapping(value = "doctorShipForm")
	public String doctorShipForm(HttpServletRequest req, Model model) {
		logger.info("doctorShipForm, 페이지");
		return "doctor/doctorShipForm";
	}

	// 아이디 중복확인
	@RequestMapping(value = "doctorconfirmId")
	public String confirmId(HttpServletRequest req, Model model) {
		logger.info("confirmId, 페이지");

		docService.confirmId(req, model);
		return "doctor/confirmId";
	}

	// 의사회원가입 병원찾기 페이지
	@RequestMapping(value = "/hosSearch")
	public String hosSearch(HttpServletRequest req, Model model) {
		logger.info("hosSearch, 페이지");

		coService.hospitalList(req, model);
		return "doctor/hosSearch";
	}

	// ㅎ의사회원가입 병원찾기 페이지
	@RequestMapping("/hosSearch_sub")
	public String hosSearchList(HttpServletRequest req, Model model) {
		logger.info("hosSearchList, 페이지");

		coService.hospitalList(req, model);
		return "doctor/hosSearch_sub";
	}

	// 아이디찾기 이메일 코드 보내기
	@RequestMapping(value = { "emailCheck", "guest/emailCheck" })
	public String findId(HttpServletRequest req, Model model) {
		logger.info("emailCheck");

		docService.emailkey(req, model);

		return "doctor/emailCheck";
	}

	// 회원 가입 처리
	@RequestMapping("inputPro")
	public String inputPro(MultipartHttpServletRequest req, Model model) {
		logger.info("inputPro");

		docService.inputPro(req, model);
		return "doctor/inputPro";
	}

	// 의사회원로그인
	@RequestMapping(value = "doctorLogin")
	public String doctorLogin(HttpServletRequest req, Model model) {
		logger.info("doctorLogin, 페이지");
		docService.doctorLogin(req, model);

		return "doctor/doctorLoginPro";
	}

	// 의사회원로그인
	@RequestMapping(value = "doctorLoginPro")
	public String doctorLoginPro(HttpServletRequest req, Model model) {
		logger.info("doctorLogin, 페이지");
		docService.doctorLogin(req, model);

		return "doctor/doctorLoginPro";
	}

	// 의사회원정보수정페이지
	@RequestMapping(value = "doctorModify")
	public String doctorModify(HttpServletRequest req, Model model) {
		logger.info("doctorModify, 페이지");

		docService.doctorModifyInfo(req, model);
		return "doctor/doctorModify";
	}

	// 의사회원정보수정페이지
	@RequestMapping(value = "modifyPro")
	public String modifyPro(MultipartHttpServletRequest req, Model model) {
		logger.info("doctorModify, 페이지");

		docService.modifyPro(req, model);
		return "doctor/modifyPro";
	}

	// 의사회원탈퇴 처리
	@RequestMapping(value = "doctorExitOk")
	public String doctorExitOk(HttpServletRequest req, Model model) {
		logger.info("doctorExitOk, 페이지");

		return "doctor/doctorExitOk";
	}

	// 의사회원탈퇴 처리
	@RequestMapping(value = "deletePro")
	public String deletePro(HttpServletRequest req, Model model) {
		logger.info("deletePro, 페이지");

		docService.deletePro(req, model);
		return "doctor/deletePro";
	}

	// 마이병원
	@RequestMapping(value = "myHospital")
	public String myHospital(HttpServletRequest req, Model model) {
		logger.info("myHospital, 페이지");
		String id = (String) req.getSession().getAttribute("id");
		model.addAttribute("id", id);

		docService.myHospitalInfo(req, model);
		return "doctor/myHospital";
	}

	// 마이병원 수정
	@RequestMapping(value = "myHospitalUpdate")
	public String myHospitalResistraion(HttpServletRequest req, Model model) {
		logger.info("myHospitalResistraion, 페이지");

		docService.myHospitalUpdate(req, model);
		return "doctor/myHospitalUpdate";
	}

	// 마이병원 수정처리
	@RequestMapping(value = "myHospitalUpdatePro")
	public String myHospitalUpdatePro(MultipartHttpServletRequest req, Model model) {
		logger.info("myHospitalUpdatePro, 페이지");

		docService.myHospitalUpdatePro(req, model);
		return "doctor/myHospitalUpdatePro";
	}

	// 검사의뢰
	@RequestMapping(value = "checkupRequest")
	public String checkupRequest(HttpServletRequest req, Model model) {

		docService.patientInfo(req, model);
		docService.docnoInfo(req, model);
		logger.info("checkupRequest, 페이지");

		return "doctor/checkupRequest";
	}

	// 검사의뢰 등록처리
	@RequestMapping(value = "checkupRequestInputPro")
	public String checkupRequestInputPro(HttpServletRequest req, Model model) {
		logger.info("checkupRequestInputPro, 페이지");

		docService.checkupRequestInputPro(req, model);
		return "doctor/checkupRequestInputPro";
	}

	// 검사의뢰목록페이지
	@RequestMapping(value = "checkupList")
	public String checkupList(HttpServletRequest req, Model model) {
		logger.info("checkupList, 페이지");

		String doctorname = req.getParameter("doctorname");
		model.addAttribute("doctorname", doctorname);

		docService.checkupList(req, model);

		return "doctor/checkupList";
	}

	// 검사의뢰 상세
	@RequestMapping(value = "checkupInfo")
	public String checkupInfo(HttpServletRequest req, Model model) {
		logger.info("checkupInfo, 페이지");

		int checkuplist = Integer.parseInt(req.getParameter("checkuplist"));
		model.addAttribute("checkuplist", checkuplist);

		docService.getCheckupInfo(req, model);

		return "doctor/checkupInfo";
	}

	// 건강검진 등록
	@RequestMapping(value = "checkupAdd")
	public String checkupAdd(HttpServletRequest req, Model model) {
		logger.info("checkupAdd, 페이지");
		// int doctorno = Integer.parseInt(req.getParameter("doctorno"));
		int checkuplist = Integer.parseInt(req.getParameter("checkuplist"));
		model.addAttribute("checkuplist", checkuplist);
		// model.addAttribute("doctorno", doctorno);

		docService.getCheckupInfo(req, model);

		return "doctor/checkupAdd";
	}

	// 건강검진 등록처리
	@RequestMapping(value = "checkupAddInputPro")
	public String checkupAddInputPro(HttpServletRequest req, Model model) {
		logger.info("checkupAddInputPro, 페이지");

		docService.checkupAddInputPro(req, model);

		return "doctor/checkupAddInputPro";
	}

	// 건강검진 목록페이지
	@RequestMapping(value = "checkupResultList")
	public String checkupResultList(HttpServletRequest req, Model model) {
		logger.info("checkupResultList, 페이지");

		// ********
		/*
		 * int doctorno = Integer.parseInt(req.getParameter("doctorno"));
		 * model.addAttribute("doctorno", doctorno); logger.info("doctorno :" +
		 * doctorno);
		 */
		docService.checkupResultList(req, model);
		return "doctor/checkupResultList";
	}

	// 건강검진 상세페이지
	@RequestMapping(value = "checkupResult")
	public String checkupResult(HttpServletRequest req, Model model) {
		logger.info("checkupResult, 페이지");

		int checkup = Integer.parseInt(req.getParameter("checkup"));
		model.addAttribute("checkup", checkup);
		docService.checkupResult(req, model);

		return "doctor/checkupResult";
	}

	// 처방결과등록페이지
	@RequestMapping(value = "examinationAdd")
	public String examinationAdd(HttpServletRequest req, Model model) {
		logger.info("examinationAdd, 페이지");

		docService.examinationAdd(req, model);
		return "doctor/examinationAdd";
	}

	// 처방결과등록페이지
	@RequestMapping(value = "examinationInputPro")
	public String examinationInputPro(HttpServletRequest req, Model model) {
		logger.info("examinationInputPro, 페이지");

		int checkup = Integer.parseInt(req.getParameter("checkup"));
		model.addAttribute("checkup", checkup);

		docService.examinationInputPro(req, model);
		return "doctor/examinationInputPro";
	}

	// 처방목록페이지
	@RequestMapping(value = "examinationList")
	public String examinationList(HttpServletRequest req, Model model) {
		logger.info("examinationList, 페이지");

		docService.examinationList(req, model);
		return "doctor/examinationList";
	}

	// 처방상세페이지
	@RequestMapping(value = "examinationInfo")
	public String examinationInfo(HttpServletRequest req, Model model) {
		logger.info("examinationInfo, 페이지");

		int prescriptionNo = Integer.parseInt(req.getParameter("prescriptionNo"));
		model.addAttribute("checkup", prescriptionNo);

		docService.examinationInfo(req, model);
		return "doctor/examinationInfo";
	}

	// 병원업무진행
	@RequestMapping(value = "hospital")
	public String hospital(HttpServletRequest req, Model model) {
		logger.info("hospital, 페이지");
		return "doctor/hospital";
	}

	// 마이페이지
	@RequestMapping(value = "myDoctor")
	public String myDoctor(HttpServletRequest req, Model model) {
		logger.info("myDoctor, 페이지");
		return "doctor/myDoctor";
	}

	// 검진 예약 목록
	@RequestMapping(value = "patientList")
	public String patientList(HttpServletRequest req, Model model) {
		logger.info("patientList, 페이지");

		docService.patientList(req, model);
		return "doctor/patientList";
	}

	// 검진 예약 상세
	@RequestMapping(value = "patientInfo")
	public String patientInfo(HttpServletRequest req, Model model) {
		logger.info("patientInfo, 페이지");

		docService.patientInfo(req, model);
		return "doctor/patientInfo";
	}

	// 포인트관리페이지
	@RequestMapping(value = "pointManage")
	public String pointManage(HttpServletRequest req, Model model) {
		logger.info("pointManage, 페이지");

		docService.pointManage(req, model);

		return "doctor/pointManage";
	}

	// 의사 댓글모음
	@RequestMapping(value = "reBoard")
	public String reBoard(HttpServletRequest req, Model model) {
		logger.info("reBoard, 페이지");

		docService.reBoard(req, model);

		return "doctor/reBoard";
	}

	// 내 병원 예약 목록
	@RequestMapping(value = "MyHospitalReservationList")
	public String MyHospitalReservationList(HttpServletRequest req, Model model) {
		logger.info("MyHospitalReservationList, 페이지");

		docService.MyHospitalReservationList(req, model);

		return "doctor/MyHospitalReservationList";
	}

}
