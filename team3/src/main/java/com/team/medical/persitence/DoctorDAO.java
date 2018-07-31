package com.team.medical.persitence;

import java.util.ArrayList;
import java.util.Map;

import com.team.medical.vo.CheckupListVO;
import com.team.medical.vo.CheckupVO;
import com.team.medical.vo.DoctorVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.HospitalVO;
import com.team.medical.vo.HpVO;

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
	public int getdocnoInfo(String id);

	// 의사 정보 가져오기
	public DoctorVO getDocInfo(String id);
	
	// 제휴병원 중복확인
    public int chkHospital(String hospitalphone);
   
    // 병원정보 (병원번호)
    public HospitalVO getHospitalInfo(String hospitalphone);
   
    // 일반병원정보
    public HpVO getHpInfo(String hospitalphone);
    
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

	


	
	
}
