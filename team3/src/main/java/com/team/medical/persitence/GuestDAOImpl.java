package com.team.medical.persitence;

import java.util.ArrayList;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.team.medical.vo.CheckupVO;
import com.team.medical.vo.DiseaseVO;
import com.team.medical.vo.ExaminationVO;
import com.team.medical.vo.FoodVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.HospitalVO;
import com.team.medical.vo.MyhealthVO;
import com.team.medical.vo.QuestionBoardVO;
import com.team.medical.vo.ReservationVO;


@Repository
public class GuestDAOImpl implements GuestDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public int guestLogin(Map<String, Object> map) {
		int loginCnt=0;
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		loginCnt=dao.guestLogin(map);
		
		return loginCnt;
	}

	@Override
	public int idCheck(String strId) {
		
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		int selectCnt = dao.idCheck(strId);

		return selectCnt;
	}
	
	//이메일 인증 시 입력된 회원 메일로 인증키 발송
	@Override
	public void sendmail(String email, String key) {

		try {

			MimeMessage message = mailSender.createMimeMessage();

			String txt = "인증번호 : " + key;
			message.setSubject("회원가입 인증 메일입니다.");
			message.setText(txt, "UTF-8", "html");
			message.setFrom(new InternetAddress("silver@naver.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(email));

			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();

		}

			
	}
	//회원가입시 중복된 이메일 여부 체크
	@Override
	public int emailok(String email) {

		System.out.println("email?" + email);
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		int cnt = dao.emailok(email);

		return cnt;
	}

	@Override
	public int insertGuest(GuestVO vo) {

		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		int insertcnt = dao.insertGuest(vo);
		return insertcnt;
	}

	@Override
	public GuestVO getGuestInfo(String id) {
		
		GuestVO vo = new GuestVO(); 
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		vo = dao.getGuestInfo(id);
		
		return vo;
	}

	//마이헬스 정보 인서트
	@Override
	public int personalAddPro(MyhealthVO vo) {
		
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		int insertcnt = dao.personalAddPro(vo);
		
		return insertcnt;
	}

	@Override
	public int personalMofPro(MyhealthVO vo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		int updatecnt = dao.personalMofPro(vo);
		
		return updatecnt;
	}

	
	// 마이헬스정보 셀렉트
	@Override
	public MyhealthVO myHealth(int guestNo) {
		
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		MyhealthVO vo = new MyhealthVO();
		vo = dao.myHealth(guestNo);

		return vo;
	}

	// 검진서등록 인서트
	@Override
	public int checkupRegisterPro(ExaminationVO vo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		int insertcnt = dao.checkupRegisterPro(vo);

		return insertcnt;
	}

	@Override
	public ExaminationVO checkAnalyze(int guestNo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		ExaminationVO vo = new ExaminationVO();
		vo = dao.checkAnalyze(guestNo);
		return vo;

	}

	@Override
	public int updateGuest(GuestVO vo) {

		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		int updatecnt = dao.updateGuest(vo);
		return updatecnt;
	
	}
	
	@Override
	public int myBordListcnt(String id) {

		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		int cnt = dao.myBordListcnt(id);
		
		return cnt;
	}
	
	

	@Override
	public ArrayList<QuestionBoardVO> myBordList(Map<String,Object> map) {
		 ArrayList<QuestionBoardVO> dtos = new ArrayList<QuestionBoardVO>();
		
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		dtos = dao.myBordList(map);

		return dtos;
	}

	@Override
	public int exitOkPro(Map<String, Object> map) {
		
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		
		int selectcnt = dao.exitOkPro(map);
		
		return selectcnt;
				
	
	}
	
	@Override
	public int guestExitPro(int guestNo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
	
		int updatecnt = dao.guestExitPro(guestNo);

		return updatecnt;
	}

	@Override
	public HospitalVO reservehospital(int hospitalno) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		HospitalVO vo = new HospitalVO();
		vo = dao.reservehospital(hospitalno);
		return vo;
	}

	@Override
	public int reservePro(ReservationVO vo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		
		int insertcnt = dao.reservePro(vo);
	
		return insertcnt;

	
	}

	
	
	@Override
	public  ArrayList<ReservationVO> reserveList(Map<String,Object> map) {
		ArrayList<ReservationVO> dtos = new ArrayList<ReservationVO>();

		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		dtos = dao.reserveList(map);

		return dtos;
	}

	@Override
	public ArrayList<DiseaseVO> simpleTreatPro(String chk) {
		ArrayList<DiseaseVO> dtos = new ArrayList<DiseaseVO>();

		
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		System.out.println( "dao:"+chk);
		
		
		dtos = dao.simpleTreatPro(chk);
	
		return dtos;
	}

	@Override
	public ArrayList<HospitalVO> simpleTreathos(String dikind) {
		System.out.println("dao dikind : "+dikind);
		ArrayList<HospitalVO> htos = new ArrayList<HospitalVO>();
		 GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		 htos = dao.simpleTreathos(dikind);
		
		return htos;
	}

	@Override
	public ArrayList<FoodVO> foodsearch(FoodVO vo ) {
		
		 ArrayList<FoodVO> dtos = new  ArrayList<FoodVO>();
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		dtos = dao.foodsearch(vo);
		
		
		return dtos;
	}

	@Override
	public int todaycal(FoodVO vo) {
		
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		int insertcnt = dao.todaycal(vo);
		return insertcnt;
	}

	@Override
	public FoodVO mycal(FoodVO vo) {
	
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		vo = dao.mycal(vo);
		
		
		return vo;
	}

	@Override
	public int mycalUpdate(FoodVO vo) {	
	GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
	int cnt = dao.mycalUpdate(vo);
	return cnt;
	
	}

	@Override
	public int newfood(FoodVO vo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		
		int foodcnt = dao.newfood(vo);
		
		
		return foodcnt;
	}

	@Override
	public int reservecnt(int guestNo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		int cnt = dao.reservecnt(guestNo);
		return cnt;
	}

	@Override
	public int myFoodcnt(int guestNo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		int cnt = dao.myFoodcnt(guestNo);
		
		return cnt;
	
	}

	@Override
	public ArrayList<FoodVO> myFoodList(Map<String, Object> map) {
		
		ArrayList<FoodVO> dtos = new ArrayList<FoodVO>();

		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		dtos = dao.myFoodList(map);
		
		return dtos;

	}

	@Override
	public int bookMarkcnt(int guestNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<HospitalVO> bookMark(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int myFoodModi(Map<String, Object> map) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		int updatecnt = dao.myFoodModi(map);
		
		return updatecnt;
	
	}

	@Override
	public int myFoodDelete(int foodno) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		int deletecnt = dao.myFoodDelete(foodno);
		
		return deletecnt;

		
		
	}

	




}
