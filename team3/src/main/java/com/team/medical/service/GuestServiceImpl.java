package com.team.medical.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.team.medical.persitence.GuestDAO;
import com.team.medical.vo.CheckupVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.MyhealthVO;
import com.team.medical.vo.QuestionBoardVO;


@Service
public class GuestServiceImpl implements GuestService {
	
	@Autowired
	GuestDAO dao;
	
	// 일반회원 로그인
	@Override
	public void guestLogin(HttpServletRequest req, Model model) {
		String id =req.getParameter("id");
		String pwd = req.getParameter("pwd");

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		int loginCnt = dao.guestLogin(map);
		if(loginCnt==1) {
			req.getSession().setAttribute("id", id);
		}else {
			req.getSession().setAttribute("memberState",0);
		}
		model.addAttribute("loginCnt",loginCnt);
	}
	// 아이디중복확인
	@Override
	public void confirmId(HttpServletRequest req, Model model) {
		
		String strId = req.getParameter("id");

		
		int selectCnt = dao.idCheck(strId); // DB에서 아이디값 불러옴

		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("strId", strId);
		
		
		
	}
	@Override
	public void emailkey(HttpServletRequest req, Model model) {

		
		String email = req.getParameter("email");
		req.getSession().setAttribute("email", email);
		
		System.out.println("email ?"+email);

		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		
		for(int i=0; i<6; i++) {
			int rIndex = rnd.nextInt(2);
			switch(rIndex) {
			case 0:
				//A-Z
				temp.append((char)((int) (rnd.nextInt(26))+65));
				break;
	     	case 1:	
	     		//0-9
	     		temp.append((rnd.nextInt(10)));
	     		break;
	     		
			}
			
		}
		String key = temp.toString();
		System.out.println("key?"+key);
		req.getSession().setAttribute("key", key);
		model.addAttribute("cnt",1);
		
		dao.sendmail(email,key);
		
			
	}
	@Override
	public void emailok(HttpServletRequest req, Model model) {

		int keycnt = 0;
		int cnt = 0;
		String key = (String)req.getSession().getAttribute("key");
		System.out.println("key?"+key);
	
		String email = (String)req.getSession().getAttribute("email");
		System.out.println("email?"+email);
	
		String email_key = req.getParameter("key");
		System.out.println("email_key?"+email_key);
		
	
		
		cnt = dao.emailok(email);
		System.out.println("cnt"+cnt);
			if(cnt==0) {
				
				keycnt =1;
				 
			}
		
			
		
		System.out.println("keycnt?"+keycnt);
		model.addAttribute("keycnt", keycnt);
			
	}
	@Override
	public void guestShipPro(HttpServletRequest req, Model model) {
	
		GuestVO vo = new GuestVO();
		vo.setGuestid(req.getParameter("id"));
		vo.setGuestpwd(req.getParameter("password"));
		vo.setGuestname(req.getParameter("name"));
		
		vo.setAddress1(req.getParameter("address1"));
		vo.setAddress2(req.getParameter("address2"));
		vo.setAddress3(req.getParameter("address3"));
		
		// 주민번호
		String jumin = "";
		String jumin1 = req.getParameter("jumin1");
		String jumin2= req.getParameter("jumin2");
		if (!jumin1.equals("") && !jumin2.equals("")) { 
			jumin = jumin1 + "-" +jumin2;
		}
		vo.setJumin(jumin);
		// hp
		String hp = "";
		String hp1 = req.getParameter("phone1");
		String hp2 = req.getParameter("phone2");
		String hp3 = req.getParameter("phone3");

		if (!hp1.equals("") && !hp2.equals("") && !hp3.equals("")) { 
			hp = hp1 + "-" + hp2 + "-" + hp3;
		}
		vo.setGuesttel(hp);
	
		// email
		String email = "";
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");

		email = email1 + "@" + email2;

		vo.setGuestemail(email);

		// reg_date
		vo.setGuestdate((new Date(System.currentTimeMillis())));

		int insertcnt = dao.insertGuest(vo);
		model.addAttribute("insertcnt", insertcnt);
		
	}
	@Override
	public void guestModify(HttpServletRequest req, Model model) {

		//String pwd = req.getParameter("pwd");
		String id = (String) req.getSession().getAttribute("id");
		/*
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("pwd", pwd);
	
		
		int selectcnt = dao.idPwdcheck(map);

*/
//		if (selectcnt == 1) {
			GuestVO vo = dao.getGuestInfo(id);
			model.addAttribute("vo", vo);
//		}


//		model.addAttribute("selectcnt", selectcnt);

		
	}
	
