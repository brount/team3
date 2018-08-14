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
import com.team.medical.vo.CheckupVO;
import com.team.medical.vo.DiseaseVO;
import com.team.medical.vo.ExaminationVO;
import com.team.medical.vo.FoodVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.HospitalVO;
import com.team.medical.vo.MyhealthVO;
import com.team.medical.vo.PrescriptionVO;
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
		vo.setHeight(Integer.parseInt(req.getParameter("height")));
		vo.setWeight(Integer.parseInt(req.getParameter("weight")));
		vo.setGender(Integer.parseInt(req.getParameter("gender")));
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
		vo.setHeight(Integer.parseInt(req.getParameter("height")));
		vo.setWeight(Integer.parseInt(req.getParameter("weight")));
		vo.setGender(Integer.parseInt(req.getParameter("gender")));
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
		int bmi = 0;
		String gender = "";
		  
		
		  
		MyhealthVO vo =  dao.myHealth(guestNo);
		if(vo !=null) {
		
			if(vo.getGender()==1) {
				gender="여자";
			}else if(vo.getGender()==2) {
				gender="남자";
			}
			
		
		
			selectcnt=1;  //등록하기 버튼 표시여부 때문에 필요!
			int weight =vo.getWeight();
			int height =vo.getHeight();
			
			/* bmi = (weight/(height*height))*10000;*/
			int height2 = height*height;
			int weigth2 =  weight*10000;
			double Dbmi = weigth2/height2;
			 bmi = (int)Dbmi;
			/*bmi*/
		
		}
		System.out.println("selectcnt?" +selectcnt);
		
		model.addAttribute("gender", gender);
		model.addAttribute("bmi", bmi);
		model.addAttribute("vo", vo);
		model.addAttribute("selectcnt", selectcnt);
	
		
				
	
	}
	@Override
	public void checkupRegisterPro(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //Checkup테이블에 guestno 인서트 하기위해 회원정보에서 guestNo 값 가져옴
		int guestNo = gvo.getGuestNo();
		String reservationtime1 = req.getParameter("reservationtime1");
		String reservationtime2 = req.getParameter("reservationtime2");
		String reservationtime3 = req.getParameter("reservationtime3");

				
		String reservationtime=reservationtime1+"-"+reservationtime2+"-"+reservationtime3;
		
		
		
		ExaminationVO vo = new ExaminationVO();
		
		vo.setGuestno(guestNo);
		System.out.println(guestNo);
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
		vo.setExaminationday(Date.valueOf(reservationtime));
	
		int insertcnt = dao.checkupRegisterPro(vo);
		model.addAttribute("insertcnt",insertcnt);
		
		
		
		
		
	}
	@Override
	public void checkAnalyze(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //CheckUp테이블에 guestno을 통해 해당 회원의 검진서결과를  셀렉트 하기위함
		int guestNo = gvo.getGuestNo();
		int col = Integer.parseInt(req.getParameter("col"));
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("guestNo", guestNo);
		map.put("col", col);
		
		ExaminationVO vo = new ExaminationVO();
		vo = dao.checkAnalyze(map);
		int selectcnt = 0;
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
		
		

		

		
		int pageSize = 10; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 보여질 페이지 수

		int cnt = 0; // 글 갯수
		int start = 0; // 현재 페이지 시작 글번호
		
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 화면에 출력할 출력용 글번호(실제DB의 번호와 달리 보여질 때 삭제된 행이있어도 순서대로 보여지도록~!)
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재페이지

		int pageCount = 0; // 페이지갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막페이지

		
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //해당 회원 guestNo구하기
		int guestNo = gvo.getGuestNo();
		
		
		cnt = dao.myBordListcnt(id);
		System.out.println("cnt : " + cnt);

		pageNum = req.getParameter("pageNum");	
		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 설정

		}
		// 글 30건을 기준
		currentPage = Integer.parseInt(pageNum); // 현재페이지 : 1
		System.out.println("currentPage :" + currentPage);

		// 글 갯수를 출력할 글 갯수로 나누는데
		// 나머지가 있을수 있으므로 나머지가 있으면 1페이지 추가하기위해 삼항연산자로 되묻는다.
		// 예) pageCount = (30/5)+(30 % 5 > 0 ? 1:0);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지

		// 1 =(1-1)*5+1;
		start = (currentPage - 1) * pageSize + 1; // 페이지별로 시작 글번호

		// 5 = 1 + 5 -1;
		end = start + pageSize - 1; // 페이지별로 마지막 글번호
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		// 30 = 30 - (1-1) * 5;
		number = cnt - (currentPage - 1) * pageSize; // 출력용 글번호
		System.out.println("number" + number);
		System.out.println("pageSize" + pageSize);
	
		if (cnt > 0) {
			// 게시글 목록 조회
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("id", id);
			
			ArrayList<QuestionBoardVO> dtos = new ArrayList<QuestionBoardVO>();
			 dtos = dao.myBordList(map);
			 
			// jsp로 게시글 목록(= 큰 바구니) 넘긴다.
			model.addAttribute("dtos", dtos);
	
		}

		// 1 = (1/3)*3+1
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지

		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage:" + startPage);

		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage); // 마지막페이지

		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함.)

		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number); // 글 번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호

		if (cnt > 0) {
		
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지

		}
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
		int hospitalno = Integer.parseInt(req.getParameter("hospitalno"));
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
	
		 String checkup_symptomchk = "";
	      String[] symptomchk = req.getParameterValues("symptomchk");
	      for(int i = 0 ; i<symptomchk.length; i ++) {
	         String a = (i==0) ? symptomchk[i] : "," + symptomchk[i];
	         System.out.println("a : " + a);
	         checkup_symptomchk += a;
	         System.out.println("checkup_symptomchk : " + checkup_symptomchk);
	      }
		
		
		
		vo.setHospitalno(Integer.parseInt(req.getParameter("hospitalno")));
		vo.setGuestNo(guestNo);
		vo.setReservationTime(Date.valueOf(req.getParameter("reservationTime")));
		vo.setReservationKind(Integer.parseInt(req.getParameter("reservationKind")));
		vo.setHospitalkind(req.getParameter("hospitalkind"));
		vo.setClock(req.getParameter("clock"));
		vo.setMinute(req.getParameter("minute"));
		vo.setSymptom(req.getParameter("symptom"));
		vo.setSymptomchk(checkup_symptomchk);
		
		int insertcnt = dao.reservePro(vo);
		model.addAttribute("insertcnt",insertcnt );
		
	}
	@Override
	public void reserveList(HttpServletRequest req, Model model) {
		

		
		int pageSize = 10; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 보여질 페이지 수

		int cnt = 0; // 글 갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 화면에 출력할 출력용 글번호(실제DB의 번호와 달리 보여질 때 삭제된 행이있어도 순서대로 보여지도록~!)
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재페이지

		int pageCount = 0; // 페이지갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막페이지

		
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //해당 회원 guestNo구하기
		int guestNo = gvo.getGuestNo();
		
		
		cnt = dao.reservecnt(guestNo);
		System.out.println("cnt : " + cnt);

		pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 설정

		}
		// 글 30건을 기준
		currentPage = Integer.parseInt(pageNum); // 현재페이지 : 1
		System.out.println("currentPage :" + currentPage);

		// 글 갯수를 출력할 글 갯수로 나누는데
		// 나머지가 있을수 있으므로 나머지가 있으면 1페이지 추가하기위해 삼항연산자로 되묻는다.
		// 예) pageCount = (30/5)+(30 % 5 > 0 ? 1:0);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지

		// 1 =(1-1)*5+1;
		start = (currentPage - 1) * pageSize + 1; // 페이지별로 시작 글번호

		// 5 = 1 + 5 -1;
		end = start + pageSize - 1; // 페이지별로 마지막 글번호
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		// 30 = 30 - (1-1) * 5;
		number = cnt - (currentPage - 1) * pageSize; // 출력용 글번호
		System.out.println("number" + number);
		System.out.println("pageSize" + pageSize);
	
		if (cnt > 0) {
			// 게시글 목록 조회
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("guestNo", guestNo);
			
			ArrayList<ReservationVO> dtos = new ArrayList<ReservationVO>();
			 dtos = dao.reserveList(map);
			 
			// jsp로 게시글 목록(= 큰 바구니) 넘긴다.
			model.addAttribute("dtos", dtos);
			
			
			
		}

		// 1 = (1/3)*3+1
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지

		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage:" + startPage);

		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage); // 마지막페이지

		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함.)

		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number); // 글 번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호

		if (cnt > 0) {
		
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지

		}
	
	}

	//간단진료 증상 체크시 해당 질병과 질병을 진료하는 병원 셀렉
	@Override
	public void simpleTreatPro(HttpServletRequest req, Model model) {
		int selectcnt = 0; //질병의 유무 구분
		
		//나열된 증상을 , 로 구분하여 배열에 담음
		String[] chk = req.getParameter("symptomchk").split(",");

		//증상에해당하는 병 정보담을 바구니
		 ArrayList<DiseaseVO> dtos = null;
		 //병의 진료과에 해당하는 병원 정보 담을 바구니
		 ArrayList<HospitalVO> htos = new ArrayList<HospitalVO>();
		
		//배열에 담은 증상만큼 dao 실행
		for (int i = 0; i < chk.length; i++) {
			System.out.println("service: "+ chk[i]);
			dtos = dao.simpleTreatPro(chk[i]);
			
				
		}
		if(dtos.isEmpty()) {
			selectcnt=0;
		}else {
			selectcnt=1;
		}
		
		
		System.out.println("selectcnt : "+ selectcnt);
		model.addAttribute("dtos", dtos);
		model.addAttribute("selectcnt", selectcnt);
	}
	@Override
	public void foodsearch(HttpServletRequest req, Model model) {
		String food =  req.getParameter("food");
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  
		int guestNo = gvo.getGuestNo();
		int selectcnt = 0;
		
	
		FoodVO vo = new FoodVO();
		vo.setGuestNo(guestNo);
		vo.setFood(food);
		
		ArrayList<FoodVO> dtos =null;
		dtos = dao.foodsearch(vo);
		if(dtos.isEmpty()) {
			selectcnt = 0;
		}else {
			selectcnt = 1;
		}
		System.out.println("음식검색"+selectcnt);
		model.addAttribute("food",food);
		model.addAttribute("dtos",dtos);
		model.addAttribute("selectcnt",selectcnt);
		
	}
	@Override
	public void todaycal(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  
		int guestNo = gvo.getGuestNo();
		int food1 = Integer.parseInt(req.getParameter("food1"));
		int food2 = Integer.parseInt(req.getParameter("food2"));
		int food3 = Integer.parseInt(req.getParameter("food3"));
		Date sysdate= new Date(System.currentTimeMillis());

		int todaycal =food1+food2+food3;
		System.out.println("todaycal"+todaycal);
		System.out.println("guestNo"+guestNo);
		
		FoodVO vo =  new FoodVO();
		vo.setGuestNo(guestNo);
		vo.setTodaycal(todaycal);
		vo.setDay(sysdate);

		int insertcnt = dao.todaycal(vo);
		
		if(insertcnt !=0) {
			
			vo = dao.mycal(vo);
		}
		
		// 기초대사량 구하기 위한 회원건강정보셀렉
		MyhealthVO mvo = new MyhealthVO();
		double	Dbasalmetabolism	= 0;
		
	
		mvo = dao.myHealth(guestNo);
		int height = mvo.getHeight();
		int weight = mvo.getWeight();
		int age = mvo.getAge();

		
		if(mvo.getGender()==1) {	//여자
			Dbasalmetabolism	= (655.1+(9.56*weight)+(5*height)-(6.76*age));
		}else if(mvo.getGender()==2) { //남자
			Dbasalmetabolism	= (66.47+(13.75*weight)+(1.85*height)-(4.68*age));
		}
		
		int basalmetabolism = (int)Dbasalmetabolism;
		int encouragecal = (int) (Dbasalmetabolism*1.3);

		
		int alertcnt=0;
		if(todaycal>encouragecal) {
			alertcnt=1;
		}
		
		System.out.println("alertcnt?"+alertcnt);
		
		model.addAttribute("vo",vo);
		model.addAttribute("mvo",mvo);
		model.addAttribute("encouragecal",encouragecal);
		model.addAttribute("basalmetabolism",basalmetabolism);
		model.addAttribute("alertcnt",alertcnt);
	}
	@Override
	public void caloryAdd(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  
		int guestNo = gvo.getGuestNo();
		FoodVO vo =  new FoodVO();

		Date sysdate= new Date(System.currentTimeMillis());
		vo.setGuestNo(guestNo);
		vo.setDay(sysdate);
		
		vo = dao.mycal(vo);
		
		int cnt=0;
		if(vo != null) {
			cnt=1;
		
		
		// 기초대사량 구하기 위한 회원건강정보셀렉
		MyhealthVO mvo = new MyhealthVO();
		double Dbasalmetabolism	= 0;
		
		System.out.println(guestNo);
		
		mvo = dao.myHealth(guestNo);
		int height = mvo.getHeight();
		int weight = mvo.getWeight();
		int age =  mvo.getAge();
		
		if(mvo.getGender()==1) {
			Dbasalmetabolism	= 655.1+(9.56*weight)+(1.85*height)-(4.68*age);
		}else if(mvo.getGender()==2) {
			Dbasalmetabolism	= 66.47+(13.75*weight)+(5*height)-(6.76*age);
					
		}
		
		int todaycal = vo.getTodaycal();
		int encouragecal = (int) (Dbasalmetabolism*1.3);

		
		int alertcnt=0;
		if(todaycal>encouragecal) {
			alertcnt=1;
		}

		int basalmetabolism = (int)Dbasalmetabolism;
		
		model.addAttribute("mvo",mvo);
		model.addAttribute("basalmetabolism",basalmetabolism);
		model.addAttribute("encouragecal",encouragecal);
		model.addAttribute("alertcnt",alertcnt);
		
		}
		

		model.addAttribute("cnt",cnt);
		model.addAttribute("vo",vo);
		
	}
	@Override
	public void calorAddModi(HttpServletRequest req, Model model) {
		
	String id = (String) req.getSession().getAttribute("id");
	GuestVO gvo = dao.getGuestInfo(id);  
	int guestNo = gvo.getGuestNo();
	int food1 = Integer.parseInt(req.getParameter("food1"));
	int food2 = Integer.parseInt(req.getParameter("food2"));
	int food3 = Integer.parseInt(req.getParameter("food3"));
	Date sysdate= new Date(System.currentTimeMillis());

	int todaycal =food1+food2+food3;
	System.out.println("todaycal"+todaycal);
	System.out.println("guestNo"+guestNo);
	
	FoodVO vo =  new FoodVO();
	vo.setGuestNo(guestNo);
	vo.setTodaycal(todaycal);
	vo.setDay(sysdate);

	int cnt = dao.mycalUpdate(vo);
	
	if(cnt !=0) {
		
		vo = dao.mycal(vo);
	}

	// 기초대사량 구하기 위한 회원건강정보셀렉
	
		double Dbasalmetabolism	= 0;
		
		System.out.println(guestNo);
		MyhealthVO mvo = new MyhealthVO();
		mvo = dao.myHealth(guestNo);
		int height = mvo.getHeight();
		int weight = mvo.getWeight();
		int age =  mvo.getAge();

		
		if(mvo.getGender()==1) {
			Dbasalmetabolism	= 655.1+(9.56*weight)+(1.85*height)-(4.68*age);
		}else if(mvo.getGender()==2) {
			Dbasalmetabolism	= 66.47+(13.75*weight)+(5*height)-(6.76*age);
					
		}
		
		int alertcnt=0;
		int encouragecal = (int) (Dbasalmetabolism*1.3);
		int basalmetabolism = (int)Dbasalmetabolism;
		
		if(todaycal>encouragecal) {
			alertcnt=1;
		}
	
		
		
		model.addAttribute("alertcnt",alertcnt);
		model.addAttribute("encouragecal",encouragecal);
		model.addAttribute("basalmetabolism",basalmetabolism);
		
		model.addAttribute("vo",vo);

	}
	@Override
	public void newfood(HttpServletRequest req, Model model) {
		
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  
		int guestNo = gvo.getGuestNo();
		String food = req.getParameter("food");
		int foodcal = Integer.parseInt(req.getParameter("foodcal"));
		int foodgram= Integer.parseInt(req.getParameter("foodgram"));
		
		
		FoodVO vo = new FoodVO();
		vo.setGuestNo(guestNo);
		vo.setFood(food);
		vo.setFoodcal(foodcal);
		vo.setFoodgram(foodgram);
		
		int foodcnt = dao.newfood(vo);
		System.out.println(food);
		System.out.println(foodcal);
		System.out.println(foodgram);


		
		
		
		model.addAttribute("foodcnt",foodcnt);
		
	
	}
	@Override
	public void myFoodList(HttpServletRequest req, Model model) {
	

		int pageSize = 10; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 보여질 페이지 수

		int cnt = 0; // 글 갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 화면에 출력할 출력용 글번호(실제DB의 번호와 달리 보여질 때 삭제된 행이있어도 순서대로 보여지도록~!)
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재페이지

		int pageCount = 0; // 페이지갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막페이지

		
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //해당 회원 guestNo구하기
		int guestNo = gvo.getGuestNo();
		
		
		cnt = dao.myFoodcnt(guestNo);
		System.out.println("cnt : " + cnt);

		pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 설정

		}
		// 글 30건을 기준
		currentPage = Integer.parseInt(pageNum); // 현재페이지 : 1
		System.out.println("currentPage :" + currentPage);

		// 글 갯수를 출력할 글 갯수로 나누는데
		// 나머지가 있을수 있으므로 나머지가 있으면 1페이지 추가하기위해 삼항연산자로 되묻는다.
		// 예) pageCount = (30/5)+(30 % 5 > 0 ? 1:0);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지

		// 1 =(1-1)*5+1;
		start = (currentPage - 1) * pageSize + 1; // 페이지별로 시작 글번호

		// 5 = 1 + 5 -1;
		end = start + pageSize - 1; // 페이지별로 마지막 글번호
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		// 30 = 30 - (1-1) * 5;
		number = cnt - (currentPage - 1) * pageSize; // 출력용 글번호
		System.out.println("number" + number);
		System.out.println("pageSize" + pageSize);
	
		if (cnt > 0) {
			// 게시글 목록 조회
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("guestNo", guestNo);
		
			ArrayList<FoodVO> dtos = new ArrayList<FoodVO>();
			 dtos = dao.myFoodList(map);
			 
			// jsp로 게시글 목록(= 큰 바구니) 넘긴다.
			model.addAttribute("dtos", dtos);
			
			
			
		}

		// 1 = (1/3)*3+1
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지

		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage:" + startPage);

		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage); // 마지막페이지

		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함.)

		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number); // 글 번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호

		if (cnt > 0) {
		
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지

		}
	
	
	
	
	}
	@Override
	public void bookMark(HttpServletRequest req, Model model) {
		
		int pageSize = 10; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 보여질 페이지 수

		int cnt = 0; // 글 갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 화면에 출력할 출력용 글번호(실제DB의 번호와 달리 보여질 때 삭제된 행이있어도 순서대로 보여지도록~!)
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재페이지

		int pageCount = 0; // 페이지갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막페이지

		
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //해당 회원 guestNo구하기
		int guestNo = gvo.getGuestNo();
		
		
		 String favoritehos = dao.bookMarkListcnt(guestNo);
		if(favoritehos!=null) {
		 String[] chk = favoritehos.split(",");
		 cnt = chk.length;
		}
		System.out.println("cnt : " + cnt);
	
		pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 설정

		}
		// 글 30건을 기준
		currentPage = Integer.parseInt(pageNum); // 현재페이지 : 1
		System.out.println("currentPage :" + currentPage);

		// 글 갯수를 출력할 글 갯수로 나누는데
		// 나머지가 있을수 있으므로 나머지가 있으면 1페이지 추가하기위해 삼항연산자로 되묻는다.
		// 예) pageCount = (30/5)+(30 % 5 > 0 ? 1:0);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지

		// 1 =(1-1)*5+1;
		start = (currentPage - 1) * pageSize + 1; // 페이지별로 시작 글번호

		// 5 = 1 + 5 -1;
		end = start + pageSize - 1; // 페이지별로 마지막 글번호
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		// 30 = 30 - (1-1) * 5;
		number = cnt - (currentPage - 1) * pageSize; // 출력용 글번호
		System.out.println("number" + number);
		System.out.println("pageSize" + pageSize);
	
		
		
		
		
		if (cnt > 0) {
			// 게시글 목록 조회
			
			ArrayList<HospitalVO> dtos = new ArrayList<HospitalVO>();
			 String[] chk = favoritehos.split(",");
			for(int i=0; i<chk.length; i++) {
				System.out.println(" chk[i]"+ chk[i]);
				String fd = chk[i].substring(1,3);
				System.out.println("fd?"+fd);
				int hospitalno = Integer.parseInt(fd);
				dtos.add(dao.hospitalInfo(hospitalno));
			}
			 
			
			model.addAttribute("dtos", dtos);
			
			
			
		}

		// 1 = (1/3)*3+1
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지

		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage:" + startPage);

		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage); // 마지막페이지

		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number); // 글 번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호

		if (cnt > 0) {
		
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지

		}
	
	
	
	
	

		
		
	}
	@Override
	public void exitOkPro(HttpServletRequest req, Model model) {
		String pwd= req.getParameter("password");
		String id = (String) req.getSession().getAttribute("id");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		int selectcnt = dao.exitOkPro(map);

		model.addAttribute("selectcnt",selectcnt);
	}
	@Override
	public void myFoodModi(HttpServletRequest req, Model model) {
		int foodno = Integer.parseInt(req.getParameter("foodno"));
		int foodcal = Integer.parseInt(req.getParameter("foodcal"));
		int foodgram = Integer.parseInt(req.getParameter("foodgram"));
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("foodno", foodno);
		map.put("foodcal", foodcal);
		map.put("foodgram", foodgram);
		
		
		System.out.println(foodno);
		System.out.println(foodcal);
		System.out.println(foodgram);

		
		
		int updatecnt = dao.myFoodModi(map);
		
		
		model.addAttribute("updatecnt",updatecnt);

	
	}
	@Override
	public void myFoodDelete(HttpServletRequest req, Model model) {

		int foodno = Integer.parseInt(req.getParameter("foodno"));
		int deletecnt = dao.myFoodDelete(foodno);
		
		System.out.println("deletecnt"+deletecnt);
		model.addAttribute("deletecnt",deletecnt);

	}
	@Override
	public void foodmodi(HttpServletRequest req, Model model) {
			int foodno = Integer.parseInt(req.getParameter("foodno"));
			FoodVO vo =  new FoodVO();
			vo = dao.foodmodi(foodno);
			
			model.addAttribute("vo",vo);
	
	
	}
	@Override
	public void guestcheckupResultList(HttpServletRequest req, Model model) {
		int pageSize = 5; //한 페이지당 출력할 글 갯수
		int pageBlock = 3; //한 블럭당 페이지 갯수
		
		int cnt=0;        // 글 갯수 30 db num 젤큰수  50 게시글 30개밖에20개지워지고
		int start = 0;     // 현재페이지 시작 글번호
		int end = 0;      // 현재페이지 마지막 글번호
		int number=0;     // 출력용 글번호 30
		String pageNum = null; // 페이지번호 
		int currentPage=0;  // 현재페이지
		
		int pageCnt=0; //페이지갯수
		int startPage=0; //현재블록 시작 페이지
		int endPage=0; // 현재블록   마지막 페이지
		
		
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //해당 회원 guestNo구하기
		int guestNo = gvo.getGuestNo();
		
		// 5단계. 글갯수 구하기
		cnt = dao.getCheckupResultListCnt(guestNo); 
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum==null) {
			pageNum="1";
		}
		
		//글 30건기준
		currentPage = Integer.parseInt(pageNum);
		
		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCnt= ( cnt / pageSize ) + ( cnt % pageSize > 0 ? 1 : 0 );
		
		// (1-1)*5 + 1
		start = (currentPage - 1) * pageSize + 1; // 현재 페이지의 시작번호 1
		
		// 5 = 1 + 5
		end = start + pageSize - 1; // 현재페이지의 마지막 번호 5
		
		// 30 = 30 - ( 1 - 1 ) * 5
		// 25 = 30 - ( 2 - 1 ) * 5  
		number = cnt - (currentPage -1)* pageSize; // 출력용 글번호
		
		ArrayList<CheckupVO> dtos = null;
		if(cnt > 0) {
			// 게시글 목록 조회 
			Map<String,Integer> map = new HashMap<String,Integer>();
			map.put("start", start);
			map.put("end", end);
			map.put("guestNo", guestNo);
			
			dtos = dao.getCheckupResultList(map);
			model.addAttribute("dtos", dtos);

			ArrayList<GuestVO> guestList = new ArrayList<GuestVO>();
			GuestVO gu = new GuestVO();
			for(int i=0 ; i<dtos.size() ;i++) {
				gu = dao.getcusInfo(dtos.get(i).getGuestNo()) ;
				guestList.add(gu);
			}
			
			model.addAttribute("guestList", guestList);
			
			
		}
		
		// 1 = (1 / 3) * 3 + 1
 		startPage =(currentPage / pageBlock) * pageBlock +1; // 시작페이지
 		if(currentPage % pageBlock == 0) {
 			startPage -= pageBlock; // 나머지 계산
 		}		 		
 		
 		// 3 = 1 + 3 - 1
 		endPage = startPage + pageBlock - 1; // 마지막 페이지
 		if(endPage > pageCnt) {
 			endPage = pageCnt;
 		}
		
		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if(cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}	
		
	}
	@Override
	public void guestexaminationList(HttpServletRequest req, Model model) {
		int pageSize = 5; //한 페이지당 출력할 글 갯수
		int pageBlock = 3; //한 블럭당 페이지 갯수
		int cnt=0;        // 글 갯수 30 db num 젤큰수  50 게시글 30개밖에20개지워지고
		int start = 0;     // 현재페이지 시작 글번호
		int end = 0;      // 현재페이지 마지막 글번호
		int number=0;     // 출력용 글번호 30
		String pageNum = null; // 페이지번호 
		int currentPage=0;  // 현재페이지
		
		int pageCnt=0; //페이지갯수
		int startPage=0; //현재블록 시작 페이지
		int endPage=0; // 현재블록   마지막 페이지
		
		

		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //해당 회원 guestNo구하기
		int guestNo = gvo.getGuestNo();
		
		// 5단계. 글갯수 구하기
		cnt = dao.examinationListCnt(guestNo); 
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum==null) {
			pageNum="1";
		}
		
		//글 30건기준
		currentPage = Integer.parseInt(pageNum);
		
		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCnt= ( cnt / pageSize ) + ( cnt % pageSize > 0 ? 1 : 0 );
		
		// (1-1)*5 + 1
		start = (currentPage - 1) * pageSize + 1; // 현재 페이지의 시작번호 1
		
		// 5 = 1 + 5
		end = start + pageSize - 1; // 현재페이지의 마지막 번호 5
		
		// 30 = 30 - ( 1 - 1 ) * 5
		// 25 = 30 - ( 2 - 1 ) * 5  
		number = cnt - (currentPage -1)* pageSize; // 출력용 글번호
		
		ArrayList<PrescriptionVO> dtos = null;
		if(cnt > 0) {
			// 게시글 목록 조회 
			Map<String,Integer> map = new HashMap<String,Integer>();
			map.put("start", start);
			map.put("end", end);
			map.put("guestNo", guestNo);
			
			dtos = dao.getExaminationList(map);
			model.addAttribute("dtos", dtos);
		
			ArrayList<GuestVO> guestList = new ArrayList<GuestVO>();
			GuestVO gu = new GuestVO();
			for(int i=0 ; i<dtos.size() ;i++) {
				gu = dao.getcusInfo(dtos.get(i).getGuestno()) ;
				guestList.add(gu);
			}
			
			model.addAttribute("guestList", guestList);
		}
		
		// 1 = (1 / 3) * 3 + 1
 		startPage =(currentPage / pageBlock) * pageBlock +1; // 시작페이지
 		if(currentPage % pageBlock == 0) {
 			startPage -= pageBlock; // 나머지 계산
 		}		 		
 		
 		// 3 = 1 + 3 - 1
 		endPage = startPage + pageBlock - 1; // 마지막 페이지
 		if(endPage > pageCnt) {
 			endPage = pageCnt;
 		}
		
		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if(cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}	

	}
	@Override
	public void checkupRegisterList(HttpServletRequest req, Model model) {
		

		

		int pageSize = 10; // 한 페이지당 출력할 글 갯수
		int pageBlock = 3; // 한 블럭당 보여질 페이지 수

		int cnt = 0; // 글 갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글번호
		int number = 0; // 화면에 출력할 출력용 글번호(실제DB의 번호와 달리 보여질 때 삭제된 행이있어도 순서대로 보여지도록~!)
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재페이지

		int pageCount = 0; // 페이지갯수
		int startPage = 0; // 시작페이지
		int endPage = 0; // 마지막페이지

		
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //해당 회원 guestNo구하기
		int guestNo = gvo.getGuestNo();
		
		
		
		
		cnt = dao.checkupRegistercnt(guestNo);
		System.out.println("cnt : " + cnt);

		pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1"; // 첫 페이지를 1페이지로 설정

		}
		// 글 30건을 기준
		currentPage = Integer.parseInt(pageNum); // 현재페이지 : 1
		System.out.println("currentPage :" + currentPage);

		// 글 갯수를 출력할 글 갯수로 나누는데
		// 나머지가 있을수 있으므로 나머지가 있으면 1페이지 추가하기위해 삼항연산자로 되묻는다.
		// 예) pageCount = (30/5)+(30 % 5 > 0 ? 1:0);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지 갯수 + 나머지

		// 1 =(1-1)*5+1;
		start = (currentPage - 1) * pageSize + 1; // 페이지별로 시작 글번호

		// 5 = 1 + 5 -1;
		end = start + pageSize - 1; // 페이지별로 마지막 글번호
		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		// 30 = 30 - (1-1) * 5;
		number = cnt - (currentPage - 1) * pageSize; // 출력용 글번호
		System.out.println("number" + number);
		System.out.println("pageSize" + pageSize);
	
		if (cnt > 0) {
			// 게시글 목록 조회
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("guestNo", guestNo);
		
			ArrayList<ExaminationVO> dtos = new ArrayList<ExaminationVO>();
			 dtos = dao.checkupRegisterList(map);
			 
			// jsp로 게시글 목록(= 큰 바구니) 넘긴다.
			model.addAttribute("dtos", dtos);
			
			
			
		}

		// 1 = (1/3)*3+1
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지

		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock;
		}
		System.out.println("startPage:" + startPage);

		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("endPage : " + endPage); // 마지막페이지

		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함.)

		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number); // 글 번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호

		if (cnt > 0) {
		
			model.addAttribute("startPage", startPage); // 시작페이지
			model.addAttribute("endPage", endPage); // 마지막페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재페이지

		}
	
	
		
	}
	@Override
	public void checkupRegisterclick(HttpServletRequest req, Model model) {
		int selectcnt = 0;
		int col = Integer.parseInt(req.getParameter("col"));
		ExaminationVO vo = new ExaminationVO();
		vo = dao.checkupRegisterclick(col);
		
	
		
		
		model.addAttribute("vo",vo);
	
		model.addAttribute("selectcnt",selectcnt);

		
	}
	@Override
	public void bookMarkIn(HttpServletRequest req, Model model) {
		String favoritehos ="";
		String id = (String) req.getSession().getAttribute("id");
		GuestVO gvo = dao.getGuestInfo(id);  //해당 회원 guestNo구하기
		int guestNo = gvo.getGuestNo();
		
		
		
		int cnt = dao.bookMarkcnt(guestNo); //즐겨찾기 여부
		String hospitalno =req.getParameter("hospitalno"); 
		String dbfavoritehos = dao.dbfavoritehos(guestNo); //이미 즐겨찾기된 병원 셀렉
	
		
		
		if(cnt!=0) {
			 favoritehos = "f"+hospitalno+"h";
			 
		}else if(cnt==0) {
			
			favoritehos = dbfavoritehos + ",f"+hospitalno+"h";
	
		}
		//이미 즐겨찾기한 병원인지 여부 조회
		String overlaphos = "f"+hospitalno+"h";
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("overlaphos", overlaphos);
		m.put("guestNo", guestNo);
		int overlap =dao.overlap(m);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("favoritehos", favoritehos);
		map.put("guestNo", guestNo);
		
	
		//즐겨찾기된 병원이 아닐때 즐겨찾는병원추가
		if(overlap==0) {
		dao.bookMarkIn(map);
		}
		System.out.println("overlap?"+overlap);
		
		model.addAttribute("overlap", overlap);
	}
	@Override
	public void checkdelete(HttpServletRequest req, Model model) {
		int col = Integer.parseInt(req.getParameter("col"));
		
		int deletecnt = dao.checkdelete(col);
		
		model.addAttribute("deletecnt",deletecnt);
				
				
	
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
