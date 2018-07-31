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
import org.springframework.util.SystemPropertyUtils;

import com.team.medical.persitence.GuestDAO;
import com.team.medical.vo.CalorieVO;
import com.team.medical.vo.CheckupVO;
import com.team.medical.vo.DiseaseVO;
import com.team.medical.vo.ExaminationVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.HospitalVO;
import com.team.medical.vo.MyhealthVO;
import com.team.medical.vo.QuestionBoardVO;
import com.team.medical.vo.ReservationVO;

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
	public void personalMofPro(HttpServletRequest req, Model model) {
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
		
		int updatecnt = dao.personalMofPro(vo);
		model.addAttribute("updatecnt", updatecnt);

	}

	
	
	@Override
	public void myHealth(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //Myhealth테이블에 guestno을 통해 해당 회원의 건강정보를  셀렉트 하기위함
		int guestNo = gvo.getGuestNo();
		System.out.println("guestNo?"+guestNo);
		int selectcnt =0;
	
		
		MyhealthVO vo = new MyhealthVO();
		vo = dao.myHealth(guestNo);
		if(vo !=null) {
			selectcnt = 1;  //등록하기 버튼 표시여부 때문에 필요!
		}
		System.out.println("selectcnt?"+selectcnt);
		model.addAttribute("vo", vo);
		model.addAttribute("selectcnt", selectcnt);
	
		
				
	
	}
	@Override
	public void checkupRegisterPro(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //Checkup테이블에 guestno 인서트 하기위해 회원정보에서 guestNo 값 가져옴
		int guestNo = gvo.getGuestNo();
		
		ExaminationVO vo = new ExaminationVO();
		
		vo.setGuestno(guestNo);
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
		int selectcnt = 0;
		
		ExaminationVO vo = new ExaminationVO();
		vo = dao.checkAnalyze(guestNo);
		
		if(vo!=null) {
			selectcnt = 1;
		}
		model.addAttribute("vo",vo);
		model.addAttribute("selectcnt",selectcnt);

	
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
	@Override
	public void reservehospital(HttpServletRequest req, Model model) {
		//int hospitalno = req.getParameter("hospitalno");
		int hospitalno = 26;
		HospitalVO vo = new HospitalVO();
		
		vo = dao.reservehospital(hospitalno);
		
		model.addAttribute("vo",vo);
			
	
	}
	@Override
	public void reservePro(HttpServletRequest req, Model model) {
		ReservationVO vo = new ReservationVO();
		//나중에  실제 데이터에 따라 쿼리문 변동
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //해당 회원의 회원정보 수정을위해 guestNo 값셀렉
		int guestNo = gvo.getGuestNo();
		
		System.out.println("hospitalno? " + req.getParameter("hospitalno"));
		System.out.println("reservationTime? " + req.getParameter("reservationTime"));
	
		
		vo.setHospitalno(Integer.parseInt(req.getParameter("hospitalno")));
		vo.setGuestNo(guestNo);
		vo.setReservationTime(Date.valueOf(req.getParameter("reservationTime")));
		vo.setReservationKind(Integer.parseInt(req.getParameter("reservationKind")));
		vo.setHospitalkind(req.getParameter("hospitalkind"));
		vo.setClock(req.getParameter("clock"));
		vo.setMinute(req.getParameter("minute"));
		vo.setSymptom(req.getParameter("symptom"));
		vo.setSymptomchk(req.getParameter("symptomchk"));
		
		int insertcnt = dao.reservePro(vo);
		model.addAttribute("insertcnt",insertcnt );
		
	}
	@Override
	public void reserveList(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //해당 회원 guestNo구하기
		int guestNo = gvo.getGuestNo();
		ArrayList<ReservationVO> dtos = new ArrayList<ReservationVO>();
		
		dtos = dao.reserveList(guestNo);
		model.addAttribute("dtos",dtos );

		 
	
	}
		//간단진료 증상 체크시 해당 질병과 질병을 진료하는 병원 셀렉
	@Override
	public void simpleTreatPro(HttpServletRequest req, Model model) {
		int selectcnt = 0; //질병의 유무 구분
		
		//나열된 증상을 , 로 구분하여 배열에 담음
		String[] chk = req.getParameter("symptomchk").split(",");

		//증상에해당하는 병 정보담을 바구니
		 ArrayList<DiseaseVO> dtos = new ArrayList<DiseaseVO>();
		 //병의 진료과에 해당하는 병원 정보 담을 바구니
		 ArrayList<HospitalVO> htos = new ArrayList<HospitalVO>();
		
		//배열에 담은 증상만큼 dao 실행
		for (int i = 0; i < chk.length; i++) {
			System.out.println("service: "+ chk[i]);
			dtos = dao.simpleTreatPro(chk[i]);
			
				
		}
		
		//조회된 질병의 진료과 만큼 병원 조회
		for(int j =0 ; j<dtos.size(); j++) {
		String dikind = dtos.get(j).getDiseasehospitalkind();
		System.out.println("service dikind"+dikind);
		htos = dao.simpleTreathos(dikind);
		if(dikind != null) {
			selectcnt =1;
		}
		}
		
		
		System.out.println("selectcnt : "+ selectcnt);
		model.addAttribute("dtos", dtos);
		model.addAttribute("htos", htos);
		model.addAttribute("selectcnt", selectcnt);
	}
	@Override
	public void foodsearch(HttpServletRequest req, Model model) {
		String food =  req.getParameter("food");
		int selectcnt = 0;
		CalorieVO vo = new CalorieVO();
		
		vo = dao.foodsearch(food);
		if(vo != null) {
			selectcnt = 1;
		}
		
		model.addAttribute("vo",vo);
		model.addAttribute("selectcnt",selectcnt);
	}
	@Override
	public void todaycal(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //해당 회원의 회원정보 수정을위해 guestNo 값셀렉
		int guestNo = gvo.getGuestNo();
		int food1 = Integer.parseInt(req.getParameter("food1"));
		int food2 = Integer.parseInt(req.getParameter("food2"));
		int food3 = Integer.parseInt(req.getParameter("food3"));
		
		int todaycal =food1+food2+food3;
		System.out.println("todaycal"+todaycal);
		System.out.println("guestNo"+guestNo);
		
		CalorieVO vo =  new CalorieVO();
		vo.setGuestNo(guestNo);
		vo.setTodaycal(todaycal);

		int insertcnt = dao.todaycal(vo);
		
		
		
	
		if(insertcnt !=0) {
			
			vo = dao.mycal(guestNo);
		}
	
		model.addAttribute("vo",vo);
	}
	

/*	@Override
	public void simpleTreatPro(HttpServletRequest req, Model model) {
		

		String[] chk = req.getParameter("symptomchk").split(",");

		 ArrayList<SimpleTreatVO> dtos = new ArrayList<SimpleTreatVO>();
		
		for (int i = 0; i < chk.length; i++) {
			System.out.println("service: "+ chk[i]);
			dtos = dao.simpleTreatPro(chk[i]);
		}
	
		model.addAttribute("dtos", dtos);

	}*/
/*	@Override
	public void simpleTreatPro(HttpServletRequest req, Model model) {
		

		String[] chk = req.getParameter("symptomchk").split(",");

		 ArrayList<DiseaseVO> dtos = new ArrayList<DiseaseVO>();
		
		for (int i = 0; i < chk.length; i++) {
			System.out.println("service: "+ chk[i]);
			dtos = dao.simpleTreatPro(chk[i]);
			
				
		}
		for(int j =0 ; j<dtos.size(); j++) {
		String dikind = dtos.get(j).getDiseasehospitalkind();
		
		}
		System.out.println("병테이블 진료과"+dtos.get(0).getDiseasehospitalkind());
		
		model.addAttribute("dtos", dtos);

	}
	*/
}
