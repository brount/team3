package com.team.medical.persitence;

import java.util.ArrayList;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.mail.javamail.JavaMailSender;

import com.team.medical.vo.CheckupListVO;
import com.team.medical.vo.CheckupVO;
import com.team.medical.vo.CheckupresultVO;
import com.team.medical.vo.DoctorVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.HospitalVO;
import com.team.medical.vo.PointVO;
import com.team.medical.vo.PrescriptionVO;
import com.team.medical.vo.QuestionBoardVO;
import com.team.medical.vo.ReservationVO;

@Repository
public class DoctorDAOImpl implements DoctorDAO {

	@Autowired
	SqlSession sqlSession;

	@Autowired
	private JavaMailSender mailSender;

	// 의사 로그인
	@Override
	public int doctorLogin(Map<String, Object> map) {
		int loginCnt = 0;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		loginCnt = dao.doctorLogin(map);

		return loginCnt;
	}

	// 아이디 체크
	@Override
	public int idCheck(String id) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.idCheck(id);

		return cnt;
	}

	// 회원가입 정보 넣기
	@Override
	public int insertMember(DoctorVO vo) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.insertMember(vo);
		return cnt;
	}

	// 회원 정보 수정
	@Override
	public int updateMemberInfo(DoctorVO vo) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int updateCnt = dao.updateMemberInfo(vo);
		return updateCnt;
	}

	// 의사 회원 탈퇴
	@Override
	public int deleteMember(String id) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int deleteCnt = dao.deleteMember(id);
		return deleteCnt;
	}

	// 의사 번호 가져오기
	public int getdocnoInfo(String id) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int selectCnt = dao.getdocnoInfo(id);
		return selectCnt;
	}

	// 내 병원 정보 가져오기
	@Override
	public HospitalVO getMyhospitalInfo(String doctorno) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		HospitalVO selectCnt = dao.getMyhospitalInfo(doctorno);

		return selectCnt;
	}

	// 제휴병원 중복체크
	@Override
	public int chkHospital(String hospitalphone) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int chkCnt = dao.chkHospital(hospitalphone);

		return chkCnt;
	}

	// 병원정보가져오기 (병원번호)
	@Override
	public HospitalVO getHospitalInfo(Map<String, Object> map) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		HospitalVO vo = dao.getHospitalInfo(map);

		return vo;
	}

	// 병원정보수정
	@Override
	public int updateHospital(HospitalVO vo) {
		int updateCnt = 0;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		updateCnt = dao.updateHospital(vo);
		return updateCnt;
	}

	// 의사 정보 가져오기
	@Override
	public DoctorVO getDocInfo(String id) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		DoctorVO selectCnt = dao.getDocInfo(id);
		return selectCnt;
	}

	// 검사의뢰서 등록
	@Override
	public int checkListInput(CheckupListVO vo) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int insertCnt = dao.checkListInput(vo);
		return insertCnt;
	}

	// 검사의뢰목록 글 갯수
	@Override
	public int getcheckupListCnt(int kind) {
		int selectCnt = 0;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		selectCnt = dao.getcheckupListCnt(kind);
		return selectCnt;
	}

	// 검사의뢰목록
	@Override
	public ArrayList<CheckupListVO> CheckupList(Map<String, Integer> map) {
		ArrayList<CheckupListVO> dtos = null;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);

		dtos = dao.CheckupList(map);

		return dtos;
	}

	// 일반 회원 정보
	@Override
	public GuestVO getcusInfo(int guestno) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		GuestVO cnt = dao.getcusInfo(guestno);
		return cnt;
	}

	// 의사 정보가져오기
	@Override
	public DoctorVO getDoctorInfo(int doctorno) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		DoctorVO cnt = dao.getDoctorInfo(doctorno);
		return cnt;
	}

	// 검사의뢰 의사번호
	@Override
	public int checkupdoc(int checkuplist) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.checkupdoc(checkuplist);
		return cnt;
	}

	// 검사의뢰 정보
	@Override
	public CheckupListVO getCheckupInfo(int checkuplist) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		CheckupListVO cnt = dao.getCheckupInfo(checkuplist);
		return cnt;
	}

	// 건강검진 등록처리
	@Override
	public int checkupAdd(CheckupVO vo) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int insertCnt = dao.checkupAdd(vo);
		return insertCnt;
	}

	// 회원 번호로 검색
	@Override
	public int getcusnoInfo(int checkuplist) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.getcusnoInfo(checkuplist);
		return cnt;
	}

	// 건강검진 글 갯수
	@Override
	public int getCheckupResultListCnt(int i) {
		int selectCnt = 0;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		selectCnt = dao.getCheckupResultListCnt(i);
		return selectCnt;
	}

	// 건강검진 목록
	@Override
	public ArrayList<CheckupVO> getCheckupResultList(Map<String, Integer> map) {
		ArrayList<CheckupVO> dtos = null;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		dtos = dao.getCheckupResultList(map);
		return dtos;
	}

	// 건강검진 정보 가져오기
	@Override
	public CheckupVO getCheckupResultInfo(int checkup) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		CheckupVO cnt = dao.getCheckupResultInfo(checkup);
		return cnt;
	}

	// 건강검진 환자 번호
	@Override
	public int getGuestCheckupResult(int checkup) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.getGuestCheckupResult(checkup);
		return cnt;
	}

	// 건강검진 의사번호
	@Override
	public int getDoctonoCheckupResult(int guestno) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.getDoctonoCheckupResult(guestno);
		return cnt;
	}

	// 의사번호로 병원번호 가져오기
	@Override
	public int getHospitalnoDocno(String doctorno) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.getHospitalnoDocno(doctorno);
		return cnt;
	}

	// 처방전 등록처리
	@Override
	public int examinationAdd(PrescriptionVO vo) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int insertCnt = dao.examinationAdd(vo);
		return insertCnt;
	}

	// 처방전 글 갯수
	@Override
	public int examinationListCnt(int i) {
		int selectCnt = 0;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		selectCnt = dao.examinationListCnt(i);
		return selectCnt;
	}

	// 처방전 목록
	@Override
	public ArrayList<PrescriptionVO> getExaminationList(Map<String, Integer> map) {
		ArrayList<PrescriptionVO> dtos = null;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		dtos = dao.getExaminationList(map);

		return dtos;
	}

	// 처방전 번호로 회원번호 가져오기
	@Override
	public int getPrescriptionNoGuestno(int prescriptionNo) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.getPrescriptionNoGuestno(prescriptionNo);
		return cnt;
	}

	// 처방전 정보
	@Override
	public PrescriptionVO getPrescription(int guestno) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		PrescriptionVO cnt = dao.getPrescription(guestno);
		return cnt;
	}

	// 예약 글 갯수
	@Override
	public int getPatientListCnt() {
		int selectCnt = 0;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		selectCnt = dao.getPatientListCnt();
		return selectCnt;
	}

	// 예약 글 목록
	@Override
	public ArrayList<ReservationVO> getpatientList(Map<String, Integer> map) {
		ArrayList<ReservationVO> dtos = null;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		dtos = dao.getpatientList(map);
		return dtos;
	}

	// 예약병원정보
	@Override
	public HospitalVO getHospitalNoInfo(int hospitalno) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		HospitalVO cnt = dao.getHospitalNoInfo(hospitalno);
		return cnt;
	}

	// 예약번호로 환자번호 가져오기
	@Override
	public int reservationNoguestno(int reservationNo) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.reservationNoguestno(reservationNo);
		return cnt;

	}

	// 예약정보
	@Override
	public ReservationVO reservationInfo(int guestno) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		ReservationVO cnt = dao.reservationInfo(guestno);
		return cnt;
	}

	// 게스트 번호로 의사번호 가져오기
	@Override
	public int doctornoGuestno(int guestno) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.doctornoGuestno(guestno);
		return cnt;
	}

	// 게스트 번호로 건강검진 가져오기
	@Override
	public int getCheckupListGuestno(int guestno) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.getCheckupListGuestno(guestno);
		return cnt;
	}

	// 검사 결과 수정
	@Override
	public int checkupUpdate(CheckupVO vo) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.checkupUpdate(vo);
		return cnt;
	}

	// 검사의뢰 번호
	@Override
	public int getCheckupListno() {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.getCheckupListno();
		return cnt;
	}

	// 검사결과번호
	@Override
	public int getCheckupCheckupList(int checkuplist) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.getCheckupCheckupList(checkuplist);
		return cnt;
	}

	// 검진 번호
	@Override
	public int getCheckupListCheckup(int checkup) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.getCheckupListCheckup(checkup);
		return cnt;
	}

	// 로그인 승인
	@Override
	public int doctorappro(Map<String, Object> map) {
		int loginCnt = 0;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		loginCnt = dao.doctorappro(map);
		return loginCnt;
	}

	// 포인트 글 갯수
	@Override
	public int getPointManageCnt(String doctorno) {
		int selectCnt = 0;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		selectCnt = dao.getPointManageCnt(doctorno);
		return selectCnt;
	}

	// 포인트 글 목록
	@Override
	public ArrayList<PointVO> getPointManageList(Map<String, Integer> map) {
		ArrayList<PointVO> dtos = null;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		dtos = dao.getPointManageList(map);
		return dtos;
	}

	// 건강검진결과
	@Override
	public ArrayList<CheckupresultVO> checkupresult() {
		ArrayList<CheckupresultVO> dtos = null;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		dtos = dao.checkupresult();
		return dtos;
	}

	// 이메일 보내기
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

	// 댓글 갯수
	@Override
	public int getReboardCnt(String id) {
		int selectCnt = 0;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		selectCnt = dao.getReboardCnt(id);
		return selectCnt;
	}

	// 댓글 목록
	@Override
	public ArrayList<QuestionBoardVO> getReboardList(Map<String, Object> map) {
		ArrayList<QuestionBoardVO> dtos = null;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		dtos = dao.getReboardList(map);
		return dtos;
	}

	// 내 병원 예약글 갯수
	@Override
	public int getMyHospitalReservationListCnt(int doctorno) {
		int selectCnt = 0;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		selectCnt = dao.getMyHospitalReservationListCnt(doctorno);
		return selectCnt;
	}

	// 내 병원 예약글 목록
	@Override
	public ArrayList<ReservationVO> getMyHospitalReservationListList(Map<String, Integer> map) {
		ArrayList<ReservationVO> dtos = null;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		dtos = dao.getMyHospitalReservationListList(map);
		return dtos;

	}

	// 병원번호로 의사 번호 가져오기
	@Override
	public String getDoctornoHospitalno(int hospitalno) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		String cnt = dao.getDoctornoHospitalno(hospitalno);
		return cnt;
	}

	// 아이디로 ref가져오기
	@Override
	public ArrayList<QuestionBoardVO> getRef(String id) {
		ArrayList<QuestionBoardVO> dtos = null;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		dtos = dao.getRef(id);
		return dtos;
	}

	// 예약 확인여부
	@Override
	public int reservationAppro(int reservationNo) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.reservationAppro(reservationNo);
		return cnt;
	}

	// 예약댓글 없을 때
	@Override
	public int getReboardCntNull(String id) {
		int selectCnt = 0;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		selectCnt = dao.getReboardCntNull(id);
		return selectCnt;
	}

}
