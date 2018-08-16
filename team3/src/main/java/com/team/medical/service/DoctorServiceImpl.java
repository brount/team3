package com.team.medical.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.lang.reflect.Field;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.medical.persitence.DoctorDAO;
import com.team.medical.vo.CheckupListVO;
import com.team.medical.vo.CheckupVO;
import com.team.medical.vo.CheckupresultVO;
import com.team.medical.vo.DoctorVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.HospitalVO;
import com.team.medical.vo.PointVO;
import com.team.medical.vo.PrescriptionVO;
import com.team.medical.vo.ReservationVO;

@Service
public class DoctorServiceImpl implements DoctorService {
	
	@Autowired
	DoctorDAO dao;
	
	// 닥터 로그인
	@Override
	public void doctorLogin(HttpServletRequest req, Model model) {
		String id =req.getParameter("id");
		String pwd = req.getParameter("pwd");
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		int loginCnt = dao.doctorLogin(map);
		if(loginCnt==1) {
			int logindAppro = dao.doctorappro(map);
			if(logindAppro==0) {
				req.getSession().setAttribute("memberState",0);
				model.addAttribute("logindAppro",logindAppro);
			}else if(logindAppro==2) {
				req.getSession().setAttribute("memberState",0);
				model.addAttribute("logindAppro",logindAppro);
			}else if(logindAppro==3) {
				DoctorVO vo =dao.getDocInfo(id);
				req.getSession().setAttribute("memberState",0);
				model.addAttribute("logindAppro",logindAppro);
				model.addAttribute("vo",vo);
				
			}else {
				req.getSession().setAttribute("id", id);
			}
			
			
		}else {
			req.getSession().setAttribute("memberState",0);
		}
		model.addAttribute("loginCnt",loginCnt);
		
		
	}
	
	// 아이디 중복 확인
	@Override
	public void confirmId(HttpServletRequest req, Model model) {
		String id = req.getParameter("id");
		int selectCnt = dao.idCheck(id);
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("id", id);
		
	}
	
	//회원 가입 처리
	@Override
	public String inputPro(MultipartHttpServletRequest req, Model model) {
		MultipartFile file = req.getFile("file");
        String saveDir = req.getRealPath("/resources/images/licence/");
        String realDir="C:\\team\\team3\\src\\main\\webapp\\resources\\images\\licence\\"; // 저장 경로
        int hospitalno = Integer.parseInt(req.getParameter("hospitalno"));
        try {
            file.transferTo(new File(saveDir+file.getOriginalFilename()));
            
            FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
            FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
            
            int data = 0;
            
            while((data = fis.read()) != -1) {
                fos.write(data);
            }
            fis.close();
            fos.close();
		
            
		String id = req.getParameter("id");
		String pwd = req.getParameter("confirmPassword");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		int specialism = Integer.parseInt(req.getParameter("specialism"));
		String doctorlicence = file.getOriginalFilename(); //추가
		
		
		DoctorVO vo = new DoctorVO();
		vo.setDoctorid(id);
		vo.setDoctorpwd(pwd);
		vo.setDoctorname(name);
		vo.setDoctorphone(phone);
		vo.setDoctoremail(email);
		vo.setDoctorspecialism(specialism);
		vo.setLicence(doctorlicence);
		vo.setDoctorregstration(new Date(System.currentTimeMillis()));
		vo.setHospitalno(hospitalno);
		int insertCnt = dao.insertMember(vo);
		model.addAttribute("insertCnt", insertCnt);
		
        } catch(IOException e) {
            e.printStackTrace();
        }
		return realDir;
        
    
	}

	@Override
	public void doctorModifyInfo(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("id");
		
		DoctorVO vo = dao.getDocInfo(id);
		model.addAttribute("vo",vo);
		
	}
	
	@Override
	public String modifyPro(MultipartHttpServletRequest req, Model model) {
		MultipartFile file = req.getFile("file");
        String saveDir = req.getRealPath("/resources/images/licence/");
        String realDir="C:\\team\\team3\\src\\main\\webapp\\resources\\images\\licence\\"; // 저장 경로
        DoctorVO vo = new DoctorVO();
        
        try {
           String image = req.getParameter("file");
         //  vo = dao.
        	if (req.getFile("file") != null) {
            	file.transferTo(new File(saveDir+file.getOriginalFilename()));
	            
	            FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
	            FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
	            
	            int data = 0;
	            
	            while((data = fis.read()) != -1) {
	                fos.write(data);
	            }
	            fis.close();
	            fos.close();
            	
        		
            }else {
        	
	        	
	            String id = (String)req.getSession().getAttribute("id");
            	//String doctorlicence= String.valueOf(dao.getDocLicence(id));
            	
            	//vo.setLicence(doctorlicence);
            }
		
		String id = (String)req.getSession().getAttribute("id");
		String pwd = req.getParameter("password");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		int specialism = Integer.parseInt(req.getParameter("specialism"));
		String doctorlicence = file.getOriginalFilename();
		
		
		vo.setDoctorid(id);
		vo.setDoctorpwd(pwd);
		vo.setDoctorname(name);
		vo.setDoctorphone(phone);
		vo.setDoctoremail(email);
		vo.setDoctorspecialism(specialism);
		vo.setLicence(doctorlicence);
		
		
		int updateCnt = dao.updateMemberInfo(vo);
		model.addAttribute("updateCnt", updateCnt);
		System.out.println("updateCnt" + updateCnt);
	
        } catch(IOException e) {
            e.printStackTrace();
        }
        
        
        
		return realDir;
	}

