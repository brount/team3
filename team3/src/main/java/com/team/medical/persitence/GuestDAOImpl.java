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
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.MyhealthVO;
import com.team.medical.vo.QuestionBoardVO;


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
	public int checkupRegisterPro(CheckupVO vo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		int insertcnt = dao.checkupRegisterPro(vo);

		return insertcnt;
	}

	@Override
	public CheckupVO checkAnalyze(int guestNo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		CheckupVO vo = new CheckupVO();
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
	public ArrayList<QuestionBoardVO> myBordList(String id) {
		 ArrayList<QuestionBoardVO> dtos = new ArrayList<QuestionBoardVO>();
		
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);

		dtos = dao.myBordList(id);

		return dtos;
	}

	@Override
	public int guestExitPro(int guestNo) {
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
	
		int updatecnt = dao.guestExitPro(guestNo);

		return updatecnt;
	}

}
