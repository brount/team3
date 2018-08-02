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
        String saveDir = req.getRealPath("/resources/");
        String realDir="C:\\Users\\Kimdo\\git\\team3!\\team3\\src\\main\\webapp\\resources\\images\\licences"; // 저장 경로
        
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
	public String modifyPro(MultipartHttpServletRequest req, Model model) {
		MultipartFile file = req.getFile("file");
        String saveDir = req.getRealPath("/resources/");
        String realDir="C:\\Users\\Kimdo\\git\\team3!\\team3\\src\\main\\webapp\\resources\\images\\licences"; // 저장 경로
        
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
		
		
		String id = (String)req.getSession().getAttribute("id");
		String pwd = req.getParameter("password");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		int specialism = Integer.parseInt(req.getParameter("specialism"));
		String doctorlicence = file.getOriginalFilename();
		
		DoctorVO vo = new DoctorVO();
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
   public String myHospitalInputPro(MultipartHttpServletRequest req, Model model) {
      MultipartFile file = req.getFile("hospitalimage");
        String saveDir = req.getRealPath("/resources/images/licence/");
        String realDir="C:\\Users\\Kimdo\\git\\team3!\\team3\\src\\main\\webapp\\resources\\images\\licences"; // 저장 경로
         
        try {           
           if(file != null) {
               file.transferTo(new File(saveDir+file.getOriginalFilename()));
               
               FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
               FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
               
               int data = 0;
               
               while((data = fis.read()) != -1) {
                   fos.write(data);
               }
               fis.close();
               fos.close();
           }      
            
         String id = (String)req.getSession().getAttribute("id");
         String hospitalname = req.getParameter("hospitalname");
         String hospitaladdress1 = req.getParameter("hospitaladdress1");
         String hospitaladdress2 = req.getParameter("hospitaladdress2");
         String hospitaladdress3 = req.getParameter("hospitaladdress3");
         String hospitalphone = req.getParameter("hospitalphone");
         String hospitalinstruction = req.getParameter("hospitalinstruction");
         String hospitaltime = req.getParameter("hospitaltime");
         String hospitalholiday = req.getParameter("hospitalholiday");
         String hospitalimage = file.getOriginalFilename();
         String doctorno = "d"+String.valueOf(dao.getdocnoInfo(id))+"t";
         int cnt =0;
         cnt = dao.chkHospital(hospitalphone);
         
         if(cnt == 0) {
            HospitalVO vo = new HospitalVO();      
                  
            vo.setDoctorno(doctorno);
            vo.setHospitalname(hospitalname);
            vo.setHospitaladdress1(hospitaladdress1);
            vo.setHospitaladdress2(hospitaladdress2);
            vo.setHospitaladdress3(hospitaladdress3);
            vo.setHospitalphone(hospitalphone);
            vo.setHospitalinstruction(hospitalinstruction);
            vo.setHospitaltime(hospitaltime);
            vo.setHospitalholiday(hospitalholiday);
            vo.setHospitalimage(hospitalimage);
            
            int intsertCnt = dao.insertHospitalInfo(vo);
            model.addAttribute("intsertCnt", intsertCnt);
         }else {
            HospitalVO vo = dao.getHospitalInfo(hospitalphone);
            
            String doctorno2 = vo.getDoctorno()+","+doctorno;
            vo.setDoctorno(doctorno2);
            
            int intsertCnt = dao.updateHospital(vo);
            model.addAttribute("intsertCnt", intsertCnt);
         }
   
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
		
		//환자이름
		//주민등록번호
		//성별
		//나이
		//연락처
		//이메일
		
		
		CheckupListVO vo = new CheckupListVO();
		
		String doctorspecialism = req.getParameter("doctorspecialism");
		String doctorname = req.getParameter("doctorname");
		String hospitaladdress1 = req.getParameter("hospitaladdress1");
		String hospitaladdress2 = req.getParameter("hospitaladdress2");
		String hospitaladdress3 = req.getParameter("hospitaladdress3");
		String hospitalname = req.getParameter("hospitalname");
		String hospitalphone = req.getParameter("hospitalphone");
		
		String checkup_kind = req.getParameter("checkup_kind");
		String checkup_name = req.getParameter("checkup_name");
		String checkup_opinion = req.getParameter("checkup_opinion");
		String checkup_contents = req.getParameter("checkup_contents");
		
		String guestName = req.getParameter("guestName");
		String guestJumin = req.getParameter("guestJumin");
		String guestSex = req.getParameter("guestSex");
		String guestAge = req.getParameter("guestAge");
		String guestPhone = req.getParameter("guestPhone");
		String guestEmail = req.getParameter("guestEmail");
		
		vo.setDoctorno(doctorno);
		vo.setCheckup_kind(checkup_kind);
		vo.setCheckup_name(checkup_name);
		vo.setCheckup_opinion(checkup_opinion);
		vo.setCheckup_contents(checkup_contents);
		vo.setCheckup_date(new Date(System.currentTimeMillis()));
		
		model.addAttribute("doctorspecialism",doctorspecialism);
		model.addAttribute("doctorname",doctorname);
		model.addAttribute("hospitaladdress1",hospitaladdress1);
		model.addAttribute("hospitaladdress2",hospitaladdress2);
		model.addAttribute("hospitaladdress3",hospitaladdress3);
		model.addAttribute("hospitalname",hospitalname);
		model.addAttribute("hospitalphone",hospitalphone);
		
		model.addAttribute("checkup_kind",checkup_kind);
		model.addAttribute("checkup_name",checkup_name);
		model.addAttribute("checkup_opinion",checkup_opinion);
		model.addAttribute("checkup_contents",checkup_contents);
		
		
		model.addAttribute("guestName",guestName);
		model.addAttribute("guestJumin",guestJumin);
		model.addAttribute("guestSex",guestSex);
		model.addAttribute("guestAge",guestAge);
		model.addAttribute("guestPhone",guestPhone);
		model.addAttribute("guestEmail",guestEmail);
		
		model.addAttribute("vo",vo);
		
		int insertCnt = dao.checkListInput(vo);
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
	    System.out.println("checkuplist : " + checkuplist);

	    int docno = dao.checkupdoc(checkuplist);
		
		DoctorVO docDto = dao.getDoctorInfo(docno);
		String doctorno = "d"+String.valueOf(docDto.getDoctorno())+"t";
		
		HospitalVO hosDto = dao.getMyhospitalInfo(doctorno); 
		GuestVO gusDto = dao.getcusInfo(checkuplist);
		CheckupListVO checkDto = dao.getCheckupInfo(checkuplist);
		
		model.addAttribute("docDto",docDto);
		model.addAttribute("hosDto",hosDto);
		model.addAttribute("gusDto",gusDto);
		model.addAttribute("checkDto",checkDto);
		
	}

	@Override
	public void checkupAddInputPro(HttpServletRequest req, Model model) {

		int checkuplist = Integer.parseInt(req.getParameter("checkuplist"));
	    model.addAttribute("checkuplist", checkuplist);
	    
	    String height = req.getParameter("height");
	    String weight = req.getParameter("weight");
	    String fatness = req.getParameter("fatness");
	    String visionl = req.getParameter("visionl");
	    String visionr = req.getParameter("visionr");
	    String hearingl = req.getParameter("hearingl");
	    String hearingr = req.getParameter("hearingr");
	    String bloodpremax = req.getParameter("bloodpremax");
	    String bloodpremin = req.getParameter("bloodpremin");
	    String urineglucose = req.getParameter("urineglucose");
	    String urineprotein = req.getParameter("urineprotein");
	    String occulthematuria = req.getParameter("occulthematuria");
	    String urineph = req.getParameter("urineph");
	    String hemoglobin = req.getParameter("hemoglobin");
	    String bloodglucose = req.getParameter("bloodglucose");
	    String totalcholesterol = req.getParameter("totalcholesterol");
	    String ast = req.getParameter("ast");
	    String alt = req.getParameter("alt");
	    String gammagtp = req.getParameter("gammagtp");
	    String hepatitisscr = req.getParameter("hepatitisscr");
	    String breastradiography = req.getParameter("breastradiography");
	    String ecg = req.getParameter("ecg");
	    
	    int guestno = dao.getcusnoInfo(checkuplist);
		CheckupVO vo = new CheckupVO();
		
		vo.setGuestNo(guestno);
		vo.setHeight(height);
		vo.setWeight(weight);
		vo.setFatness(fatness);
		vo.setVisionl(visionl);
		vo.setVisionr(visionr);
		vo.setHearingl(hearingl);
		vo.setHearingr(hearingr);
		vo.setBloodpremax(bloodpremax);
		vo.setBloodpremin(bloodpremin);
		vo.setUrineglucose(urineglucose);
		vo.setUrineprotein(urineprotein);
		vo.setOcculthematuria(occulthematuria);
		vo.setUrineph(urineph);
		vo.setHemoglobin(hemoglobin);
		vo.setBloodglucose(bloodglucose);
		vo.setTotalcholesterol(totalcholesterol);
		vo.setAst(ast);
		vo.setAlt(alt);
		vo.setGammagtp(gammagtp);
		vo.setHepatitisscr(hepatitisscr);
		vo.setBreastradiography(breastradiography);
		vo.setEcg(ecg);
		vo.setCheckup_date(new Date(System.currentTimeMillis()));
		
		int insertCnt = dao.checkupAdd(vo);
		
		model.addAttribute("insertCnt", insertCnt);
		
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
        
        GuestVO gusDto = dao.getcusInfo(checkup);
        CheckupVO CheckDto = dao.getCheckupResultInfo(checkup);
        
        model.addAttribute("gusDto",gusDto);
        model.addAttribute("CheckDto",CheckDto);
        System.out.println("gusDto" + gusDto);
        System.out.println("CheckDto" + CheckDto);
        
        /*
         int docno = dao.checkupdoc(checkuplist);
		
		
		GuestVO gusDto = dao.getcusInfo(checkuplist);
		CheckupListVO checkDto = dao.getCheckupInfo(checkuplist);
		
		model.addAttribute("docDto",docDto);
		model.addAttribute("hosDto",hosDto);
		model.addAttribute("gusDto",gusDto);
		model.addAttribute("checkDto",checkDto);
          
         */
		
	}

	


	
	

	
}