	@Override
	public void deletePro(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("id");
		
		int deleteCnt = dao.deleteMember(id);
		model.addAttribute("deleteCnt", deleteCnt);
		
	}

	@Override
   public String myHospitalUpdatePro(MultipartHttpServletRequest req, Model model) {
	 MultipartFile file = req.getFile("hospitalimage");
        String saveDir = req.getRealPath("/resources/images/licence/");
        String realDir="C:\\team\\team3\\src\\main\\webapp\\resources\\images\\licence\\"; // 저장 경로
         
        try {           
        	String id = (String)req.getSession().getAttribute("id");
        	String doctorno = "d"+String.valueOf(dao.getdocnoInfo(id))+"t";
           HospitalVO vo = dao.getMyhospitalInfo(doctorno);   
           
           if(req.getParameter("hospitalimage") != null) {
               file.transferTo(new File(saveDir+file.getOriginalFilename()));
               
               FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
               FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
               
               int data = 0;
               
               while((data = fis.read()) != -1) {
                   fos.write(data);
               }
               fis.close();
               fos.close();
               String hospitalimage = file.getOriginalFilename();
               vo.setHospitalimage(hospitalimage);
           }      
         
         String hospitalphone = req.getParameter("hospitalphone");
         String hospitalinstruction = req.getParameter("hospitalinstruction");
         
         vo.setHospitalphone(hospitalphone);
         vo.setHospitalinstruction(hospitalinstruction);            
         
         
         int intsertCnt = dao.updateHospital(vo);
         model.addAttribute("intsertCnt", intsertCnt);
         
        } catch(IOException e) {
            e.printStackTrace();
        }
      return realDir;
      
      
   }

   @Override
   public void myHospitalInfo(HttpServletRequest req, Model model) {
      String id = (String)req.getSession().getAttribute("id");
      String doctorno = "d"+String.valueOf(dao.getdocnoInfo(id))+"t";
      
      HospitalVO vo = dao.getMyhospitalInfo(doctorno); 
      
      System.out.println("vo : "+vo);
      model.addAttribute("vo", vo);
      
   }

	@Override
	public void docnoInfo(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("id");
		
		String doctorno = "d"+String.valueOf(dao.getdocnoInfo(id))+"t";
		
		HospitalVO dto = dao.getMyhospitalInfo(doctorno); 
		
		DoctorVO vo = dao.getDocInfo(id);
		model.addAttribute("vo",vo);
		model.addAttribute("dto",dto);
		
	}

	@Override
	public void checkupRequestInputPro(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("id");
		int doctorno = dao.getdocnoInfo(id);
		int guestno = Integer.parseInt(req.getParameter("guestno"));
		System.out.println("guestno" + guestno);
		
		CheckupListVO vo = new CheckupListVO();
		
		String doctorspecialism = req.getParameter("doctorspecialism");
		String doctorname = req.getParameter("doctorname");
		String hospitaladdr= req.getParameter("hospitaladdr");
		String hospitalname = req.getParameter("hospitalname");
		String hospitalphone = req.getParameter("hospitalphone");
		
		String checkup_kind = "";
		String[] kind = req.getParameterValues("checkup_kind");
		for(int i = 0 ; i<kind.length; i ++) {
			String a = (i==0) ? kind[i] : "," + kind[i];
			checkup_kind += a;
			
		}
		
		String checkup_name = req.getParameter("checkup_name");
		String checkup_opinion = req.getParameter("checkup_opinion");
		String checkup_contents = req.getParameter("checkup_contents");
		
		vo.setDoctorno(doctorno);
		vo.setCheckup_kind(checkup_kind);
		vo.setGuestNo(guestno);
		vo.setCheckup_name(checkup_name);
		vo.setCheckup_opinion(checkup_opinion);
		vo.setCheckup_contents(checkup_contents);
		vo.setCheckup_date(new Date(System.currentTimeMillis()));
		
		model.addAttribute("doctorspecialism",doctorspecialism);
		model.addAttribute("doctorname",doctorname);
		model.addAttribute("hospitaladdr",hospitaladdr);
		model.addAttribute("hospitalname",hospitalname);
		model.addAttribute("hospitalphone",hospitalphone);
		
		model.addAttribute("checkup_kind",checkup_kind);
		model.addAttribute("checkup_name",checkup_name);
		model.addAttribute("checkup_opinion",checkup_opinion);
		model.addAttribute("checkup_contents",checkup_contents);
		
		model.addAttribute("vo",vo);
		
		int insertCnt = dao.checkListInput(vo);
		CheckupVO cv = new CheckupVO();
		cv.setGuestNo(guestno);
		int checkuplist = dao.getCheckupListno();
		cv.setCheckuplist(checkuplist);
		System.out.println("checkuplist666" + checkuplist);
		dao.checkupAdd(cv);
		
		model.addAttribute("insertCnt",insertCnt);
	}

