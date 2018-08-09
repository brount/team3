package com.team.medical.persitence;

import java.util.ArrayList;
import java.util.Map;

import com.team.medical.vo.DiseaseVO;
import com.team.medical.vo.DoctorVO;
import com.team.medical.vo.DrugVO;
import com.team.medical.vo.EventVO;
import com.team.medical.vo.ExerciseVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.HospitalVO;
import com.team.medical.vo.PointVO;
import com.team.medical.vo.QuestionBoardVO;

public interface AdminDAO {
	// 관리자 로그인
	public int adminLoginPro(Map<String,String> map);
//---------------------------------------------------------------------------------------
	
	// 일반회원목록 개수 구하기
	public int getMemberListCnt();
		
	// 일반회원목록 조회
	public ArrayList<GuestVO> getMemberList(Map<String, Object> map);
	
	// 일반회원검색목록 개수 구하기
	public int search_memberCnt(Map<String, Object> map);
	
	// 일반회원검색목록 조회
	public ArrayList<GuestVO> search_member(Map<String, Object> map);
	
	// 일반회원제제관리
	public GuestVO membersanctionManage(int guestNo);
	
	// 일반회원제제관리 처리
	public int membersanctionManagePro(GuestVO dto);
	
	// 일반제제회원목록 개수 구하기
	public int getMembersanctionsListCnt();
	
	// 일반제제회원목록 조회
	public ArrayList<GuestVO> getMembersanctionsList(Map<String, Object> map);

	// 일반제제회원검색목록 개수 구하기
	public int search_membersanctionsListCnt(Map<String, Object> map);
	
	// 일반제제회원검색목록 조회
	public ArrayList<GuestVO> search_membersanctionsList(Map<String, Object> map);

	// 일반탈퇴회원목록 개수 구하기
	public int getMembersecessionListCnt();
	
	// 일반탈퇴회원목록 조회
	public ArrayList<GuestVO> getMembersecessionList(Map<String, Object> map);

	// 일반탈퇴회원검색목록 개수 구하기
	public int search_membersecessionListCnt(Map<String, Object> map);
	
	// 일반탈퇴회원검색목록 조회
	public ArrayList<GuestVO> search_membersecessionList(Map<String, Object> map);
	
	// 일반탈퇴회원삭제 처리
	public int memberdeletePro(int guestNo);

	// 일반탈퇴회원 다중삭제 처리
	public int memberChkdeletePro(String[] checkOne);
	
//---------------------------------------------------------------------------------------
	
	// 의사회원목록 개수 구하기
	public int getDoctorListCnt();
	
	// 의사회원목록 조회
	public ArrayList<DoctorVO> getDoctorList(Map<String, Object> map);
	
	// 의사회원검색목록 개수 구하기
	public int search_doctorCnt();
	
	// 의사회원검색목록 조회
	public ArrayList<DoctorVO> search_doctor(Map<String, Object> map2);
	
	// 의사회원 승인대기목록 개수 구하기
	public int getDoctorPermissionListCnt();
	
	// 의사회원 승인대기목록 조회
	public ArrayList<DoctorVO> getDoctorPermissionList(Map<String, Object> map);
	
	/*
	// 의사회원 승인대기 검색목록 개수 구하기
	public int search_doctorPermissionCnt();
	
	// 의사회원 승인대기 검색목록 조회
	public ArrayList<DoctorVO> search_doctorPermission(Map<String, Object> map2);
	*/
	
	
	/*
	// 의사회원 제제목록페이지 개수 구하기
	public int getDoctorSanctionListCnt();

	// 의사회원 제제목록페이지 
	public ArrayList<DoctorVO> getDoctorSanctionList(Map<String, Object> map);

	// 의사회원 제제목록 검색페이지 개수 구하기
	public int search_doctorSanctionCnt();

	// 의사회원 제제목록 검색페이지
	public ArrayList<DoctorVO> search_doctorSanction(Map<String, Object> map2);
	*/
	
	
	// 의사탈퇴회원 목록 개수 구하기
	public int getDoctorSecessionListCnt();
	
	// 의사탈퇴회원 목록
	public ArrayList<DoctorVO> getDoctorSecessionList(Map<String, Object> map);

	// 의사탈퇴회원 검색목록 개수 구하기
	public int search_doctorSecessionCnt();

	// 의사탈퇴회원 검색목록
	public ArrayList<DoctorVO> search_doctorSecession(Map<String, Object> map2);

	// 의사회원 삭제 처리
	public int doctordeletePro(int doctorno);
	