	// 마이헬스 정보등록페이지
	@Override
	public void personalAddPro(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //Myhealth테이블에 guestno 인서트 하기위해 회원정보 불러옴
		int guestNo = gvo.getGuestNo();
		System.out.println(guestNo);
		MyhealthVO vo = new MyhealthVO();
		vo.setGuestNo(guestNo);
		vo.setBirth1(Integer.parseInt(req.getParameter("birth1")));
		vo.setBirth2(Integer.parseInt(req.getParameter("birth2")));
		vo.setBirth3(Integer.parseInt(req.getParameter("birth3")));
		vo.setAge(Integer.parseInt(req.getParameter("age")));
		vo.setHeight(req.getParameter("height"));
		vo.setWeight(req.getParameter("weight"));
		vo.setGender(req.getParameter("gender"));
		vo.setBloodtype(req.getParameter("bloodtype"));
		
		int insertcnt = dao.personalAddPro(vo);
		model.addAttribute("insertcnt", insertcnt);

		

	
	

	
	}
	@Override
	public void myHealth(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //Myhealth테이블에 guestno을 통해 해당 회원의 건강정보를  셀렉트 하기위함
		int guestNo = gvo.getGuestNo();
		int insertcnt =0;
	
		
		MyhealthVO vo = new MyhealthVO();
		vo = dao.myHealth(guestNo);
		if(vo !=null) {
			insertcnt = 1;  //등록하기 버튼 표시여부 때문에 필요!
		}
		System.out.println(	 insertcnt);
		model.addAttribute("vo", vo);
		model.addAttribute("insertcnt", insertcnt);
	
		
				
	
	}
	@Override
	public void checkupRegisterPro(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //Checkup테이블에 guestno 인서트 하기위해 회원정보에서 guestNo 값 가져옴
		int guestNo = gvo.getGuestNo();
		
		CheckupVO vo = new CheckupVO();
		
		vo.setGuestNo(guestNo);
		vo.setHeight(req.getParameter("height"));
		vo.setWeight(req.getParameter("weight"));
		vo.setFatness(req.getParameter("fatness"));
		vo.setVisionl(req.getParameter("visionl"));
		vo.setVisionr(req.getParameter("visionr"));
		vo.setHearingl(req.getParameter("hearingl"));
		vo.setHearingr(req.getParameter("hearingr"));
		vo.setBloodpremax(req.getParameter("bloodpremax"));
		vo.setBloodpremin(req.getParameter("bloodpremin"));
		vo.setUrineglucose(req.getParameter("urineglucose"));
		vo.setUrineprotein(req.getParameter("urineprotein"));
		vo.setOcculthematuria(req.getParameter("occulthematuria"));	
		vo.setUrineph(req.getParameter("urineph"));
		vo.setHemoglobin(req.getParameter("hemoglobin"));
		vo.setBloodglucose(req.getParameter("bloodglucose"));
		vo.setTotalcholesterol(req.getParameter("totalcholesterol"));
		vo.setAst(req.getParameter("ast"));
		vo.setAlt(req.getParameter("alt"));
		vo.setGammagtp(req.getParameter("gammagtp"));
		vo.setHepatitisscr(req.getParameter("hepatitisscr"));
		vo.setBreastradiography(req.getParameter("breastradiography"));
		vo.setEcg(req.getParameter("ecg"));
		
		
		int insertcnt = dao.checkupRegisterPro(vo);
		model.addAttribute("insertcnt",insertcnt);
		
		
		
		
		
	}
	@Override
	public void checkAnalyze(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //CheckUp테이블에 guestno을 통해 해당 회원의 검진서결과를  셀렉트 하기위함
		int guestNo = gvo.getGuestNo();
		
		CheckupVO vo = new CheckupVO();
		vo = dao.checkAnalyze(guestNo);
		
		model.addAttribute("vo",vo);
	
	}
	@Override
	public void guestModifyPro(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //해당 회원의 회원정보 수정을위해 guestNo 값셀렉
		int guestNo = gvo.getGuestNo();
		
		
		GuestVO vo = new GuestVO();
		vo.setGuestNo(guestNo);
		vo.setGuestpwd(req.getParameter("password"));
		
		
		vo.setAddress1(req.getParameter("address1"));
		vo.setAddress2(req.getParameter("address2"));
		vo.setAddress3(req.getParameter("address3"));
		
	
		// hp
		String hp = "";
		String hp1 = req.getParameter("phone1");
		String hp2 = req.getParameter("phone2");
		String hp3 = req.getParameter("phone3");

		if (!hp1.equals("") && !hp2.equals("") && !hp3.equals("")) { 
			hp = hp1 + "-" + hp2 + "-" + hp3;
		}
		vo.setGuesttel(hp);
	
		// email
		String email = "";
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");

		email = email1 + "@" + email2;

		vo.setGuestemail(email);

		int updatecnt = dao.updateGuest(vo);
		model.addAttribute("updatecnt", updatecnt);
		
		
	}
	@Override
	public void myBordList(HttpServletRequest req, Model model) {
		
		String id = (String) req.getSession().getAttribute("id");
		System.out.println("ID?" +id);
		
		ArrayList<QuestionBoardVO> dtos = new ArrayList<QuestionBoardVO>();
		
		dtos = dao.myBordList(id);
		
		model.addAttribute("dtos",dtos);
		
		


		
	}
	@Override
	public void guestExitPro(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //해당 회원의 회원정보 수정을위해 guestNo 값셀렉
		int guestNo = gvo.getGuestNo();
		
		int updatecnt = dao.guestExitPro(guestNo);
		
		model.addAttribute("updatecnt",updatecnt);
		
		
	}
}
