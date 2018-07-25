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
	//내용들어 갈 부분(헤더푸터공통부분)
	@RequestMapping("templets")
	public String templets(HttpServletRequest req,Model model) {
		logger.info("templets");
	
		return "common/templets";
	}
	//로그인화면페이지              
	@RequestMapping(value = "memberLogin")
	public String memberLogin(HttpServletRequest req, Model model) {
		logger.info("memberLogin, 페이지");
		return "common/memberLogin";
	}
	//회원분류페이지
	@RequestMapping(value = "memberClassify")
	public String memberClassify(HttpServletRequest req, Model model) {
		logger.info("memberClassify, 페이지");
		return "common/memberClassify";
	}
	//본인인증페이지
	@RequestMapping(value = "memberCertify")
	public String memberCertify(HttpServletRequest req, Model model) {
		logger.info("memberCertify, 페이지");
		return "common/memberCertify";
	}
	//가입완료페이지
	@RequestMapping(value = "memberShipPro")
	public String memberShipPro(HttpServletRequest req, Model model) {
		logger.info("memberShipPro, 페이지");
		return "common/memberShipPro";
	}
	//비밀번호확인페이지                 
	@RequestMapping(value = "passwordChek")
	public String passwordChek(HttpServletRequest req, Model model) {
		logger.info("passwordChek, 페이지");
		return "common/passwordChek";
	}
	//회원탈퇴확인페이지                  
	@RequestMapping(value = "memberExit")
	public String memberExit(HttpServletRequest req, Model model) {
		logger.info("memberExit, 페이지");
		return "common/memberExit";
	}
	//날씨페이지                   
	@RequestMapping(value = "weatherList")
	public String weatherList(HttpServletRequest req, Model model) {
		logger.info("weatherList, 페이지");
		return "common/weatherList";
	}
	//예방내용페이지                           
	@RequestMapping(value = "cpreventionList")
	public String PreventionList(HttpServletRequest req, Model model) {
		logger.info("PreventionList, 페이지");
		return "common/preventionList";
	}
	//병상세페이지
	@RequestMapping(value = "diseaseInfo")
	public String diseaseInfo(HttpServletRequest req, Model model) {
		logger.info("diseaseInfo, 페이지");
		return "common/diseaseInfo";
	}
	//약검색페이지
	@RequestMapping(value = "drugSeach")
	public String drugSeach(HttpServletRequest req, Model model) {
		logger.info("drugSeach, 페이지");
		return "common/drugSeach";
	}
	//약상세페이지                      
	@RequestMapping(value = "drugInfo")
	public String drugInfo(HttpServletRequest req, Model model) {
		logger.info("drugInfo, 페이지");
		return "common/drugInfo";
	}
	//운동정보목록페이지                       
	@RequestMapping(value = "exerciseInfoList")
	public String exerciseList(HttpServletRequest req, Model model) {
		logger.info("exerciseInfoList, 페이지");
		return "common/exerciseInfoList";
	}
	//운동정보페이지                       
	@RequestMapping(value = "exerciseInfo")
	public String exerciseInfo(HttpServletRequest req, Model model) {
		logger.info("exerciseInfo, 페이지");
		return "common/exerciseInfo";
	}
	//음식정보목록페이지                        
	@RequestMapping(value = "foodInfoList")
	public String foodList(HttpServletRequest req, Model model) {
		logger.info("foodInfoList, 페이지");
		return "common/foodInfoList";
	}
	//음식정보페이지                        
	@RequestMapping(value = "foodInfo")
	public String foodInfo(HttpServletRequest req, Model model) {
		logger.info("foodInfo, 페이지");
		return "common/foodInfo";
	}
	//10대질병정보페이지                         
	@RequestMapping(value = "diseaseTop")
	public String diseaseTop(HttpServletRequest req, Model model) {
		logger.info("diseaseTop, 페이지");
		return "common/diseaseTop";
	}
	//병원약국검색페이지                       
	@RequestMapping(value = "hospitalSeach")
	public String hospitalSeach(HttpServletRequest req, Model model) {
		logger.info("hospitalSeach, 페이지");
		return "common/hospitalSeach";
	}
	//병원정보페이지                          
	@RequestMapping(value = "hospitalInfo")
	public String hospitalInfo(HttpServletRequest req, Model model) {
		logger.info("hospitalInfo, 페이지");
		return "common/hospitalInfo";
	}
	//이벤트 목록페이지                        
	@RequestMapping(value = "eventList")
	public String eventList(HttpServletRequest req, Model model) {
		logger.info("eventList, 페이지");
		
		coService.eventList(req, model);
		
		return "common/eventList";
	}
	//이벤트 상세페이지
	@RequestMapping(value = "eventInfo")
	public String eventInfo(HttpServletRequest req, Model model) {
		logger.info("eventInfo, 페이지");
		
		coService.eventInfo(req, model);
		
		return "common/eventInfo";
	}
	//이벤트 신청페이지                       
	@RequestMapping(value = "eventRequest")
	public String eventRequest(HttpServletRequest req, Model model) {
		logger.info("eventRequest, 페이지");
		
		String id = (String) req.getSession().getAttribute("id");
		model.addAttribute("id", id);
		
		return "common/eventRequest";
	}
	//이벤트 추가
	@RequestMapping(value = "eventAdd")
	public String eventAdd(MultipartHttpServletRequest req, Model model) {
		logger.info("eventAdd, 페이지");
		
		coService.eventAdd(req, model);
		
		return "common/eventRequest";
	}
	//질문목록페이지
	@RequestMapping(value = "boardList")
	public String boardList(HttpServletRequest req, Model model) {
		logger.info("boardList, 페이지");
		
		coService.boardList(req,model);
		return "common/boardList";
	}
	//질문상세페이지 
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
		return "common/boadrList";
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
	//로그인화면페이지              
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
	//로그아웃
	@RequestMapping(value = "logout")
	public String logout(HttpServletRequest req, Model model) {
		logger.info("logout, 페이지");
		req.getSession().setAttribute("memberState",0);
		req.getSession().setAttribute("id",null);
		
		return "common/mainmenuversion";
	}
	
}

