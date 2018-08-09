package com.team.medical.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.medical.service.CommonService;

@Controller
public class CommonContoller {
	
	@Autowired
	CommonService coService;
	
	private static final Logger logger = LoggerFactory.getLogger(CommonContoller.class);
	
	@RequestMapping("main")
	public String main(HttpServletRequest req,Model model) {
		logger.info("main");
		if(req.getSession().getAttribute("memberState") == null) {
			req.getSession().setAttribute("memberState", 0);
		}
		return "common/mainmenuversion";
	}
	// 내용들어 갈 부분(헤더푸터공통부분)
	@RequestMapping("templets")
	public String templets(HttpServletRequest req,Model model) {
		logger.info("templets");
	
		return "common/templets";
	}
	// 로그인화면페이지              
	@RequestMapping(value = "memberLogin")
	public String memberLogin(HttpServletRequest req, Model model) {
		logger.info("memberLogin, 페이지");
		return "common/memberLogin";
	}
	// 회원분류페이지
	@RequestMapping(value = "memberClassify")
	public String memberClassify(HttpServletRequest req, Model model) {
		logger.info("memberClassify, 페이지");
		return "common/memberClassify";
	}
	// 본인인증페이지
	@RequestMapping(value = "memberCertify")
	public String memberCertify(HttpServletRequest req, Model model) {
		logger.info("memberCertify, 페이지");
		return "common/memberCertify";
	}
	// 가입완료페이지
	@RequestMapping(value = "memberShipPro")
	public String memberShipPro(HttpServletRequest req, Model model) {
		logger.info("memberShipPro, 페이지");
		return "common/memberShipPro";
	}
	// 질병 리스트
	@RequestMapping(value = "cdiseaseList")
	public String diseaseList(HttpServletRequest req, Model model) {
		logger.info("cdiseaseList, 페이지");
		
		coService.diseaseList(req, model);
		
		return "common/cdiseaseList";
	}
	// 병상세페이지
	@RequestMapping(value = "diseaseInfo")
	public String diseaseInfo(HttpServletRequest req, Model model) {
		logger.info("diseaseInfo, 페이지");
		
		coService.diseaseInfo(req, model);
		
		return "common/diseaseInfo";
	}
	//약검색페이지
	@RequestMapping(value = "drugSeach")
	public String drugSeach(HttpServletRequest req, Model model) {
		logger.info("drugSeach, 페이지");
		return "common/drugSeach";
	}
	//약전체검색
	@RequestMapping(value = "drugSeachList")
	public String drugSeachAll(HttpServletRequest req, Model model) {
		logger.info("drugSeachAll, 페이지");
		
		coService.drugSeachList(req,model);
		return "common/drugList";
	}
	//약상세페이지                      
	@RequestMapping(value = "drugInfo")
	public String drugInfo(HttpServletRequest req, Model model) {
		logger.info("drugInfo, 페이지");
		return "common/drugInfo";
	}
	// 운동정보목록페이지                       
	@RequestMapping(value = "exerciseInfoList")
	public String exerciseList(HttpServletRequest req, Model model) {
		logger.info("exerciseInfoList, 페이지");
		
		coService.exerciseInfoList(req, model);
		
		return "common/exerciseInfoList";
	}
	// 운동정보페이지                       
	@RequestMapping(value = "exerciseInfo")
	public String exerciseInfo(HttpServletRequest req, Model model) {
		logger.info("exerciseInfo, 페이지");
		
		coService.exerciseInfo(req, model);
		
		return "common/exerciseInfo";
	}
	//병원검색페이지                       
	@RequestMapping(value = "hospitalSeach")
	public String hospitalSeach(HttpServletRequest req, Model model) {
		logger.info("hospitalSeach, 페이지");
		
		return "common/hospitalSeach";
	}
	//제휴 병원검색페이지                       
	@RequestMapping(value = "achospitalSeach")
	public String achospitalSeach(HttpServletRequest req, Model model) {
		logger.info("achospitalSeach, 페이지");
		
		coService.hospitalList(req, model);
		return "common/achospitalSeach";
	}
	
