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
import com.team.medical.vo.DoctorVO;
import com.team.medical.vo.ExaminationVO;
import com.team.medical.vo.FoodVO;
import com.team.medical.vo.KcalorieVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.HospitalVO;
import com.team.medical.vo.KcalorieVO;
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

	//로그인
	@Override
	public int guestLogin(Map<String, Object> map) {
		int loginCnt=0;
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		loginCnt=dao.guestLogin(map);
		
		return loginCnt;
	}

	//아이디 중복확인
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

	//일반회원 회원가입처리
	@Override
	public int insertGuest(GuestVO vo) {

		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		int insertcnt = dao.insertGuest(vo);
		return insertcnt;
	}

	//일반회원 정보조회 (회원정보수정페이지에 기본 정보)
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

	//마이헬스정보 인서트
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

	//등록된 검진서 결과 셀렉
	@Override
	public ExaminationVO checkAnalyze(Map<String,Object> map) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		ExaminationVO vo = new ExaminationVO();
		vo = dao.checkAnalyze(map);
		return vo;

	}
	
	//일반회원 정보수정처리
	@Override
	public int updateGuest(GuestVO vo) {

		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		int updatecnt = dao.updateGuest(vo);
		return updatecnt;
	
	}
	
	//내 질문 건수 
	@Override
	public int myBordListcnt(String id) {

		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		int cnt = dao.myBordListcnt(id);
		
		return cnt;
	}
	
	
	// 내 질문목록
	@Override
	public ArrayList<QuestionBoardVO> myBordList(Map<String,Object> map) {
		 ArrayList<QuestionBoardVO> dtos = new ArrayList<QuestionBoardVO>();
		
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		dtos = dao.myBordList(map);

		return dtos;
	}
	
	//일반회원 탈퇴전 비밀번호 확인
	@Override
	public int exitOkPro(Map<String, Object> map) {
		
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		
		int selectcnt = dao.exitOkPro(map);
		
		return selectcnt;
				
	
	}
	
	//일반회원 회원탈퇴처리 업뎃
	@Override
	public int guestExitPro(int guestNo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
	
		int updatecnt = dao.guestExitPro(guestNo);

		return updatecnt;
	}

	//예약할 병원 정보 셀렉트 
	@Override
	public HospitalVO reservehospital(int hospitalno) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		HospitalVO vo = new HospitalVO();
		vo = dao.reservehospital(hospitalno);
		return vo;
	}
	
	//예약정보 인서트
	@Override
	public int reservePro(ReservationVO vo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		
		int insertcnt = dao.reservePro(vo);
	
		return insertcnt;

	
	}

	//나의 예약목록 셀렉트
	@Override
	public  ArrayList<ReservationVO> reserveList(Map<String,Object> map) {
		ArrayList<ReservationVO> dtos = new ArrayList<ReservationVO>();

		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		dtos = dao.reserveList(map);

		return dtos;
	}

	//간단진료 증상 검색 후 결과반환  
	@Override
	public ArrayList<DiseaseVO> simpleTreatPro(String chk) {
		ArrayList<DiseaseVO> dtos = new ArrayList<DiseaseVO>();
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		System.out.println( "dao:"+chk);
		
		
		dtos = dao.simpleTreatPro(chk);
	
		return dtos;
	}

	//증상해당하는 병원 검색
	@Override
	public ArrayList<HospitalVO> simpleTreathos(String dikind) {
		System.out.println("dao dikind : "+dikind);
		ArrayList<HospitalVO> htos = new ArrayList<HospitalVO>();
		 GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		 htos = dao.simpleTreathos(dikind);
		
		return htos;
	}

