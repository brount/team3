package com.team.medical.persitence;

import java.util.ArrayList;
import java.util.Map;

import com.team.medical.vo.DrugVO;
import com.team.medical.vo.GuestVO;

public interface AdminDAO {
	// 관리자 로그인
	public int adminLoginPro(Map<String,String> map);
//---------------------------------------------------------------------------------------
	
	// 일반회원목록 개수 구하기
	public int getMemberListCnt();
		
	// 일반회원목록 조회
	public ArrayList<GuestVO> getMemberList(Map<String, Object> map);
	
//---------------------------------------------------------------------------------------	
	
	// 일반회원검색목록 개수 구하기
	public int search_memberCnt(Map<String, Object> map);
	
	// 일반회원검색목록 조회
	public ArrayList<GuestVO> search_member(Map<String, Object> map);
	
//---------------------------------------------------------------------------------------
	
	// 일반제제회원목록 개수 구하기
	public int getMembersanctionsListCnt();
	
	// 일반제제회원목록 조회
	public ArrayList<GuestVO> getMembersanctionsList(Map<String, Object> map);

//---------------------------------------------------------------------------------------
	
	// 일반제제회원검색목록 개수 구하기
	public int search_membersanctionsListCnt(Map<String, Object> map);
	
	// 일반제제회원검색목록 조회
	public ArrayList<GuestVO> search_membersanctionsList(Map<String, Object> map);

//---------------------------------------------------------------------------------------
	
	// 일반탈퇴회원목록 개수 구하기
	public int getMembersecessionListCnt();
	
	// 일반탈퇴회원목록 조회
	public ArrayList<GuestVO> getMembersecessionList(Map<String, Object> map);

//---------------------------------------------------------------------------------------
	
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
}
