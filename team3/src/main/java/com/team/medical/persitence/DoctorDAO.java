package com.team.medical.persitence;

import java.util.Map;

import com.team.medical.vo.CheckupListVO;
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
	public HospitalVO getMyhospitalInfo(String doctorno);

	// 의사 번호 가져오기
	public int getMyInfo(String id);

	// 의사 정보 가져오기
	public DoctorVO getDocInfo(String id);
	
	// 제휴병원 중복확인
    public int chkHospital(String hospitalphone);
   
   // 병원정보 (병원번호)
    public HospitalVO getHospitalInfo(String hospitalphone);
   
   // 병원정보 수정
    public int updateHospital(HospitalVO vo);

    // 검사의뢰서 등록
	public CheckupListVO checkListInput();

	// 일반 회원 정보
	//public GuestVO getcusInfo(String id);
}
