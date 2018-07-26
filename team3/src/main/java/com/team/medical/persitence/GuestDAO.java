package com.team.medical.persitence;

import java.util.ArrayList;
import java.util.Map;

import com.team.medical.vo.CheckupVO;
import com.team.medical.vo.ExaminationVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.HospitalVO;
import com.team.medical.vo.MyhealthVO;
import com.team.medical.vo.QuestionBoardVO;

public interface GuestDAO {
	
	public int guestLogin(Map<String,Object> map);
	
	//아이디 중복확인
	public int idCheck(String strId);
	
	//이메일 인증
	public void sendmail(String email, String key);
	public int emailok(String email);

	
	//일반회원 회원가입처리
	public int insertGuest(GuestVO vo);
	
	//일반회원 정보조회 (회원정보수정페이지에 기본 정보)
	public GuestVO getGuestInfo(String id);
	
	//일반회원 정보수정처리
	public int updateGuest(GuestVO vo);
	
	//일반회원 회원탈퇴처리 업뎃
	public int guestExitPro(int guestNo);
	
	// 내 질문목록
	public ArrayList<QuestionBoardVO> myBordList(String id);
	
	//마이헬스정보 인서트
	public int personalAddPro(MyhealthVO vo);
	//마이헬스정보 인서트
	public int personalMofPro(MyhealthVO vo);
	
	//마이헬스정보 셀렉트
	public MyhealthVO myHealth(int guestNo);
	
	//검진서 등록 처리
	public int checkupRegisterPro(ExaminationVO vo);

	//검진서 결과 셀렉트
	public ExaminationVO checkAnalyze(int guestNo);
	
	//예약할 병원 정보 셀렉트 
	public HospitalVO reservehospital(int hospitalno);

}
