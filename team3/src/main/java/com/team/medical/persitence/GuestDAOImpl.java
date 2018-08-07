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
import com.team.medical.vo.PrescriptionVO;
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
	
	// 즐겨찾기 병원의 갯수 유무구하기
	@Override
	public int bookMarkcnt(int guestNo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		int cnt = dao.bookMarkcnt(guestNo);
		return cnt;
	}
	
	
	//현재 즐겨찾은 병원 셀렉
	@Override
	public String dbfavoritehos(int guestNo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		String dbfavoritehos = dao.dbfavoritehos(guestNo);
		return dbfavoritehos;
	}

	// 즐겨찾는 병원 추가
	@Override
	public void bookMarkIn(Map<String, Object> map) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		dao.bookMarkIn(map);
		
	}
	//즐겨찾는 병원 목록 셀렉트.
	@Override
	public ArrayList<HospitalVO> bookMark(Map<String, Object> map) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		ArrayList<HospitalVO> dtos = null;
		dtos = dao.bookMark(map);
		

		return dtos;
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

	@Override
	public FoodVO foodmodi(int foodno) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		FoodVO vo = new FoodVO();
		
		 vo = dao.foodmodi(foodno);
		 return vo;
	
	}

	@Override
	public int getCheckupResultListCnt(int guestNo) {
		int selectcnt=0;
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		selectcnt = dao.getCheckupResultListCnt(guestNo);
		
		return selectcnt;
	}

	@Override
	public ArrayList<CheckupVO> getCheckupResultList(Map<String, Integer> map) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		ArrayList<CheckupVO> dtos =null;
		dtos=dao.getCheckupResultList(map);
		
		return dtos;
	}

	@Override
	public GuestVO getcusInfo(int guestNo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		GuestVO cnt = dao.getcusInfo(guestNo);
		return cnt;
	}

	// 처방전 글 갯수
	@Override
	public int examinationListCnt(int guestNo) {
		int selectcnt=0;
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		selectcnt = dao.examinationListCnt(guestNo);
		return selectcnt;
	}

	@Override
	public ArrayList<PrescriptionVO> getExaminationList(Map<String, Integer> map) {
		ArrayList<PrescriptionVO> dtos =null;
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		
		dtos=dao.getExaminationList(map);
		
		return dtos;
	}

	@Override
	public ArrayList<ExaminationVO> checkupRegisterList(Map<String, Object> map) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		ArrayList<ExaminationVO>  dtos = null;
		dtos = dao.checkupRegisterList(map);
		 return dtos;
	
	
	}

	@Override
	public int checkupRegistercnt(int guestNo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		int cnt = dao.checkupRegistercnt(guestNo);
		return cnt;
	}

	@Override
	public ExaminationVO checkupRegisterclick(int col) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		ExaminationVO vo = new ExaminationVO();
		vo = dao.checkupRegisterclick(col);
		return vo;
	}

	@Override
	public int overlap(Map<String, Object> m) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		int overlap =dao.overlap(m);
		
		return overlap;
	}

	@Override
	public String bookMarkListcnt(int guestNo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		String favoritehos = dao.bookMarkListcnt(guestNo);
		return favoritehos;
	}

	@Override
	public HospitalVO hospitalInfo(int hospitalno) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		HospitalVO vo =null;
		vo = dao.hospitalInfo(hospitalno);
		
		return vo;
	}


	




}
