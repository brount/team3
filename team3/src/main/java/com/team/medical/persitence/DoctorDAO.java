package com.team.medical.persitence;

import java.util.ArrayList;
import java.util.Map;

import com.team.medical.vo.CheckupListVO;
import com.team.medical.vo.CheckupVO;
import com.team.medical.vo.DoctorVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.HospitalVO;
import com.team.medical.vo.PointVO;
import com.team.medical.vo.PrescriptionVO;
import com.team.medical.vo.ReservationVO;

public interface DoctorDAO {
	
	public int doctorLogin(Map<String, Object> map);
	
	//아이디 체크
	public int idCheck(String id);
	
	//회원 정보 삽입
	public int insertMember(DoctorVO vo);

	//회원 정보 수정
	public int updateMemberInfo(DoctorVO vo);

	//의사 회원 탈퇴
	public int deleteMember(String id);

	// 내 병원 정보 가져오기
	public HospitalVO getMyhospitalInfo(String doctorno);
	
	// 의사 번호 가져오기
	public int getdocnoInfo(String id);

	// 의사 정보 가져오기
	public DoctorVO getDocInfo(String id);
	
	// 제휴병원 중복확인
    public int chkHospital(String hospitalphone);
   
    // 병원정보 (병원번호)
    public HospitalVO getHospitalInfo(Map<String,Object> map);
   
    // 병원정보 수정
    public int updateHospital(HospitalVO vo);

    // 검사의뢰서 등록
	public int checkListInput(CheckupListVO vo);

	// 검사의뢰목록 글 갯수
	public int getcheckupListCnt(int kind);

	// 검사의뢰목록
	public ArrayList<CheckupListVO> CheckupList(Map<String, Integer> map);

	// 일반 회원 정보
	public GuestVO getcusInfo(int guestno);

	// 의사 정보가져오기
	public DoctorVO getDoctorInfo(int doctorno);

	public int checkupdoc(int checkuplist);
	
	// 검사의뢰 정보
	public CheckupListVO getCheckupInfo(int checkuplist);

	// 건강검진 등록처리
	public int checkupAdd(CheckupVO vo);

	// 회원 번호로 검색
	public int getcusnoInfo(int checkuplist);

	// 건강검진 글 갯수
	public int getCheckupResultListCnt(int i);

	// 건강검진 목록
	public ArrayList<CheckupVO> getCheckupResultList(Map<String, Integer> map);

	// 건강검진 정보 가져오기
	public CheckupVO getCheckupResultInfo(int checkup);

	// 건강검진 환자 번호
	public int getGuestCheckupResult(int checkup);

	// 건강검진 의사번호
	public int getDoctonoCheckupResult(int guestno);

	// 의사번호로 병원번호 가져오기
	public int getHospitalnoDocno(String doctorno);

	// 처방전 등록처리
	public int examinationAdd(PrescriptionVO vo);

	// 처방전 글 갯수
	public int examinationListCnt(int i);

	// 처방전 목록
	public ArrayList<PrescriptionVO> getExaminationList(Map<String, Integer> map);

	// 처방전 번호로 회원번호 가져오기
	public int getPrescriptionNoGuestno(int prescriptionNo);

	// 처방전 정보
	public PrescriptionVO getPrescription(int guestno);

	// 예약 글 갯수
	public int getPatientListCnt(int i);

	// 예약 글 목록
	public ArrayList<ReservationVO> getpatientList(Map<String, Integer> map);

	// 예약병원정보
	public HospitalVO getHospitalNoInfo(int hospitalno);

	// 예약번호로 환자번호 가져오기
	public int reservationNoguestno(int reservationNo);

	// 예약정보 
	public ReservationVO reservationInfo(int guestno);

	//게스트 번호로 건강검진번호 가져오기
	public CheckupVO getCheckupGuestno(int guestno);
	
	// 게스트 번호로 의사번호 가져오기
	public int doctornoGuestno(int guestno);

	// 게스트 번호로 건강검진 가져오기
	public int getCheckupListGuestno(int guestno);

	// 검사 결과 수정
	public int checkupUpdate(CheckupVO vo);

	// 검사의뢰 번호
	public int getCheckupListno();

	// 검사결과번호 
	int getCheckupCheckupList(int checkuplist);

	ArrayList<PrescriptionVO> aaa(int prescriptionNo);

	// 검진 번호
	public int getCheckupListCheckup(int checkup);

	// 로그인 승인
	public int doctorappro(Map<String, Object> map);

	// 포인트 글 갯수
	public int getPointManageCnt(int i);

	// 포인트 글 목록
	public ArrayList<PointVO> getPointManageList(Map<String, Integer> map);

	//
	
	

	
	
	


	
	
}