	//약국검색페이지                       
	@RequestMapping(value = "drugStoreSeach")
	public String drugStoreSeach(HttpServletRequest req, Model model) {
		logger.info("drugStoreSeach, 페이지");
		
		return "common/drugStoreSeach";
	}
	// 병원정보페이지                          
	@RequestMapping(value = "hospitalInfo")
	public String hospitalInfo(HttpServletRequest req, Model model) {
		logger.info("hospitalInfo, 페이지");
		
		coService.getHospitalInfo(req, model);
		return "common/hospitalInfo";
	}
	// 이벤트 목록페이지                        
	@RequestMapping(value = "eventList")
	public String eventList(HttpServletRequest req, Model model) {
		logger.info("eventList, 페이지");
		
		coService.eventList(req, model);
		
		return "common/eventList";
	}
	// 이벤트 상세페이지
	@RequestMapping(value = "eventInfo")
	public String eventInfo(HttpServletRequest req, Model model) {
		logger.info("eventInfo, 페이지");
		
		coService.eventInfo(req, model);
		
		return "common/eventInfo";
	}
	// 이벤트 신청페이지                       
	@RequestMapping(value = "eventRequest")
	public String eventRequest(HttpServletRequest req, Model model) {
		logger.info("eventRequest, 페이지");
		
		String id = (String) req.getSession().getAttribute("id");
		model.addAttribute("id", id);
		
		return "common/eventRequest";
	}
	// 이벤트 추가
	@RequestMapping(value = "eventAdd")
	public String eventAdd(MultipartHttpServletRequest req, Model model) {
		logger.info("eventAdd, 페이지");
		
		coService.eventAdd(req, model);
		
		coService.eventList(req, model);
		
		return "common/eventList";
	}
	// 질문목록페이지
	@RequestMapping(value = "boardList")
	public String boardList(HttpServletRequest req, Model model) {
		logger.info("boardList, 페이지");
		
		coService.boardList(req,model);
		
		return "common/boardList";
	}
	// 질문상세페이지 
	@RequestMapping(value = "boardInfo")
	public String boardInfo(HttpServletRequest req, Model model) {
		logger.info("BoardInfo, 페이지");
		
		coService.boardInfo(req, model);
		return "common/boardInfo";
	}
	// 질문등록페이지 
	@RequestMapping(value = "boardAdd")
	public String BoardAdd(HttpServletRequest req, Model model) {
		logger.info("BoardAdd, 페이지");
		int kind = Integer.parseInt(req.getParameter("kind"));
		
		int num =0;
		int ref =1; // 그룹화 아이디
		int pageNum=1;//페이지
		//답변글
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
		
		return "common/boardAdd";
	}
	// 질문등록 처리
	@RequestMapping(value = "boardAddPro")
	public String boardAddPro(HttpServletRequest req, Model model) {
		logger.info("boardAddPro, 페이지");
		
		coService.boardAddPro(req,model);
		
		coService.boardList(req, model);
		
		return "common/boardList";
	}
	// 질문수정페이지
	@RequestMapping(value = "boardModify")
	public String boardModify(HttpServletRequest req, Model model) {
		logger.info("boardModify, 페이지");
		int num = Integer.parseInt(req.getParameter("num"));
		int kind = Integer.parseInt(req.getParameter("kind"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("kind",kind);
		model.addAttribute("num",num);
		
		return "common/boardModify";
	}
	// 질문수정상세페이지
	@RequestMapping(value="boardModifyView")
	public String boardModifyView(HttpServletRequest req, Model model) {
		logger.info("boardModifyView, 페이지");
		
		coService.boardModify(req, model);	
		return "common/boardModifyView";
	}
	// 질문수정처리페이지
	@RequestMapping(value = "boardModifyPro")
	public String boardModifyPro(HttpServletRequest req, Model model) {
		logger.info("boardModifyPro, 페이지");
		coService.boardModifyPro(req, model);
		
		return "common/boardModifyPro";
	}
	// 질문삭제페이지
	@RequestMapping(value = "boardDelete")
	public String boardDelete(HttpServletRequest req, Model model) {
		logger.info("boardDelete, 페이지");
		int num = Integer.parseInt(req.getParameter("num"));
		int kind = Integer.parseInt(req.getParameter("kind"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("kind",kind);
		model.addAttribute("num",num);
		
		return "common/boardDelete";
	}
	// 질문삭제 처리페이지
	@RequestMapping(value = "boardDeletePro")
	public String boardDeletePro(HttpServletRequest req, Model model) {
		logger.info("boardDeletePro, 페이지");
		
		coService.boardDeletePro(req, model);
		return "common/boardDeletePro";
	}
	// 의사 댓글작성
	@RequestMapping(value = "inputre")
	public String inputre(HttpServletRequest req, Model model) {
		logger.info("inputre, 페이지");
		
		coService.inputre(req,model);
		coService.boardInfo(req, model);
		return "common/boardInfo";
	}
	// 댓글삭제페이지
	@RequestMapping(value = "refDelete")
	public String refDelete(HttpServletRequest req, Model model) {
		logger.info("refDelete, 페이지");
		int num = Integer.parseInt(req.getParameter("num"));
		int number = Integer.parseInt(req.getParameter("number"));
		int kind = Integer.parseInt(req.getParameter("kind"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("kind",kind);
		model.addAttribute("num",num);
		model.addAttribute("number",number);
		
		return "common/refDelete";
	}
	// 댓글삭제 처리페이지
	@RequestMapping(value = "refDeletePro")
	public String refDeletePro(HttpServletRequest req, Model model) {
		logger.info("refDeletePro, 페이지");
		
		coService.boardDeletePro(req, model);
		return "common/refDeletePro";
	}
	// 로그인화면페이지              
	@RequestMapping(value = "memberLoginPro")
	public String memberLoginPro(HttpServletRequest req, Model model) {
		logger.info("memberLoginPro, 페이지");
		int state = Integer.parseInt(req.getParameter("memberState"));
		req.getSession().setAttribute("memberState", state);
		String id =req.getParameter("id");
		String pwd = req.getParameter("pwd");
		req.setAttribute("id", id);
		req.setAttribute("pwd", pwd);
		String page=null;
		if(state == 1) {
			page = "guest/guestLogin";
		}
		else if(state == 2) {
			page = "doctor/doctorLogin";
		}
		return page;
	}
	// 로그아웃
	@RequestMapping(value = "logout")
	public String logout(HttpServletRequest req, Model model) {
		logger.info("logout, 페이지");
		req.getSession().setAttribute("memberState",0);
		req.getSession().setAttribute("id",null);
		
		return "common/mainmenuversion";
	}
	// 식중독지수
	@RequestMapping(value = "foodPoisoning")
	public String foodPoisoning(HttpServletRequest req, Model model) {
		logger.info("foodPoisoning, 페이지");
		
		return "common/foodPoisoning";
	}
	// 자외선지수
	@RequestMapping(value = "ultravioletRay")
	public String ultravioletRay(HttpServletRequest req, Model model) {
		logger.info("ultravioletRay, 페이지");
		
		return "common/ultravioletRay";
	}
	// 고객센터 글목록페이지
	@RequestMapping(value = "reportBoardList")
	public String reportBoardList(HttpServletRequest req, Model model) {
		logger.info("reportBoardList, 페이지");
		
		coService.reportBoardList(req, model);
		
		return "common/reportBoardList";
	}
	// 질문상세페이지 
	@RequestMapping(value = "reportBoardInfo")
	public String reportBoardInfo(HttpServletRequest req, Model model) {
		logger.info("reportBoardInfo, 페이지");
		
		coService.reportBoardInfo(req, model);
		return "common/reportBoardInfo";
	}
	// 고객센터 글등록페이지 
	@RequestMapping(value = "reportBoardAdd")
	public String reportBoardAdd(HttpServletRequest req, Model model) {
		logger.info("reportBoardAdd, 페이지");
		int kind = Integer.parseInt(req.getParameter("kind"));
		
		int num =0;
		int ref =1; // 그룹화 아이디
		int pageNum=1; //페이지
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
		
		return "common/reportBoardAdd";
	}
	// 고객센터 글등록 처리
	@RequestMapping(value = "reportBoardAddPro")
	public String reportBoardAddPro(HttpServletRequest req, Model model) {
		logger.info("reportBoardAddPro, 페이지");
		
		coService.boardAddPro(req,model);
		
		coService.reportBoardList(req, model);
		
		return "common/reportBoardList";
	}
	// 고객센터 수정 페이지
	@RequestMapping(value = "reportBoardModify")
	public String reportBoardModify(HttpServletRequest req, Model model) {
		logger.info("reportBoardModify, 페이지");
		int num = Integer.parseInt(req.getParameter("num"));
		int kind = Integer.parseInt(req.getParameter("kind"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("kind",kind);
		model.addAttribute("num",num);
		
		return "common/reportBoardModify";
	}
	// 고객센터 수정상세페이지
	@RequestMapping(value="reportBoardModifyView")
	public String reportBoardModifyView(HttpServletRequest req, Model model) {
		logger.info("reportBoardModifyView, 페이지");
		
		coService.boardModify(req, model);
		return "common/reportBoardModifyView";
	}
	// 고객센터 수정처리페이지
	@RequestMapping(value = "reportBoardModifyPro")
	public String reportBoardModifyPro(HttpServletRequest req, Model model) {
		logger.info("reportBoardModifyPro, 페이지");
		coService.boardModifyPro(req, model);
		
		return "common/reportBoardModifyPro";
	}
	// 고객센터 삭제페이지
	@RequestMapping(value = "reportBoardDelete")
	public String reportBoardDelete(HttpServletRequest req, Model model) {
		logger.info("reportBoardDelete, 페이지");
		int num = Integer.parseInt(req.getParameter("num"));
		int kind = Integer.parseInt(req.getParameter("kind"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("kind",kind);
		model.addAttribute("num",num);
		
		return "common/reportBoardDelete";
	}
	// 고객센터 삭제 처리페이지
	@RequestMapping(value = "reportBoardDeletePro")
	public String reportBoardDeletePro(HttpServletRequest req, Model model) {
		logger.info("reportBoardDeletePro, 페이지");
		
		coService.boardDeletePro(req, model);
		return "common/reportBoardDeletePro";
	}
	// 테스트
	@RequestMapping(value = "test")
	public String test(HttpServletRequest req, Model model) throws IOException {
		logger.info("test, 페이지");
		
		coService.test(req, model);
		
		return "common/test";
	}
	
}