	// 의사회원 다중삭제 처리
	public int doctorChkdeletePro(String[] checkOne);
	
	// 의사회원 승인 처리
	public int doctorPermissionPro(int doctorno);
	public int hospitalPermissionPro(Map<String, Object> map);
	
	// 의사회원 다중승인 처리
	public int doctorChkPermissionPro(String[] checkOne);

	// 의사회원 제명 처리
	public int doctorExpelPro(int doctorno);
	
	// 의사회원 다중 제명 처리
	public int doctorChkExpelPro(String[] checkOne);
	
	// 병원정보 가져오기
	public HospitalVO getHospital(int hospitalno);
	
//---------------------------------------------------------------------------------------	
	
	// 병원목록 개수 구하기
	public int getHospitalListCnt(Map<String, Object> map);
	
	// 병원목록 조회
	public ArrayList<HospitalVO> getHospitalList(Map<String, Object> map);
	
	
//---------------------------------------------------------------------------------------
	
	// 약 목록 개수 구하기
	public int getDrugListCnt();
	
	// 약 목록 조회
	public ArrayList<DrugVO> getDrugList(Map<String, Object> map);
	
	// 약삭제 처리
	public int drugdeletePro(int drugCode);

	// 약 다중삭제 처리
	public int drugChkdeletePro(String[] checkOne);
	
	// 약검색목록 개수 구하기
	public int search_drugListCnt(Map<String, Object> map);
	
	// 약검색목록 조회
	public ArrayList<DrugVO> search_drugList(Map<String, Object> map);

	// 약 추가 처리
	public int drugAddPro(DrugVO dto);
	
	// 약 수정 폼
	public DrugVO drugModify(int drugCode);
	
	// 약 수정 처리
	public int drugModifyPro(DrugVO dto);
	
//---------------------------------------------------------------------------------------	
	
	// 질병 목록 개수 구하기
	public int getDiseaseListCnt();
	
	// 질병 목록 조회
	public ArrayList<DiseaseVO> getDiseaseList(Map<String, Object> map);
	
	// 질병삭제 처리
	public int diseasedeletePro(int diseaseCode);

	// 질병 다중삭제 처리
	public int diseaseChkdeletePro(String[] checkOne);
	
	// 질병검색목록 개수 구하기
	public int search_diseaseListCnt(Map<String, Object> map);
	
	// 질병검색목록 조회
	public ArrayList<DiseaseVO> search_diseaseList(Map<String, Object> map);

	// 질병 추가 처리
	public int diseaseAdd(DiseaseVO dto);
	
	// 질병 수정 폼
	public DiseaseVO diseaseModify(int diseaseCode);
	
	// 질병 수정 처리
	public int diseaseModifyPro(DiseaseVO dto);

//---------------------------------------------------------------------------------------
	
	// 운동 목록 개수 구하기
	public int getExerciseListCnt();

	// 운동 목록 조회
	public ArrayList<ExerciseVO> getExerciseList(Map<String, Object> map);

	// 운동 삭제 처리
	public int exerciseDeletePro(String exerciseName);
	
	// 운동 다중삭제 처리
	public int exerciseChkDeletePro(String[] checkOne);
	
	// 운동검색목록 개수 구하기
	public int search_exerciseListCnt(Map<String, Object> map);

	// 운동검색목록 조회
	public ArrayList<ExerciseVO> search_exerciseList(Map<String, Object> map);

	// 운동 추가 처리
	public int exerciseAddPro(ExerciseVO dto);

	// 운동 수정 폼
	public ExerciseVO exerciseModify(String exerciseName);

	// 운동 수정 처리
	public int exerciseModifyPro(ExerciseVO dto);
	
	//------------------------------------- 희성
	// 이벤트 추가
	public int addEvent(EventVO dto);
	// 이벤트 수정
	public int upEvent(EventVO dto);
	// 이벤트 삭제
	public int delEvent(int num);

	// 일반탈퇴회원 다중삭제 처리
	public int delChkEvent(String[] checkOne);
	//------------------------------------- 희성

	// 포인트목록 개수 구하기
	public int getPointListCnt(int status);

	// 포인트목록 조회1
	public ArrayList<PointVO> getPointList(Map<String, Object> map);

	//-------------------------------------
	// 공지사항 상세보기
	public QuestionBoardVO adminReportInfo(int num);
	// 공지사항 수정
	public int adminReportModifyPro(QuestionBoardVO dto);
	// 신고게시판 글 삭제
	public int adminReportDeletePro(int num);
	// 신고게시판 글 다중 삭제
	public int adminReportDeleteProChek(String[] chk);

}
