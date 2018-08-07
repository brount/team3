package com.team.medical.controller;

import javax.servlet.http.HttpServletRequest;

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
	
	//약관동의페이지
	@RequestMapping(value = "doctorClauseAgree")
	public String clauseAgree(HttpServletRequest req, Model model) {
		System.out.println("clauseAgree, 페이지");
		return "doctor/doctorClauseAgree";
	}
	//의사회원가입정보입력페이지                      
	@RequestMapping(value = "doctorShipForm")
	public String doctorShipForm(HttpServletRequest req, Model model) {
		System.out.println("doctorShipForm, 페이지");
		return "doctor/doctorShipForm";
	}
	//아이디 중복확인                    
	@RequestMapping(value = "doctorconfirmId")
	public String confirmId(HttpServletRequest req, Model model) {
		System.out.println("confirmId, 페이지");
		
		docService.confirmId(req, model);
		return "doctor/confirmId";
	}
	// 의사회원가입 병원찾기  페이지                 
	@RequestMapping(value = "/hosSearch")
	public String hosSearch(HttpServletRequest req, Model model) {
		System.out.println("hosSearch, 페이지");
		
		coService.hospitalList(req, model);
		return "doctor/hosSearch";
	}
	//ㅎ의사회원가입 병원찾기  페이지                 
	@RequestMapping("/hosSearch_sub")
	public String hosSearchList(HttpServletRequest req, Model model) {
		System.out.println("hosSearchList, 페이지");
		
		coService.hospitalList(req, model);
		return "doctor/hosSearch_sub";
	}
	//회원 가입 처리
	@RequestMapping("inputPro")
	public String inputPro(MultipartHttpServletRequest req, Model model) {
		System.out.println("inputPro");
		
		docService.inputPro(req, model);
		return "doctor/inputPro";
	}
	
	//의사회원로그인
 	@RequestMapping(value = "doctorLogin")
 	public String doctorLogin(HttpServletRequest req, Model model) {
 		System.out.println("doctorLogin, 페이지");
 		docService.doctorLogin(req,model);
 		
 		return "common/mainmenuversion";
 	}
 	
	//의사회원정보수정페이지                       
	@RequestMapping(value = "doctorModify")
	public String doctorModify(HttpServletRequest req, Model model) {
		System.out.println("doctorModify, 페이지");
		
		docService.doctorModifyInfo(req, model);
		return "doctor/doctorModify";
	}
	//의사회원정보수정페이지                       
	@RequestMapping(value = "modifyPro")
	public String modifyPro(MultipartHttpServletRequest req, Model model) {
		System.out.println("doctorModify, 페이지");
		
		docService.modifyPro(req, model);
		return "doctor/modifyPro";
	}
	//의사회원탈퇴                       
	@RequestMapping(value = "deletePro")
	public String deletePro(HttpServletRequest req, Model model) {
		System.out.println("deletePro, 페이지");
		
		docService.deletePro(req, model);
		return "doctor/deletePro";
	}
	//마이병원                       
	@RequestMapping(value = "myHospital")
	public String myHospital(HttpServletRequest req, Model model) {
		System.out.println("myHospital, 페이지");
		String id = (String)req.getSession().getAttribute("id");
		model.addAttribute("id",id);
		
		docService.myHospitalInfo(req, model);
		return "doctor/myHospital";
	}
	
	//마이병원 등록                      
	@RequestMapping(value = "myHospitalResistraion")
	public String myHospitalResistraion(HttpServletRequest req, Model model) {
		System.out.println("myHospitalResistraion, 페이지");
		
		return "doctor/myHospitalResistraion";
	}
	
	//마이병원 수정처리                  
	@RequestMapping(value = "myHospitalInputPro")
	public String myHospitalInputPro(MultipartHttpServletRequest req, Model model) {
		System.out.println("myHospitalInputPro, 페이지");
		
		docService.myHospitalUpdatePro(req, model);
		return "doctor/myHospitalInputPro";
	}	
	
	//검사의뢰
    @RequestMapping(value = "checkupRequest")
    public String checkupRequest(HttpServletRequest req, Model model) {
    	
       docService.patientInfo(req, model);
       docService.docnoInfo(req, model);
       System.out.println("checkupRequest, 페이지");
       
       return "doctor/checkupRequest";
    }
    
    //검사의뢰 등록처리
    @RequestMapping(value = "checkupRequestInputPro")
    public String checkupRequestInputPro(HttpServletRequest req, Model model) {
       System.out.println("checkupRequestInputPro, 페이지");
       
       docService.checkupRequestInputPro(req, model);
       return "doctor/checkupRequestInputPro";
    }
	
	//검사의뢰목록페이지                         
	@RequestMapping(value = "checkupList")
	public String checkupList(HttpServletRequest req, Model model) {
		System.out.println("checkupList, 페이지");
		
		String doctorname = req.getParameter("doctorname");
		model.addAttribute("doctorname",doctorname);
		
		docService.checkupList(req, model);
		
		return "doctor/checkupList";
	}
	
	 // 검사의뢰 상세
    @RequestMapping(value = "checkupInfo")
    public String checkupInfo(HttpServletRequest req, Model model) {
       System.out.println("checkupInfo, 페이지");
       
       int checkuplist = Integer.parseInt(req.getParameter("checkuplist"));
       model.addAttribute("checkuplist", checkuplist);
       
       docService.getCheckupInfo(req, model);
       
       return "doctor/checkupInfo";
    }
    
    //건강검진 등록
    @RequestMapping(value = "checkupAdd")
	    public String checkupAdd(HttpServletRequest req, Model model) {
	    System.out.println("checkupAdd, 페이지");
	    //int doctorno = Integer.parseInt(req.getParameter("doctorno"));
	    int checkuplist = Integer.parseInt(req.getParameter("checkuplist"));
	    model.addAttribute("checkuplist", checkuplist);
	    //model.addAttribute("doctorno", doctorno);
		   
	    
	    docService.getCheckupInfo(req, model);
	  
	    return "doctor/checkupAdd";
    }
    
    //건강검진 등록처리
    @RequestMapping(value = "checkupAddInputPro")
	    public String checkupAddInputPro(HttpServletRequest req, Model model) {
	    System.out.println("checkupAddInputPro, 페이지");
	    
	    docService.checkupAddInputPro(req, model);
	  
	    return "doctor/checkupAddInputPro";
    }
    
    //건강검진 목록페이지                          
  	@RequestMapping(value = "checkupResultList")
  	public String checkupResultList(HttpServletRequest req, Model model) {
  		System.out.println("checkupResultList, 페이지");
  		
  		//********
  	/*	int doctorno = Integer.parseInt(req.getParameter("doctorno"));
		model.addAttribute("doctorno", doctorno);
		System.out.println("doctorno :" +  doctorno);*/
  		docService.checkupResultList(req, model);
  		return "doctor/checkupResultList";
  	}
    
  	// 건강검진 상세페이지                          
  	@RequestMapping(value = "checkupResult")
  	public String checkupResult(HttpServletRequest req, Model model) {
  		System.out.println("checkupResult, 페이지");
  		
  		int checkup = Integer.parseInt(req.getParameter("checkup"));
        model.addAttribute("checkup", checkup);
        docService.checkupResult(req, model);
  		
  		
  		return "doctor/checkupResult";
  	}
  	
    //처방결과등록페이지                          
  	@RequestMapping(value = "examinationAdd")
  	public String examinationAdd(HttpServletRequest req, Model model) {
  		System.out.println("examinationAdd, 페이지");
  		
  		docService.examinationAdd(req, model);
        return "doctor/examinationAdd";
  	}
  	
  	//처방결과등록페이지                          
  	@RequestMapping(value = "examinationInputPro")
  	public String examinationInputPro(HttpServletRequest req, Model model) {
  		System.out.println("examinationInputPro, 페이지");
  		
  		int checkup = Integer.parseInt(req.getParameter("checkup"));
  		model.addAttribute("checkup", checkup);
  		
  		docService.examinationInputPro(req, model);
        return "doctor/examinationInputPro";
  	}
	
  	//처방목록페이지                          
  	@RequestMapping(value = "examinationList")
  	public String examinationList(HttpServletRequest req, Model model) {
  		System.out.println("examinationList, 페이지");
  		
  		docService.examinationList(req, model);
  		return "doctor/examinationList";
  	}
  	
	//처방상세페이지                          
	@RequestMapping(value = "examinationInfo")
	public String examinationInfo(HttpServletRequest req, Model model) {
		System.out.println("examinationInfo, 페이지");
		
		int prescriptionNo = Integer.parseInt(req.getParameter("prescriptionNo"));
  		model.addAttribute("checkup", prescriptionNo);
		
		docService.examinationInfo(req, model);
		return "doctor/examinationInfo";
	}
	
	
	
	//병원업무진행
    @RequestMapping(value = "hospital")
    public String hospital(HttpServletRequest req, Model model) {
       System.out.println("hospital, 페이지");
       return "doctor/hospital";
    }
    
    //마이페이지
 	@RequestMapping(value = "myDoctor")
 	public String myDoctor(HttpServletRequest req, Model model) {
 		System.out.println("myDoctor, 페이지");
 		return "doctor/myDoctor";
 	}
 	
 	
 	//검진 예약 목록
    @RequestMapping(value = "patientList")
    public String patientList(HttpServletRequest req, Model model) {
       System.out.println("patientList, 페이지");
       
       docService.patientList(req, model);
       return "doctor/patientList";
    }
    
    //검진 예약 상세
    @RequestMapping(value = "patientInfo")
    public String patientInfo(HttpServletRequest req, Model model) {
       System.out.println("patientInfo, 페이지");
       
       docService.patientInfo(req, model);
       return "doctor/patientInfo";
    }
    
    
    //포인트관리페이지                        
  	@RequestMapping(value = "pointManage")
  	public String pointManage(HttpServletRequest req, Model model) {
  		System.out.println("pointManage, 페이지");
  		return "doctor/pointManage";
  	}
}
