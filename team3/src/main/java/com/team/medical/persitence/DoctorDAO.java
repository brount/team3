package com.team.medical.persitence;

import java.util.Map;

import com.team.medical.vo.DoctorVO;
import com.team.medical.vo.HospitalVO;

public interface DoctorDAO {
	
	public int doctorLogin(Map<String,String> map);
	
	//아이디 체크
	public int idCheck(String id);
	
	//회원 정보 삽입
	public int insertMember(DoctorVO vo);

	//회원 정보 수정
	public int updateMemberInfo(DoctorVO vo);

	//의사 회원 탈퇴
	public int deleteMember(String id);

	// 내 병원 정보 입력
	public int insertHospitalInfo(HospitalVO vo);

	// 내 병원 정보 가져오기
	public HospitalVO getMyhospitalInfo(int doctorno);

	// 내 정보 가져오기
	public int getMyInfo(String id);
	
	// 일반 회원 정보
	//public GuestVO getcusInfo(String id);
}
