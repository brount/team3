package com.team.medical.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.medical.persitence.DoctorDAO;
import com.team.medical.vo.CheckupListVO;
import com.team.medical.vo.CheckupVO;
import com.team.medical.vo.DoctorVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.HospitalVO;
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
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pwd", pwd);
		
		int loginCnt = dao.doctorLogin(map);
		
		if(loginCnt==1) {
			req.getSession().setAttribute("id", id);
		} else {
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
		String id = (String) req.getSession().getAttribute("id");
		
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
			System.out.println("a : " + a);
			checkup_kind += a;
			
		}
		System.out.println("checkup_kind : " + checkup_kind);
		
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
		System.out.println("checkup" + checkup);
		model.addAttribute("checkup", checkup);
        
        int guestno = dao.getGuestCheckupResult(checkup);
        //int CheckupList = dao.getCheckupListGuestno(guestno);
        System.out.println("guestno" + guestno);
        CheckupVO CheckDto = dao.getCheckupResultInfo(checkup);
        GuestVO gusDto = dao.getcusInfo(guestno);
        //String doctorno = String.valueOf(dao.doctornoGuestno(CheckupList));//
       // HospitalVO hosDto = dao.getMyhospitalInfo(doctorno);
       
        //DoctorVO docDto = dao.getDoctorInfo(Integer.parseInt(doctorno));
        
        model.addAttribute("gusDto",gusDto);
        model.addAttribute("CheckDto",CheckDto);
       // model.addAttribute("hosDto",hosDto);
       // model.addAttribute("docDto",docDto);
        
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
		System.out.println("hospitalno");
		
		String symptom = req.getParameter("symptom");
		String drugname  = "";
		String drugname1  = req.getParameter("drugname1");
		String drugname2  = req.getParameter("drugname2");
		String drugname3  = req.getParameter("drugname3");
		String drugname4  = req.getParameter("drugname4");
		String drugname5  = req.getParameter("drugname5");
		String drugdosage = "";
		String drugdosage1  = req.getParameter("drugdosage1");
		String drugdosage2  = req.getParameter("drugdosage2");
		String drugdosage3  = req.getParameter("drugdosage3");
		String drugdosage4  = req.getParameter("drugdosage4");
		String drugdosage5  = req.getParameter("drugdosage5");
		String drugrepeat = ""; 
		String drugrepeat1 = req.getParameter("drugrepeat1");
		String drugrepeat2 = req.getParameter("drugrepeat2");
		String drugrepeat3 = req.getParameter("drugrepeat3");
		String drugrepeat4 = req.getParameter("drugrepeat4");
		String drugrepeat5 = req.getParameter("drugrepeat5");
		String dosagedate = "";
		String dosagedate1 = req.getParameter("dosagedate1");
		String dosagedate2 = req.getParameter("dosagedate2");
		String dosagedate3 = req.getParameter("dosagedate3");
		String dosagedate4 = req.getParameter("dosagedate4");
		String dosagedate5 = req.getParameter("dosagedate5");
		String dosageusage = "";
		String dosageusage1 = req.getParameter("dosageusage1");
		String dosageusage2 = req.getParameter("dosageusage2");
		String dosageusage3 = req.getParameter("dosageusage3");
		String dosageusage4 = req.getParameter("dosageusage4");
		String dosageusage5 = req.getParameter("dosageusage5");
		String injectionname = "";
		String injectionname1 = req.getParameter("injectionname1");
		String injectionname2 = req.getParameter("injectionname2");
		String injectionname3 = req.getParameter("injectionname3");
		String injectiondosage = "";
		String injectiondosage1 = req.getParameter("injectiondosage1");
		String injectiondosage2 = req.getParameter("injectiondosage2");
		String injectiondosage3 = req.getParameter("injectiondosage3");
		String injectionrepeat = "";
		String injectionrepeat1 = req.getParameter("injectionrepeat1");
		String injectionrepeat2 = req.getParameter("injectionrepeat2");
		String injectionrepeat3 = req.getParameter("injectionrepeat3");
		String injectiondate = "";
		String injectiondate1 = req.getParameter("injectiondate1");
		String injectiondate2 = req.getParameter("injectiondate2");
		String injectiondate3 = req.getParameter("injectiondate3");
		
		String caution = req.getParameter("caution");
		
		
		PrescriptionVO vo = new PrescriptionVO();
		
		vo.setHospitalno(hospitalno);
		vo.setGuestno(guestno);
		vo.setSymptom(symptom);
		if (!drugname1.equals("") || !drugname2.equals("") || !drugname3.equals("") || !drugname4.equals("") || !drugname5.equals("")){
			drugname = drugname1 + ", " + drugname2 + ", " + drugname3 + ", " + drugname4 + ", " + drugname5;
		}
		vo.setDrugname(drugname);

		if (!drugdosage1.equals("") || !drugdosage2.equals("") || !drugdosage3.equals("") || !drugdosage4.equals("") || !drugdosage5.equals("")){
			drugdosage = drugdosage1 + ", " + drugdosage2 + ", " + drugdosage3 + ", " + drugdosage4 + ", " + drugdosage5;
		}
		vo.setDrugdosage(drugdosage);
		
		if (!drugrepeat1.equals("") || !drugrepeat2.equals("") || !drugrepeat3.equals("") || !drugrepeat4.equals("") || !drugrepeat5.equals("")){
			drugrepeat = drugrepeat1 + ", " + drugrepeat2 + ", " + drugrepeat3 + ", " + drugrepeat4 + ", " + drugrepeat5;
		}
		vo.setDrugrepeat(drugrepeat);
		
		if (!dosagedate1.equals("") || !dosagedate2.equals("") || !dosagedate3.equals("") || !dosagedate4.equals("") || !dosagedate5.equals("")){
			dosagedate = dosagedate1 + ", " + dosagedate2 + ", " + dosagedate3 + ", " + dosagedate4 + ", " + dosagedate5;
		}
		vo.setDosagedate(dosagedate);
		
		if (!dosageusage1.equals("") || !dosageusage2.equals("") || !dosageusage3.equals("") || !dosageusage4.equals("") || !dosageusage5.equals("")){
			dosageusage = dosageusage1 + ", " + dosageusage2 + ", " + dosageusage3 + ", " + dosageusage4 + ", " + dosageusage5;
		}
		vo.setDosageusage(dosageusage);
		
		if (!injectionname1.equals("") || !injectionname2.equals("") || !injectionname3.equals("") ){
			injectionname = injectionname1 + ", " + injectionname2 + ", " + injectionname3;
		}
		vo.setInjectionname(injectionname);
		
		if (!injectiondosage1.equals("") || !injectiondosage2.equals("") || !injectiondosage3.equals("") ){
			injectiondosage = injectiondosage1 + ", " + injectiondosage2 + ", " + injectiondosage3;
		}
		vo.setInjectiondosage(injectiondosage);
		
		if (!injectionrepeat1.equals("") || !injectionrepeat2.equals("") || !injectionrepeat3.equals("") ){
			injectionrepeat = injectionrepeat1 + ", " + injectionrepeat2 + ", " + injectionrepeat3;
		}
		vo.setInjectionrepeat(injectionrepeat);
		
		if (!injectiondate1.equals("") || !injectiondate2.equals("") || !injectiondate3.equals("") ){
			injectiondate = injectiondate1 + ", " + injectiondate2 + ", " + injectiondate3;
		}
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
		String drugname1 = drugname.split(", ")[0];
		String drugname2 = drugname.split(", ")[1];
		String drugname3 = drugname.split(", ")[2];
		String drugname4 = drugname.split(", ")[3];
		String drugname5 = drugname.split(", ")[4];
		
		String drugdosage = preDto.getDrugdosage();
		String drugdosage1 = drugdosage.split(", ")[0];
		String drugdosage2 = drugdosage.split(", ")[1];
		String drugdosage3 = drugdosage.split(", ")[2];
		String drugdosage4 = drugdosage.split(", ")[3];
		String drugdosage5 = drugdosage.split(", ")[4];
		
		
		String drugrepeat = preDto.getDrugrepeat();
		String drugrepeat1 = drugrepeat.split(", ")[0];
		String drugrepeat2 = drugrepeat.split(", ")[1];
		String drugrepeat3 = drugrepeat.split(", ")[2];
		String drugrepeat4 = drugrepeat.split(", ")[3];
		String drugrepeat5 = drugrepeat.split(", ")[4];
		String dosagedate = preDto.getDosagedate();
		String dosagedate1 = dosagedate.split(", ")[0];
		String dosagedate2 = dosagedate.split(", ")[1];
		String dosagedate3 = dosagedate.split(", ")[2];
		String dosagedate4 = dosagedate.split(", ")[3];
		String dosagedate5 = dosagedate.split(", ")[4];
		String dosageusage = preDto.getDosageusage();
		String dosageusage1 = dosageusage.split(", ")[0];
		String dosageusage2 = dosageusage.split(", ")[1];
		String dosageusage3 = dosageusage.split(", ")[2];
		String dosageusage4 = dosageusage.split(", ")[3];
		String dosageusage5 = dosageusage.split(", ")[4];
		String injectionname = preDto.getInjectionname();
		String injectionname1 = injectionname.split(", ")[0];
		String injectionname2 = injectionname.split(", ")[1];
		String injectionname3 = injectionname.split(", ")[2];
		String injectiondosage = preDto.getInjectiondosage();
		String injectiondosage1 = injectiondosage.split(", ")[0];
		String injectiondosage2 = injectiondosage.split(", ")[1];
		String injectiondosage3 = injectiondosage.split(", ")[2];
		String injectionrepeat = preDto.getInjectionrepeat();
		String injectionrepeat1 = injectionrepeat.split(", ")[0];
		String injectionrepeat2 = injectionrepeat.split(", ")[1];
		String injectionrepeat3 = injectionrepeat.split(", ")[2];
		String injectiondate = preDto.getInjectiondate();
		String injectiondate1 = injectiondate.split(", ")[0];
		String injectiondate2 = injectiondate.split(", ")[1];
		String injectiondate3 = injectiondate.split(", ")[2];
		System.out.println(injectiondate1);
		System.out.println(injectiondate2);
		System.out.println(injectiondate3);
		model.addAttribute("drugname1", drugname1);
		model.addAttribute("drugname2", drugname2);
		model.addAttribute("drugname3", drugname3);
		model.addAttribute("drugname4", drugname4);
		model.addAttribute("drugname5", drugname5);
		model.addAttribute("drugdosage1", drugdosage1);
		model.addAttribute("drugdosage2", drugdosage2);
		model.addAttribute("drugdosage3", drugdosage3);
		model.addAttribute("drugdosage4", drugdosage4);
		model.addAttribute("drugdosage5", drugdosage5);
		model.addAttribute("drugrepeat1", drugrepeat1);
		model.addAttribute("drugrepeat2", drugrepeat2);
		model.addAttribute("drugrepeat3", drugrepeat3);
		model.addAttribute("drugrepeat4", drugrepeat4);
		model.addAttribute("drugrepeat5", drugrepeat5);
		model.addAttribute("dosagedate1", dosagedate1);
		model.addAttribute("dosagedate2", dosagedate2);
		model.addAttribute("dosagedate3", dosagedate3);
		model.addAttribute("dosagedate4", dosagedate4);
		model.addAttribute("dosagedate5", dosagedate5);
		model.addAttribute("dosageusage1", dosageusage1);
		model.addAttribute("dosageusage2", dosageusage2);
		model.addAttribute("dosageusage3", dosageusage3);
		model.addAttribute("dosageusage4", dosageusage4);
		model.addAttribute("dosageusage5", dosageusage5);
		model.addAttribute("injectionname1", injectionname1);
		model.addAttribute("injectionname2", injectionname2);
		model.addAttribute("injectionname3", injectionname3);
		model.addAttribute("injectiondosage1", injectiondosage1);
		model.addAttribute("injectiondosage2", injectiondosage2);
		model.addAttribute("injectiondosage3", injectiondosage3);
		model.addAttribute("injectionrepeat1", injectionrepeat1);
		model.addAttribute("injectionrepeat2", injectionrepeat2);
		model.addAttribute("injectionrepeat3", injectionrepeat3);
		model.addAttribute("injectiondate1", injectiondate1);
		model.addAttribute("injectiondate2", injectiondate2);
		model.addAttribute("injectiondate3", injectiondate3);
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
        System.out.println("guestno" + guestno);
        GuestVO gusDto = dao.getcusInfo(guestno);
        String doctorno = req.getParameter("doctorno");//
        System.out.println("doctorno"+ doctorno);
        //HospitalVO hosDto = dao.getMyhospitalInfo(doctorno);
        //System.out.println("hosDto" + hosDto);
        
        model.addAttribute("gusDto",gusDto);
        //model.addAttribute("hosDto",hosDto);
		
	}

	
	
	

	
}

