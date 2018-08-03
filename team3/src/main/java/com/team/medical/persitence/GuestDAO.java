package com.team.medical.persitence;

import java.util.ArrayList;
import java.util.Map;

import com.team.medical.vo.CheckupVO;
import com.team.medical.vo.DiseaseVO;
import com.team.medical.vo.ExaminationVO;
import com.team.medical.vo.FoodVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.HospitalVO;
import com.team.medical.vo.MyhealthVO;
import com.team.medical.vo.QuestionBoardVO;
import com.team.medical.vo.ReservationVO;

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
	
	//일반회원 탈퇴전 비밀번호 확인
	public int exitOkPro(Map<String, Object> map);
	
	
	//일반회원 회원탈퇴처리 업뎃
	public int guestExitPro(int guestNo);
	
	//내 질문 건수 
	public int myBordListcnt(String id);
	
	// 내 질문목록
	public ArrayList<QuestionBoardVO> myBordList(Map<String,Object> map);
	
	
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
	
	//예약정보 인서트
	public int reservePro(ReservationVO vo);
	
	//나의 총 예약건수
	public int reservecnt(int guestNo);
	
	//나의 예약목록 셀렉트
	public ArrayList<ReservationVO> reserveList(Map<String,Object> map);
	
	//간단진료 증상 검색 후 결과반환  
	public ArrayList<DiseaseVO> simpleTreatPro(String chk);
	
	//증상해당하는 병원 검색
	public ArrayList<HospitalVO> simpleTreathos(String dikind);
	
	//음식 검색 후 칼로리 조회
	public ArrayList<FoodVO> foodsearch(FoodVO vo);

	//아점저 값으로 하루 칼로리 인서트 
	public int todaycal(FoodVO vo);
	
	//해당 회원의 하루 칼로리 검색
	public FoodVO mycal(FoodVO vo);
	
	//하루 칼로리 업데이트
	public int mycalUpdate(FoodVO vo);
	
	//사용자가 새로운음식과 해당하는음식의 칼로리 등록
	public int newfood (FoodVO vo);
	
	//사용자가 등록한 음식의 총 갯수 
	public int myFoodcnt(int guestNo);
	
	//사용자가 등록한 음식목록리스트 셀렉
	public ArrayList<FoodVO> myFoodList(Map<String,Object> map);

	
	//사용자가 즐겨찾기한 병원의 총 갯수 
	public int bookMarkcnt(int guestNo);
	
	//사용자가 즐겨찾기한 병원의 정보 셀렉
	public ArrayList<HospitalVO> bookMark(Map<String,Object> map);

	
	// 사용자가 추가한 음식 수정 윈도우폼에 뿌릴 정보
	public FoodVO foodmodi(int foodno);
	
	// 사용자가 추가한 음식 수정
	public int myFoodModi(Map<String,Object> map);

	// 사용자가 추가한 음식 삭제
	public int myFoodDelete(int foodno);

	
	
	
}