//--------------------------------------------------------------------------------------------------------------

	//음식 검색 후 칼로리 조회
	@Override
	public ArrayList<KcalorieVO> foodsearch(KcalorieVO vo ) {
		
		 ArrayList<KcalorieVO> dtos = new  ArrayList<KcalorieVO>();
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		dtos = dao.foodsearch(vo);
		return dtos;
	}

	//아점저 값으로 하루 칼로리 인서트 
	@Override
	public int todaycal(Map<String,Object> map) {
		
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		int insertcnt = dao.todaycal(map);
		return insertcnt;
	}

	//해당 회원의 하루 칼로리 검색
	@Override
	public ArrayList<KcalorieVO> mycal(Map<String,Object> map) {
	
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		ArrayList<KcalorieVO> dtos = dao.mycal(map);
		
		
		return dtos;
	}	
	
	// 식품군  종류
	@Override
	public ArrayList<FoodVO> foodkind() {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		ArrayList<FoodVO> vo = dao.foodkind();
		 return vo;
	}
	
	//음식검색시 음식 총 갯수
	@Override
	public int getFoodCnt(Map<String, Object> map) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		int vo = dao.getFoodCnt(map);
		 return vo;
	}
	//총 음식 리스트
	@Override
	public ArrayList<FoodVO> getFoodList(Map<String, Object> map) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		ArrayList<FoodVO> vo = dao.getFoodList(map);
		 return vo;
	}
	
	// 회원별 칼로리 일자별 검색
	@Override
	public ArrayList<KcalorieVO> getKcalList(int guestno) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		ArrayList<KcalorieVO> dtos = dao.getKcalList(guestno);	
		
		return dtos;
	}
	
	// 회원별 칼로리 일자별 상세정보
	@Override
	public ArrayList<KcalorieVO> getKcalInfo(Map<String,Object> map) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		ArrayList<KcalorieVO> dtos = dao.getKcalInfo(map);	
		
		return dtos;
	}
	
	// 음식 이름으로 정보 셀렉트
	@Override
	public FoodVO getFoodname(String foodname) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		FoodVO dtos = dao.getFoodname(foodname);	
		
		return dtos;
	}
//--------------------------------------------------------------------------------------------------------------

	//나의 총 예약건수
	@Override
	public int reservecnt(int guestNo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		int cnt = dao.reservecnt(guestNo);
		return cnt;
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

	// 사용자 검진서 갯수
	@Override
	public int getCheckupResultListCnt(int guestNo) {
		int selectcnt=0;
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		selectcnt = dao.getCheckupResultListCnt(guestNo);
		
		return selectcnt;
	}
	
	// 사용자 검진서 리스트
	@Override
	public ArrayList<CheckupVO> getCheckupResultList(Map<String, Integer> map) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		ArrayList<CheckupVO> dtos =null;
		dtos=dao.getCheckupResultList(map);
		
		return dtos;
	}

	// 사용자 회원 정보
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
	
	// 사용자 처방전 리스트
	@Override
	public ArrayList<PrescriptionVO> getExaminationList(Map<String, Integer> map) {
		ArrayList<PrescriptionVO> dtos =null;
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		
		dtos=dao.getExaminationList(map);
		
		return dtos;
	}
	
	//등록된 검진서의 상세페이지이동
	@Override
	public ArrayList<ExaminationVO> checkupRegisterList(Map<String, Object> map) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		ArrayList<ExaminationVO>  dtos = null;
		dtos = dao.checkupRegisterList(map);
		 return dtos;
	
	
	}
	
	//등록된 검진서 수
	@Override
	public int checkupRegistercnt(int guestNo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		int cnt = dao.checkupRegistercnt(guestNo);
		return cnt;
	}
	
	//등록된 검진서의 상세페이지이동
	@Override
	public ExaminationVO checkupRegisterclick(int col) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		ExaminationVO vo = new ExaminationVO();
		vo = dao.checkupRegisterclick(col);
		return vo;
	}
	
	//중복된 병원의 즐겨찾기가 없을때 인서트.
	@Override
	public int overlap(Map<String, Object> m) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		int overlap =dao.overlap(m);
		
		return overlap;
	}

	//즐겨찾기한 병원목록 
	@Override
	public String bookMarkListcnt(int guestNo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		String favoritehos = dao.bookMarkListcnt(guestNo);
		return favoritehos;
	}
	
	//병원번호에따른 병원정보
	@Override
	public HospitalVO hospitalInfo(int hospitalno) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		HospitalVO vo =null;
		vo = dao.hospitalInfo(hospitalno);
		
		return vo;
	}
	
	// 등록한 검진서 삭제
	@Override
	public int checkdelete(int col) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		int deletecnt = dao.checkdelete(col);
		return deletecnt;
	}

	@Override
	public PrescriptionVO getPrescription(int prescriptionNo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		PrescriptionVO vo = dao.getPrescription(prescriptionNo);

		return vo;
	}

	@Override
	public int getdocnoInfo(int hospitalno) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		int selectCnt = dao.getdocnoInfo(hospitalno);
		return selectCnt;
	}

	@Override
	public DoctorVO getDoctorInfo(int doctorno) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		DoctorVO cnt = dao.getDoctorInfo(doctorno);
		return cnt;
	}

	@Override
	public HospitalVO getMyhospitalInfo(String doctorno) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		HospitalVO vo = dao.getMyhospitalInfo(doctorno);

		return vo;
	}



}
