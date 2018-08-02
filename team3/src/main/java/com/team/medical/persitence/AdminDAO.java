package com.team.medical.persitence;

import java.util.ArrayList;
import java.util.Map;

import com.team.medical.vo.DiseaseVO;
import com.team.medical.vo.DrugVO;
import com.team.medical.vo.EventVO;
import com.team.medical.vo.ExerciseVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.PreventionVO;

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
	public int memberdeletePro(int num);

	// 일반탈퇴회원 다중삭제 처리
	public int memberChkdeletePro(String[] checkOne);
	
//---------------------------------------------------------------------------------------
	
	// 약 목록 개수 구하기
	public int getDrugListCnt();
	
	// 약 목록 조회
	public ArrayList<DrugVO> getDrugList(Map<String, Object> map);
	
//---------------------------------------------------------------------------------------	
	
	// 질병 목록 개수 구하기
	public int getDiseaseListCnt();
	
	// 질병 목록 조회
	public ArrayList<DiseaseVO> getDiseaseList(Map<String, Object> map);
	
	// 질병삭제 처리
	public int diseasedeletePro(int num);

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
	public int exercisedeletePro(String num);
	
	// 운동 다중삭제 처리
	public int exerciseChkdeletePro(String[] checkOne);
	
	// 운동검색목록 개수 구하기
	public int search_exerciseListCnt(Map<String, Object> map);

	// 운동검색목록 조회
	public ArrayList<ExerciseVO> search_exerciseList(Map<String, Object> map);

	// 운동 추가 처리
	public int exerciseAdd(ExerciseVO dto);

	// 운동 수정 폼
	public ExerciseVO exerciseModify(String exerciseName);

	// 운동 수정 처리
	public int exerciseModifyPro(ExerciseVO dto);
	
//---------------------------------------------------------------------------------------
	
	// 예방정보 목록 개수 구하기
	public int getApreventionListCnt();
	
	// 예방정보 목록 조회
	public ArrayList<PreventionVO> getApreventionList(Map<String, Object> map);

	// 예방정보 목록 조회
	public ArrayList<DiseaseVO> getApreventionList2(Map<String, Object> map);

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
}
