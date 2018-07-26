package com.team.medical.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
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
import com.team.medical.vo.DoctorVO;
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
         String doctorno = "d"+String.valueOf(dao.getMyInfo(id))+"t";
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
      System.out.println("id :" + id);
      String doctorno = "d"+String.valueOf(dao.getMyInfo(id))+"t";
      
      HospitalVO vo = dao.getMyhospitalInfo(doctorno); 
      
      System.out.println("vo : "+vo);
      model.addAttribute("vo", vo);
      
   }

	@Override
	public void docInfo(HttpServletRequest req, Model model) {
		String id = (String)req.getSession().getAttribute("id");
		
		String doctorno = "d"+String.valueOf(dao.getMyInfo(id))+"t";
		
		HospitalVO dto = dao.getMyhospitalInfo(doctorno); 
		
		DoctorVO vo = dao.getDocInfo(id);
		model.addAttribute("vo",vo);
		model.addAttribute("dto",dto);
		
		
	}

	@Override
	public void checkupRequestInputPro(HttpServletRequest req, Model model) {
		///////
		//환자이름
		//주민등록번호
		//성별
		//나이
		//연락처
		//이메일
		///
		
		CheckupListVO vo = dao.checkListInput();
		
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
		
		
	}


	//일반회원 정보 가져오기
	/*@Override
	public void cusInfo(HttpServletRequest req, Model model) {
		String id = (String) req.getSession().getAttribute("id");
		GuestVO vo = dao.getcusInfo(id);
		model.addAttribute("vo", vo);
		
	}	*/
}