	@Override
	public void checkupList(HttpServletRequest req, Model model) {
		//게시판 관련
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
		
		// 5단계. 글갯수 구하기
		cnt = dao.getcheckupListCnt(1); 
		
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
		
		ArrayList<CheckupListVO> dtos = null;
		if(cnt > 0) {
			// 게시글 목록 조회 
			Map<String,Integer> map = new HashMap<String,Integer>();
			map.put("start", start);
			map.put("end", end);
			dtos = dao.CheckupList(map);
			model.addAttribute("dtos", dtos);
		
			
			ArrayList<DoctorVO> docList = new ArrayList<DoctorVO>();
			DoctorVO dv = new DoctorVO();
			for(int i=0 ; i<dtos.size() ;i++) {
				dv = dao.getDoctorInfo(dtos.get(i).getDoctorno()) ;
				docList.add(dv);
			}
			
			ArrayList<GuestVO> guestList = new ArrayList<GuestVO>();
			GuestVO gu = new GuestVO();
			for(int i=0 ; i<dtos.size() ;i++) {
				gu = dao.getcusInfo(dtos.get(i).getGuestNo()) ;
				guestList.add(gu);
			}
			
			
			model.addAttribute("docList", docList);
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
	public void getCheckupInfo(HttpServletRequest req, Model model) {

		int checkuplist = Integer.parseInt(req.getParameter("checkuplist"));

	    int docno = dao.checkupdoc(checkuplist);
	    int guestno = dao.getcusnoInfo(checkuplist);
	    
		DoctorVO docDto = dao.getDoctorInfo(docno);
		String doctorno = "d"+String.valueOf(docDto.getDoctorno())+"t";
		
		HospitalVO hosDto = dao.getMyhospitalInfo(doctorno); 
		GuestVO gusDto = dao.getcusInfo(guestno);
		CheckupListVO checkDto = dao.getCheckupInfo(checkuplist);
		
		String checkup_kind = checkDto.getCheckup_kind();
		
		if(req.getParameter("kind")!=null) {
			String kind = req.getParameter("kind");
			model.addAttribute("kind",kind);
			
		}
		
		
		model.addAttribute("checkup_kind",checkup_kind);
		
		model.addAttribute("docDto",docDto);
		model.addAttribute("hosDto",hosDto);
		model.addAttribute("gusDto",gusDto);
		model.addAttribute("checkDto",checkDto);
		
	}

	@Override
	public void checkupAddInputPro(HttpServletRequest req, Model model) {

		int doctorno = Integer.parseInt(req.getParameter("doctorno"));
		model.addAttribute("doctorno", doctorno);
		System.out.println("doctorno" + doctorno);
		
		int checkuplist = Integer.parseInt(req.getParameter("checkuplist"));
		int checkup = dao.getCheckupCheckupList(checkuplist);
		CheckupVO vo = dao.getCheckupResultInfo(checkup);
		if(req.getParameter("height")!= null) {
			String height = req.getParameter("height");
			vo.setHeight(height);
		}
		if(req.getParameter("weight")!= null) {
			String weight = req.getParameter("weight");
			vo.setWeight(weight);
		}
		if(req.getParameter("fatness")!= null) {
			String fatness = req.getParameter("fatness");
			vo.setFatness(fatness);
		}
		if(req.getParameter("visionl")!= null) {
			String visionl = req.getParameter("visionl");
			vo.setVisionl(visionl);
		}
		if(req.getParameter("visionr")!= null) {
			String visionr = req.getParameter("visionr");
			vo.setVisionr(visionr);
		}
		if(req.getParameter("hearingl")!= null) {
			String hearingl = req.getParameter("hearingl");
			vo.setHearingl(hearingl);
		}
		if(req.getParameter("hearingr")!= null) {
			String hearingr = req.getParameter("hearingr");
			vo.setHearingr(hearingr);
		}
		if(req.getParameter("bloodpremax")!= null) {
			String bloodpremax = req.getParameter("bloodpremax");
			vo.setBloodpremax(bloodpremax);
		}
		if(req.getParameter("bloodpremin")!= null) {
			String bloodpremin = req.getParameter("bloodpremin");
			vo.setBloodpremin(bloodpremin);
		}
		if(req.getParameter("urineglucose")!= null) {
			String urineglucose = req.getParameter("urineglucose");
			vo.setUrineglucose(urineglucose);
		}
		if(req.getParameter("urineprotein")!= null) {
			String urineprotein = req.getParameter("urineprotein");
			vo.setUrineprotein(urineprotein);
		}
		if(req.getParameter("occulthematuria")!= null) {
			String occulthematuria = req.getParameter("occulthematuria");
			vo.setOcculthematuria(occulthematuria);
		}
		if(req.getParameter("urineph")!= null) {
			String urineph = req.getParameter("urineph");
			vo.setUrineph(urineph);
		}
		if(req.getParameter("hemoglobin")!= null) {
			String hemoglobin = req.getParameter("hemoglobin");
			vo.setHemoglobin(hemoglobin);
		}
		if(req.getParameter("bloodglucose")!= null) {
			String bloodglucose = req.getParameter("bloodglucose");
			vo.setBloodglucose(bloodglucose);
		}
		if(req.getParameter("totalcholesterol")!= null) {
			String totalcholesterol = req.getParameter("totalcholesterol");
			vo.setTotalcholesterol(totalcholesterol);
		}
		if(req.getParameter("ast")!= null) {
			String ast = req.getParameter("ast");
			vo.setAst(ast);
		}
		if(req.getParameter("alt")!= null) {
			String alt = req.getParameter("alt");
			vo.setAlt(alt);
		}
		if(req.getParameter("gammagtp")!= null) {
			String gammagtp = req.getParameter("gammagtp");
			vo.setGammagtp(gammagtp);
		}
		if(req.getParameter("hepatitisscr")!= null) {
			String hepatitisscr = req.getParameter("hepatitisscr");
			vo.setHepatitisscr(hepatitisscr);
		}
		if(req.getParameter("breastradiography")!= null) {
			String breastradiography = req.getParameter("breastradiography");
			vo.setBreastradiography(breastradiography);
		}
		if(req.getParameter("ecg")!= null) {
			String ecg = req.getParameter("ecg");
			vo.setEcg(ecg);
		}
		vo.setCheckup_date(new Date(System.currentTimeMillis()));
		
		int insertCnt = dao.checkupUpdate(vo);
		
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("checkuplist", checkuplist);
	}

	@Override
	public void checkupResultList(HttpServletRequest req, Model model) {
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
		
		// 5단계. 글갯수 구하기
		cnt = dao.getCheckupResultListCnt(1); 
		
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
	   public void checkupResult(HttpServletRequest req, Model model) {
	      int checkup = Integer.parseInt(req.getParameter("checkup"));
	      model.addAttribute("checkup", checkup);
	        
	        int guestno = dao.getGuestCheckupResult(checkup);
	        
	        CheckupVO CheckDto = dao.getCheckupResultInfo(checkup);
	        GuestVO gusDto = dao.getcusInfo(guestno);
	        // 비교용
	        ArrayList<CheckupresultVO> dtos = dao.checkupresult();
	        // 출력용
	        ArrayList<CheckupresultVO> dtos2 = new ArrayList<CheckupresultVO>();
	        
	        try{
	            Object obj=CheckDto;
	            for (Field field : obj.getClass().getDeclaredFields()){
	                field.setAccessible(true);
	                Object value=field.get(obj);
	                for(int i =0; i<dtos.size();i++) {
	                   if(field.getName().equals("bloodpremax")) {
	                      if(value != null) {
	                         if(dtos.get(i).getHead().equals("bloodpremax")) {                              
	                             if(Integer.parseInt(dtos.get(i).getValue()) < Integer.parseInt((value.toString()))) {
	                                if(dtos.get(i).getState() == 1) {
	                                     dtos2.add(dtos.get(i));
	                                     System.out.println(value+"1"+dtos.get(i).getContent());
	                                     break;
	                                  }
	                              }    
	                             else if(Integer.parseInt(dtos.get(i).getValue()) > Integer.parseInt((value.toString()))) {
	                                if(dtos.get(i).getState() == 2) {
	                                    dtos2.add(dtos.get(i));
	                                    System.out.println(value+"2"+dtos.get(i).getContent());
	                                    break;
	                                 }
	                             }  
	                           }
	                      }                      
	                   }else if(field.getName().equals("bloodpremin")) {
	                      if(value != null) {
	                         if(dtos.get(i).getHead().equals("bloodpremin")) {
	                            if(Integer.parseInt(dtos.get(i).getValue()) < Integer.parseInt((value.toString()))) {
	                                if(dtos.get(i).getState() == 1) {
	                                     dtos2.add(dtos.get(i));
	                                     System.out.println(value+"1"+dtos.get(i).getContent());
	                                     break;
	                                  }
	                              }    
	                             else if(Integer.parseInt(dtos.get(i).getValue()) > Integer.parseInt((value.toString()))) {
	                                if(dtos.get(i).getState() == 2) {
	                                    dtos2.add(dtos.get(i));
	                                    System.out.println(value+"2"+dtos.get(i).getContent());
	                                    break;
	                                 }
	                             }                  
	                          }
	                      }
	                   }else if(field.getName().equals("urineglucose")) {
	                      if(value != null) {
	                         if(dtos.get(i).getHead().equals("urineglucose")) {                         
	                            if((value.toString()).equals("양성")) {
	                                dtos2.add(dtos.get(i));
	                                System.out.println(value+"3"+dtos.get(i).getContent());
	                                break;
	                             }        
	                          }
	                      }
	                   }else if(field.getName().equals("urineprotein")) {
	                      if(value != null) {
	                         if(dtos.get(i).getHead().equals("urineprotein")) {                         
	                            if((value.toString()).equals("양성")) {
	                                dtos2.add(dtos.get(i));
	                                System.out.println(value+"4"+dtos.get(i).getContent());
	                                break;
	                             }        
	                          }
	                      }
	                   }else if(field.getName().equals("occulthematuria")) {
	                      if(value != null) {
	                         if(dtos.get(i).getHead().equals("occulthematuria")) {                         
	                            if((value.toString()).equals("양성")) {
	                                dtos2.add(dtos.get(i));
	                                System.out.println(value+"5"+dtos.get(i).getContent());
	                                break;
	                             }        
	                          }
	                      }
	                   }else if(field.getName().equals("urineph")) {
	                      if(value != null) {
	                         if(dtos.get(i).getHead().equals("urineph")) {   
	                            if(Integer.parseInt(dtos.get(i).getValue()) < Integer.parseInt((value.toString()))) {
	                               if(dtos.get(i).getState() == 1) {
	                                    dtos2.add(dtos.get(i));
	                                    System.out.println(value+"6"+dtos.get(i).getContent());
	                                    break;
	                                 }
	                             }    
	                            else if(Integer.parseInt(dtos.get(i).getValue()) > Integer.parseInt((value.toString()))) {
	                               if(dtos.get(i).getState() == 2) {
	                                    dtos2.add(dtos.get(i));
	                                    System.out.println(value+"7"+dtos.get(i).getContent());
	                                    break;
	                                 }
	                             }      
	                         }
	                      }
	                   }else if(field.getName().equals("hemoglobin")) {
	                      if(value != null) {
	                         if(dtos.get(i).getHead().equals("hemoglobin")) {   
	                            if(Integer.parseInt(dtos.get(i).getValue()) < Integer.parseInt((value.toString()))) {
	                               if(dtos.get(i).getState() == 1) {
	                                    dtos2.add(dtos.get(i));
	                                    System.out.println(value+"8"+dtos.get(i).getContent());
	                                    break;
	                                 }
	                             }    
	                            else if(Integer.parseInt(dtos.get(i).getValue()) > Integer.parseInt((value.toString()))) {
	                               if(dtos.get(i).getState() == 2) {
	                                    dtos2.add(dtos.get(i));
	                                    System.out.println(value+"9"+dtos.get(i).getContent());
	                                    break;
	                                 }
	                             }   
	                         }
	                      }
	                   }else if(field.getName().equals("bloodglucose")) {
	                      if(value != null) {
	                         if(dtos.get(i).getHead().equals("bloodglucose")) {  
	                           if(Integer.parseInt(dtos.get(i).getValue()) > Integer.parseInt((value.toString()))) {
	                               dtos2.add(dtos.get(i));
	                               System.out.println(value+"10"+dtos.get(i).getContent());
	                               break;
	                            }
	                         }
	                      }
	                   }else if(field.getName().equals("totalcholesterol")) {
	                      if(value != null) {
	                         if(dtos.get(i).getHead().equals("totalcholesterol")) {  
	                            if(Integer.parseInt(dtos.get(i).getValue()) < Integer.parseInt((value.toString()))) {
	                               if(dtos.get(i).getState() == 1) {
	                                    dtos2.add(dtos.get(i));
	                                    System.out.println(value+"11"+dtos.get(i).getContent());
	                                    break;
	                                 }
	                             }    
	                            else if(Integer.parseInt(dtos.get(i).getValue()) > Integer.parseInt((value.toString()))) {
	                               if(dtos.get(i).getState() == 2) {
	                                    dtos2.add(dtos.get(i));
	                                    System.out.println(value+"12"+dtos.get(i).getContent());
	                                    break;
	                                 }
	                             }  
	                         }
	                      }
	                   }else if(field.getName().equals("ast")) {
	                      if(value != null) {
	                         if(dtos.get(i).getHead().equals("ast")) {                         
	                            if((value.toString()).equals("양성")) {
	                                dtos2.add(dtos.get(i));
	                                System.out.println(value+"13"+dtos.get(i).getContent());
	                                break;
	                             }        
	                          }
	                      }
	                   }else if(field.getName().equals("alt")) {
	                      if(value != null) {
	                         if(dtos.get(i).getHead().equals("alt")) {                         
	                            if((value.toString()).equals("양성")) {
	                                dtos2.add(dtos.get(i));
	                                System.out.println(value+"14"+dtos.get(i).getContent());
	                                break;
	                             }        
	                          }
	                      }
	                   }else if(field.getName().equals("gammagtp")) {
	                      if(value != null) {
	                         if(dtos.get(i).getHead().equals("gammagtp")) {                         
	                            if((value.toString()).equals("양성")) {
	                                dtos2.add(dtos.get(i));
	                                System.out.println(value+"15"+dtos.get(i).getContent());
	                                break;
	                             }        
	                          }
	                      }
	                   }              
	                   
	                }                
	            }
	            model.addAttribute("dtos2",dtos2);
	        }catch (Exception e){
	            e.printStackTrace();
	        }


	        
	        model.addAttribute("gusDto",gusDto);
	        model.addAttribute("CheckDto",CheckDto);
	        
	   }

	@Override
	public void examinationInputPro(HttpServletRequest req, Model model) {
		 
		int checkup = Integer.parseInt(req.getParameter("checkup"));
		int guestno = dao.getGuestCheckupResult(checkup);
		String id = (String)req.getSession().getAttribute("id");
		System.out.println("id : "+ id);
		int doctorno = dao.getdocnoInfo(id);
		
		DoctorVO docDto = dao.getDoctorInfo(doctorno);
		String doctorno2 = "d"+String.valueOf(docDto.getDoctorno())+"t";
		int hospitalno = dao.getHospitalnoDocno(doctorno2);
		
		String symptom = req.getParameter("symptom");
		String drugname  = "";
		String[] drugname1  = req.getParameterValues("drugname1");
		for(int i = 0 ; i<drugname1.length; i ++) {
			String a = (i==0) ? drugname1[i] : "," + drugname1[i];
			drugname += a;
		}
		String drugdosage = "";
		String[] drugdosage1  = req.getParameterValues("drugdosage1");
		for(int i = 0 ; i<drugdosage1.length; i ++) {
			String a = (i==0) ? drugdosage1[i] : "," + drugdosage1[i];
			drugdosage += a;
		}
		String drugrepeat = ""; 
		String[] drugrepeat1 = req.getParameterValues("drugrepeat1");
		for(int i = 0 ; i<drugrepeat1.length; i ++) {
			String a = (i==0) ? drugrepeat1[i] : "," + drugrepeat1[i];
			drugrepeat += a;
		}
		String dosagedate = "";
		String[] dosagedate1 = req.getParameterValues("dosagedate1");
		for(int i = 0 ; i<dosagedate1.length; i ++) {
			String a = (i==0) ? dosagedate1[i] : "," + dosagedate1[i];
			dosagedate += a;
		}
		String dosageusage = "";
		String[] dosageusage1 = req.getParameterValues("dosageusage1");
		for(int i = 0 ; i<dosageusage1.length; i ++) {
			String a = (i==0) ? dosageusage1[i] : "," + dosageusage1[i];
			dosageusage += a;
		}
		String injectionname = "";
		String[] injectionname1 = req.getParameterValues("injectionname1");
		for(int i = 0 ; i<injectionname1.length; i ++) {
			String a = (i==0) ? injectionname1[i] : "," + injectionname1[i];
			injectionname += a;
		}
		String injectiondosage = "";
		String[] injectiondosage1 = req.getParameterValues("injectiondosage1");
		for(int i = 0 ; i<injectiondosage1.length; i ++) {
			String a = (i==0) ? injectiondosage1[i] : "," + injectiondosage1[i];
			injectiondosage += a;
		}
		String injectionrepeat = "";
		String[] injectionrepeat1 = req.getParameterValues("injectionrepeat1");
		for(int i = 0 ; i<injectionrepeat1.length; i ++) {
			String a = (i==0) ? injectionrepeat1[i] : "," + injectionrepeat1[i];
			injectionrepeat += a;
		}
		String injectiondate = "";
		String[] injectiondate1 = req.getParameterValues("injectiondate1");
		for(int i = 0 ; i<injectiondate1.length; i ++) {
			String a = (i==0) ? injectiondate1[i] : "," + injectiondate1[i];
			injectiondate += a;
		}
		String caution = req.getParameter("caution");

		PrescriptionVO vo = new PrescriptionVO();
		
		vo.setHospitalno(hospitalno);
		vo.setGuestno(guestno);
		vo.setSymptom(symptom);
		vo.setDrugname(drugname);
		vo.setDrugdosage(drugdosage);
		vo.setDrugrepeat(drugrepeat);
		vo.setDosagedate(dosagedate);
		vo.setDosageusage(dosageusage);
		vo.setInjectionname(injectionname);
		vo.setInjectiondosage(injectiondosage);
		vo.setInjectionrepeat(injectionrepeat);
		vo.setInjectiondate(injectiondate);
		
		vo.setPrescriptionDate(new Date(System.currentTimeMillis()));
		vo.setCaution(caution);
		
		int insertCnt = dao.examinationAdd(vo);
		
		model.addAttribute("insertCnt", insertCnt);
		
		
		
	}

	@Override
	public void examinationList(HttpServletRequest req, Model model) {
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
		
		// 5단계. 글갯수 구하기
		cnt = dao.examinationListCnt(1); 
		
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
	public void examinationInfo(HttpServletRequest req, Model model) {
		
		int prescriptionNo = Integer.parseInt(req.getParameter("prescriptionNo"));
		int guestno = dao.getPrescriptionNoGuestno(prescriptionNo);
		String id = (String)req.getSession().getAttribute("id");
		int doctorno = dao.getdocnoInfo(id);
		DoctorVO docDto = dao.getDoctorInfo(doctorno);
		String doctorno2 = "d"+String.valueOf(docDto.getDoctorno())+"t";
		HospitalVO hosDto = dao.getMyhospitalInfo(doctorno2); 
		PrescriptionVO preDto = dao.getPrescription(prescriptionNo);
		GuestVO gusDto = dao.getcusInfo(guestno);
		
		String drugname = preDto.getDrugname();
		
		String[] drugname1 = drugname.split(",");
		
		String drugdosage = preDto.getDrugdosage();
		String[] drugdosage1 = drugdosage.split(",");

		String drugrepeat = preDto.getDrugrepeat();
		String[] drugrepeat1 = drugrepeat.split(",");
		
		String dosagedate = preDto.getDosagedate();
		String[] dosagedate1 = dosagedate.split(",");

		String dosageusage = preDto.getDosageusage();
		String[] dosageusage1 = dosageusage.split(",");

		String injectionname = preDto.getInjectionname();
		if(injectionname==null) {
			String injectionname1 ="";
			model.addAttribute("injectionname1", injectionname1);
		}else {
			String[] injectionname1 = injectionname.split(",");
			model.addAttribute("injectionname1", injectionname1);
		}
		
		

		String injectiondosage = preDto.getInjectiondosage();
		if(injectiondosage==null) {
			String injectiondosage1="";
			model.addAttribute("injectiondosage1", injectiondosage1);
		}else {
			String[] injectiondosage1 = injectiondosage.split(",");
			model.addAttribute("injectiondosage1", injectiondosage1);
		}
		
		String injectionrepeat = preDto.getInjectionrepeat();
		if(injectionrepeat==null) {
			String injectionrepeat1 = "";
			model.addAttribute("injectionrepeat1", injectionrepeat1);
		}else {
			String[] injectionrepeat1 = injectionrepeat.split(",");
			model.addAttribute("injectionrepeat1", injectionrepeat1);
		}
		
		String injectiondate = preDto.getInjectiondate();
		if(injectiondate==null) {
			String injectiondate1 = "";
			model.addAttribute("injectiondate1", injectiondate1);
		}else {
			String[] injectiondate1 = injectiondate.split(",");
			model.addAttribute("injectiondate1", injectiondate1);
		}
		

		
		
		model.addAttribute("drugname1", drugname1);
		model.addAttribute("drugdosage1", drugdosage1);
		model.addAttribute("drugrepeat1", drugrepeat1);
		model.addAttribute("dosagedate1", dosagedate1);
		model.addAttribute("dosageusage1", dosageusage1);
		//model.addAttribute("injectionname1", injectionname1);
		//model.addAttribute("injectiondosage1", injectiondosage1);
		//
		//model.addAttribute("injectiondate1", injectiondate1);
		model.addAttribute("docDto", docDto);
		model.addAttribute("hosDto", hosDto);
		model.addAttribute("preDto", preDto);
		model.addAttribute("gusDto", gusDto);
		System.out.println("preDto" + preDto);
		
	}

	@Override
	public void patientList(HttpServletRequest req, Model model) {
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
		
		// 5단계. 글갯수 구하기
		cnt = dao.getPatientListCnt(1); 
		
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
		
		ArrayList<ReservationVO> dtos = null;
		if(cnt > 0) {
			// 게시글 목록 조회 
			Map<String,Integer> map = new HashMap<String,Integer>();
			map.put("start", start);
			map.put("end", end);
			dtos = dao.getpatientList(map);
			model.addAttribute("dtos", dtos);
		
			ArrayList<GuestVO> guestList = new ArrayList<GuestVO>();
			GuestVO gu = new GuestVO();
			for(int i=0 ; i<dtos.size() ;i++) {
				gu = dao.getcusInfo(dtos.get(i).getGuestNo()) ;
				guestList.add(gu);
			}
			
			ArrayList<HospitalVO> hospitalList = new ArrayList<HospitalVO>();
			HospitalVO hos = new HospitalVO();
			for(int i=0 ; i<dtos.size() ;i++) {
				hos = dao.getHospitalNoInfo(dtos.get(i).getHospitalno()) ;
				hospitalList.add(hos);
			}
			
			model.addAttribute("guestList", guestList);
			model.addAttribute("hospitalList", hospitalList);
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

	// 예약 상세 페이지
	@Override
	public void patientInfo(HttpServletRequest req, Model model) {
		
		int reservationNo = Integer.parseInt(req.getParameter("reservationNo"));
		
		int guestno = dao.reservationNoguestno(reservationNo);
		GuestVO gusDto = dao.getcusInfo(guestno);
		ReservationVO ReservDto = dao.reservationInfo(reservationNo);
		
		
		model.addAttribute("gusDto", gusDto);
		model.addAttribute("ReservDto", ReservDto);
		model.addAttribute("guestno", guestno);
		
		
		
	}

	@Override
	public void examinationAdd(HttpServletRequest req, Model model) {
		int checkup = Integer.parseInt(req.getParameter("checkup"));
		System.out.println("checkup" + checkup);
		model.addAttribute("checkup", checkup);
        int guestno = dao.getGuestCheckupResult(checkup);
        System.out.println("guestno : " + guestno);
        int checkuplist = dao.getCheckupListCheckup(checkup);//65
        System.out.println("guestno" + guestno);
        GuestVO gusDto = dao.getcusInfo(guestno);
        String doctorno = "d"+String.valueOf(dao.checkupdoc(checkuplist))+"t";
        System.out.println("doctorno"+ doctorno);
        HospitalVO hosDto = dao.getMyhospitalInfo(doctorno);
       System.out.println("hosDto" + hosDto);
        
        model.addAttribute("gusDto",gusDto);
        model.addAttribute("hosDto",hosDto);
		
	}

	@Override
	public void pointManage(HttpServletRequest req, Model model) {
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
		
		// 5단계. 글갯수 구하기
		cnt = dao.getPointManageCnt();
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum==null) {
			pageNum="1";
		}
		
		currentPage = Integer.parseInt(pageNum);
		
		pageCnt= ( cnt / pageSize ) + ( cnt % pageSize > 0 ? 1 : 0 );
		
		start = (currentPage - 1) * pageSize + 1; 
		
		end = start + pageSize - 1;
		
		number = cnt - (currentPage -1)* pageSize; 
		
		ArrayList<PointVO> dtos = null;
		if(cnt > 0) {
			Map<String,Integer> map = new HashMap<String,Integer>();
			map.put("start", start);
			map.put("end", end);
			dtos = dao.getPointManageList(map);
			model.addAttribute("dtos", dtos);
		
			/*ArrayList<GuestVO> guestList = new ArrayList<GuestVO>();
			GuestVO gu = new GuestVO();
			for(int i=0 ; i<dtos.size() ;i++) {
				gu = dao.getcusInfo(dtos.get(i).getGuestno()) ;
				guestList.add(gu);
			}*/
			
			//model.addAttribute("guestList", guestList);
		}
		System.out.println("dtos : " + dtos);
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
 		
 		String id = (String)req.getSession().getAttribute("id");
		DoctorVO docDto = dao.getDocInfo(id);
		
		model.addAttribute("docDto", docDto); // 글갯수
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
	public void myHospitalUpdate(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("id");
		String doctorno = "d"+String.valueOf(dao.getdocnoInfo(id))+"t";
		HospitalVO hosDto = dao.getMyhospitalInfo(doctorno);
		
		model.addAttribute("hosDto", hosDto);
		
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

	
	
	

	
}

