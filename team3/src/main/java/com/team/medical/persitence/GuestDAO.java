package com.team.medical.persitence;

import java.util.ArrayList;
import java.util.Map;

import com.team.medical.vo.CheckupVO;
import com.team.medical.vo.DiseaseVO;
import com.team.medical.vo.ExaminationVO;
import com.team.medical.vo.FoodVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.HospitalVO;
import com.team.medical.vo.KcalorieVO;
import com.team.medical.vo.MyhealthVO;
import com.team.medical.vo.PrescriptionVO;
import com.team.medical.vo.QuestionBoardVO;
import com.team.medical.vo.ReservationVO;

public interface GuestDAO {
	
	//로그인
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
	public ExaminationVO checkAnalyze(Map<String,Object> map);
	
	//등록된 검진서 목록
	public ArrayList<ExaminationVO> checkupRegisterList(Map<String,Object> map);
	
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
	
// -----------------------------------------------------------------
	//음식 검색 후 칼로리 조회
	public ArrayList<KcalorieVO> foodsearch(KcalorieVO vo);

	//아점저 값으로 하루 칼로리 인서트 
	public int todaycal(Map<String,Object> map);
	
	//해당 회원의 하루 칼로리 검색
	public ArrayList<KcalorieVO> mycal(Map<String,Object> map);
	
	// 회원별 칼로리 일자별 검색
	public ArrayList<KcalorieVO> getKcalList(int guestNo);
	
	// 회원별 칼로리 일자별 상세정보
	public ArrayList<KcalorieVO> getKcalInfo(Map<String,Object> map);
	
	// 음식 이름으로 정보 셀렉트
	public FoodVO getFoodname(String foodname);
// -----------------------------------------------------------------
	
	//사용자가 즐겨찾기한 병원의 총 갯수 
	public int bookMarkcnt(int guestNo);
	
	//즐겨찾기 병원 누적할 데이터 셀렉 
	public String dbfavoritehos(int guestNo);
	
	//사용자가 즐겨찾기한 병원의 정보 셀렉
	public ArrayList<HospitalVO> bookMark(Map<String,Object> map);
	
	
	
	//즐겨찾는 병원 추가
	public void bookMarkIn(Map<String, Object> map);


	// 사용자 검진서 갯수
	public int getCheckupResultListCnt(int guestNo);

	// 사용자 검진서 리스트
	public ArrayList<CheckupVO> getCheckupResultList(Map<String, Integer> map);

	// 사용자 회원 정보
	public GuestVO getcusInfo(int guestNo);

	// 사용자 처방전 갯수
	public int examinationListCnt(int guestNo);

	// 사용자 처방전 리스트
	public ArrayList<PrescriptionVO> getExaminationList(Map<String, Integer> map);

	//등록된 검진서 수
	public int checkupRegistercnt(int guestNo);

	//등록된 검진서의 상세페이지이동
	public ExaminationVO checkupRegisterclick(int col);


	//중복된 병원의 즐겨찾기가 없을때 인서트.
	public int overlap(Map<String, Object> m);

	//즐겨찾기한 병원목록 
	public String bookMarkListcnt(int guestNo);

	//병원번호에따른 병원정보
	public HospitalVO hospitalInfo(int hospitalno);

	// 등록한 검진서 삭제
	public int checkdelete(int col);

	// 식품군  종류
	public ArrayList<FoodVO> foodkind();
	
	//음식검색시 음식 총 갯수
	public int getFoodCnt(Map<String,Object> map);
	
	//총 음식 리스트
	public ArrayList<FoodVO> getFoodList(Map<String,Object> map);
}
