package com.team.medical.persitence;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.medical.vo.DiseaseVO;
import com.team.medical.vo.DoctorVO;
import com.team.medical.vo.DrugVO;
import com.team.medical.vo.EventVO;
import com.team.medical.vo.ExerciseVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.HospitalVO;
import com.team.medical.vo.PointVO;
import com.team.medical.vo.QuestionBoardVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	SqlSession sqlSession;

	// 관리자 로그인
	@Override
	public int adminLoginPro(Map<String, String> map) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		int loginCnt = dao.adminLoginPro(map);

		return loginCnt;
	}

	// 일반회원목록 갯수 구하기
	@Override
	public int getMemberListCnt() {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		int selectCnt = dao.getMemberListCnt();

		return selectCnt;
	}

	// 일반회원목록 조회
	@Override
	public ArrayList<GuestVO> getMemberList(Map<String, Object> map) {

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		ArrayList<GuestVO> dtos = dao.getMemberList(map);

		return dtos;
	}

	// 일반회원검색목록 갯수 구하기
	@Override
	public int search_memberCnt(Map<String, Object> map) {
		int selectCnt = 0;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		selectCnt = dao.search_memberCnt(map);
		System.out.println("일반회원검색목록갯수 : " + selectCnt);
		return selectCnt;
	}

	// 일반회원검색목록 조회
	@Override
	public ArrayList<GuestVO> search_member(Map<String, Object> map) {
		ArrayList<GuestVO> dtos = null;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		dtos = dao.search_member(map);
		return dtos;
	}

	// 일반제제회원목록 갯수 구하기
	@Override
	public int getMembersanctionsListCnt() {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		int selectCnt = dao.getMembersanctionsListCnt();

		return selectCnt;
	}
	
	// 일반제제회원목록 조회
	@Override
	public ArrayList<GuestVO> getMembersanctionsList(Map<String, Object> map) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		ArrayList<GuestVO> dtos = dao.getMembersanctionsList(map);

		return dtos;
	}

	// 일반제제회원검색목록 갯수 구하기
	@Override
	public int search_membersanctionsListCnt(Map<String, Object> map) {
		int selectCnt = 0;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		selectCnt = dao.search_membersanctionsListCnt(map);
		System.out.println("일반제제회원검색목록갯수 : " + selectCnt);
		return selectCnt;
	}

	// 일반제제회원검색목록 조회
	@Override
	public ArrayList<GuestVO> search_membersanctionsList(Map<String, Object> map) {
		ArrayList<GuestVO> dtos = null;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		dtos = dao.search_membersanctionsList(map);
		return dtos;
	}

	// 일반탈퇴회원목록갯수 구하기
	@Override
	public int getMembersecessionListCnt() {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		int selectCnt = dao.getMembersecessionListCnt();

		return selectCnt;
	}

	// 일반탈퇴회원목록 조회
	@Override
	public ArrayList<GuestVO> getMembersecessionList(Map<String, Object> map) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		ArrayList<GuestVO> dtos = dao.getMembersecessionList(map);

		return dtos;
	}

	// 일반탈퇴회원검색목록 개수 구하기
	@Override
	public int search_membersecessionListCnt(Map<String, Object> map) {
		int selectCnt = 0;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		selectCnt = dao.search_membersecessionListCnt(map);
		System.out.println("일반탈퇴회원검색목록갯수 : " + selectCnt);
		return selectCnt;
	}
	
	// 일반탈퇴회원검색목록 조회
	@Override
	public ArrayList<GuestVO> search_membersecessionList(Map<String, Object> map) {
		ArrayList<GuestVO> dtos = null;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		dtos = dao.search_membersecessionList(map);
		return dtos;
	}

	// 일반탈퇴회원 삭제페이지
	@Override
	public int memberdeletePro(int guestNo) {
		System.out.println("삭제할 회원 번호 : " + guestNo);

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int deleteCnt = dao.memberdeletePro(guestNo);
		
		System.out.println(deleteCnt == 1 ? "삭제성공" : "삭제실패");
		
		return deleteCnt;
	}
	
    // 일반탈퇴회원 다중삭제페이지
    @Override
    public int memberChkdeletePro(String[] checkOne) {
    	AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
  	  	int deleteCnt = 0;
  	  	for (int i = 0; i < checkOne.length; i++) {
  	  		deleteCnt = dao.memberdeletePro(Integer.parseInt(checkOne[i]));
  	  	}

  	  	return deleteCnt;
    }

    // 일반회원관리페이지 조회
    @Override
	public GuestVO membersanctionManage(int guestNo) {
    	AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
    	
    	GuestVO dto = dao.membersanctionManage(guestNo);
 		
 		return dto;
	}
 	
    // 일반회원제제관리 처리
 	@Override
 	public int membersanctionManagePro(GuestVO dto) {
 		
 		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
 		
 		int updateCnt = dao.membersanctionManagePro(dto);
 		
 		System.out.println(updateCnt==1 ? "수정 성공":"수정 실패");
 	    
 		return updateCnt;
 	}
    
//---------------------------------------------------------------------------------------
 	
 	// 의사회원목록 갯수 구하기
 	@Override
 	public int getDoctorListCnt() {
 		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

 		int selectCnt = dao.getDoctorListCnt();

 		return selectCnt;
 	}

 	// 의사회원목록 조회
 	@Override
 	public ArrayList<DoctorVO> getDoctorList(Map<String, Object> map) {

 		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

 		ArrayList<DoctorVO> dtos = dao.getDoctorList(map);

 		return dtos;
 	}

  	
  	// 의사회원검색목록 개수 구하기
  	@Override
	public int search_doctorCnt() {
  		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

 		int selectCnt = dao.search_doctorCnt();

 		return selectCnt;
	}

  	// 의사회원검색목록 조회
	@Override
	public ArrayList<DoctorVO> search_doctor(Map<String, Object> map2) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

 		ArrayList<DoctorVO> dtos = dao.search_doctor(map2);

 		return dtos;
	}
 	
	// 의사회원 승인대기 목록 개수 구하기
	@Override
	public int getDoctorPermissionListCnt() {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

 		int selectCnt = dao.getDoctorPermissionListCnt();

 		return selectCnt;
	}

	// 의사회원 승인대기 목록
	@Override
	public ArrayList<DoctorVO> getDoctorPermissionList(Map<String, Object> map) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

 		ArrayList<DoctorVO> dtos = dao.getDoctorPermissionList(map);

 		return dtos;
	}

	// 의사탈퇴회원 개수 구하기
	@Override
	public int getDoctorSecessionListCnt() {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

 		int selectCnt = dao.getDoctorSecessionListCnt();

 		return selectCnt;
	}

	// 의사탈퇴회원 목록 조회
	@Override
	public ArrayList<DoctorVO> getDoctorSecessionList(Map<String, Object> map) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

 		ArrayList<DoctorVO> dtos = dao.getDoctorSecessionList(map);

 		return dtos;
	}

	// 의사탈퇴회원 검색개수 구하기
	@Override
	public int search_doctorSecessionCnt() {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

 		int selectCnt = dao.search_doctorSecessionCnt();

 		return selectCnt;
	}

	// 의사탈퇴회원 검색목록 조회
	@Override
	public ArrayList<DoctorVO> search_doctorSecession(Map<String, Object> map2) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

 		ArrayList<DoctorVO> dtos = dao.search_doctorSecession(map2);

 		return dtos;
	}
	
	// 의사회원 삭제 처리
	@Override
	public int doctordeletePro(int doctorno) {
		System.out.println("삭제할 회원 번호 : " + doctorno);

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int deleteCnt = dao.doctordeletePro(doctorno);
		
		System.out.println(deleteCnt == 1 ? "삭제성공" : "삭제실패");
		
		return deleteCnt;
	}
	
	// 의사회원 다중 삭제 처리
	@Override
	public int doctorChkdeletePro(String[] checkOne) {
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
  	  	int deleteCnt = 0;
  	  	for (int i = 0; i < checkOne.length; i++) {
  	  		deleteCnt = dao.doctordeletePro(Integer.parseInt(checkOne[i]));
  	  	}

  	  	return deleteCnt;
	}
	
	// 의사회원 승인 처리
	@Override
	public int doctorPermissionPro(int doctorno) {
		System.out.println("승인할 회원 번호 : " + doctorno);

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		
		int updateCnt = dao.doctorPermissionPro(doctorno);
		
		System.out.println(updateCnt == 1 ? "승인성공" : "승인실패");
		
		return updateCnt;
	}
	
	// 의사회원 승인 처리시 병원제휴 처리
	@Override
	public int hospitalPermissionPro(HospitalVO hodto) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		
		int updateCnt = dao.hospitalPermissionPro(hodto);
		
		return updateCnt;
	}


	// 의사회원 제명 처리
	@Override
	public int doctorExpelPro(DoctorVO dodto) {
		System.out.println("제명할 회원 번호 : " + dodto.getDoctorno());

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int updateCnt = dao.doctorExpelPro(dodto);
		
		System.out.println(updateCnt == 1 ? "제명성공" : "제명실패");
		
		return updateCnt;
	}

	// 의사회원목록 병원정보
	@Override
	public HospitalVO getHospital(int hospitalno) {
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		
		HospitalVO dto = dao.getHospital(hospitalno);
		
		return dto;
	}


//---------------------------------------------------------------------------------------	
	
	// 병원목록 개수 구하기
	@Override
	public int getHospitalListCnt(Map<String, Object> map) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		int selectCnt = dao.getHospitalListCnt(map);

		return selectCnt;
	}

	// 병원목록 조회
	@Override
	public ArrayList<HospitalVO> getHospitalList(Map<String, Object> map) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		ArrayList<HospitalVO> dtos = dao.getHospitalList(map);

		return dtos;
	}

	// 병원정보 수정
	public int hospitalModifyPro(HospitalVO dto) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int updateCnt = dao.hospitalModifyPro(dto);
       
		System.out.println("updateCnt : " + updateCnt);
		System.out.println(updateCnt==1 ? "수정 성공":"수정 실패");
            
		return updateCnt;
	}
//---------------------------------------------------------------------------------------
 	
    // 약 목록 개수 구하기
	@Override
	public int adminGetDrugListCnt() {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		int selectCnt = dao.adminGetDrugListCnt();

		return selectCnt;
	}

	// 약 목록 조회
	@Override
	public ArrayList<DrugVO> adminGetDrugList(Map<String, Object> map) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		ArrayList<DrugVO> dtos = dao.adminGetDrugList(map);

		return dtos;
	}

	// 약목록 삭제
	@Override
	public int drugdeletePro(int drugCode) {
		System.out.println("삭제할 약 번호 : " + drugCode);

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int deleteCnt = dao.drugdeletePro(drugCode);
		
		System.out.println(deleteCnt == 1 ? "삭제성공" : "삭제실패");
		
		return deleteCnt;
	}

	// 약목록 다중삭제
	@Override
	public int drugChkdeletePro(String[] chk) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
  	  	int deleteCnt = 0;
  	  	for (int i = 0; i < chk.length; i++) {
  	  		deleteCnt = dao.drugdeletePro(Integer.parseInt(chk[i]));
  	  	}

  	  	return deleteCnt;
	}

	// 약검색목록 개수구하기
	@Override
	public int search_drugListCnt(Map<String, Object> map) {
		int selectCnt = 0;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		selectCnt = dao.search_drugListCnt(map);
		System.out.println("약검색목록개수 : " + selectCnt);
		return selectCnt;
	}

	// 약검색목록 조회
	@Override
	public ArrayList<DrugVO> search_drugList(Map<String, Object> map) {
		ArrayList<DrugVO> dtos = null;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		dtos = dao.search_drugList(map);
		return dtos;
	}

	// 약 추가 처리
	@Override
	public int drugAddPro(DrugVO dto) {
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int insertCnt = dao.drugAddPro(dto);
       
		System.out.println(insertCnt==1 ? "추가 성공":"추가 실패");
            
		return insertCnt;
	}

	// 약 수정 폼
	@Override
	public DrugVO drugModify(int drugCode) {

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		DrugVO dto = dao.drugModify(drugCode);
		
		return dto;
	}
	
	// 약 수정 처리
	@Override
	public int drugModifyPro(DrugVO dto) {
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int updateCnt = dao.drugModifyPro(dto);
       
		System.out.println("updateCnt : " + updateCnt);
		System.out.println(updateCnt==1 ? "수정 성공":"수정 실패");
            
		return updateCnt;
	}
	
//---------------------------------------------------------------------------------------
	
	// 질병목록 개수
	@Override
	public int getDiseaseListCnt() {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		int selectCnt = dao.getDiseaseListCnt();

		return selectCnt;
	}

	// 질병목록 조회
	@Override
	public ArrayList<DiseaseVO> getDiseaseList(Map<String, Object> map) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		ArrayList<DiseaseVO> dtos = dao.getDiseaseList(map);

		return dtos;
	}

	// 질병목록 삭제
	@Override
	public int diseasedeletePro(int diseaseCode) {
		System.out.println("삭제할 질병 번호 : " + diseaseCode);

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int deleteCnt = dao.diseasedeletePro(diseaseCode);
		
		System.out.println(deleteCnt == 1 ? "삭제성공" : "삭제실패");
		
		return deleteCnt;
	}

	// 질병목록 다중삭제
	@Override
	public int diseaseChkdeletePro(String[] chk) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
  	  	int deleteCnt = 0;
  	  	for (int i = 0; i < chk.length; i++) {
  	  		deleteCnt = dao.diseasedeletePro(Integer.parseInt(chk[i]));
  	  	}

  	  	return deleteCnt;
	}

	// 질병검색목록 개수구하기
	@Override
	public int search_diseaseListCnt(Map<String, Object> map) {
		int selectCnt = 0;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		selectCnt = dao.search_diseaseListCnt(map);
		System.out.println("질병검색목록갯수 : " + selectCnt);
		return selectCnt;
	}

	// 질병검색목록 조회
	@Override
	public ArrayList<DiseaseVO> search_diseaseList(Map<String, Object> map) {
		ArrayList<DiseaseVO> dtos = null;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		dtos = dao.search_diseaseList(map);
		return dtos;
	}

	// 질병 추가 처리
	@Override
	public int diseaseAdd(DiseaseVO dto) {
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int insertCnt = dao.diseaseAdd(dto);
       
		System.out.println(insertCnt==1 ? "추가 성공":"추가 실패");
            
		return insertCnt;
	}

	// 질병 수정 폼
	@Override
	public DiseaseVO diseaseModify(int diseaseCode) {

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		DiseaseVO dto = dao.diseaseModify(diseaseCode);
		
		return dto;
	}
	
	// 질병 수정 처리
	@Override
	public int diseaseModifyPro(DiseaseVO dto) {
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int updateCnt = dao.diseaseModifyPro(dto);
       
		System.out.println("updateCnt : " + updateCnt);
		System.out.println(updateCnt==1 ? "수정 성공":"수정 실패");
            
		return updateCnt;
	}

//---------------------------------------------------------------------------------------

	// 운동목록 개수
	@Override
	public int getExerciseListCnt() {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		int selectCnt = dao.getExerciseListCnt();

		return selectCnt;
	}

	// 운동목록 조회
	@Override
	public ArrayList<ExerciseVO> getExerciseList(Map<String, Object> map) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		ArrayList<ExerciseVO> dtos = dao.getExerciseList(map);

		return dtos;
	}

	// 운동목록 삭제
	@Override
	public int exerciseDeletePro(String exerciseName) {

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int deleteCnt = dao.exerciseDeletePro(exerciseName);
		
		System.out.println(deleteCnt == 1 ? "삭제성공" : "삭제실패");
		
		return deleteCnt;
	}

	// 운동목록 다중삭제
	@Override
	public int exerciseChkDeletePro(String[] chk) {
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
  	  	int deleteCnt = 0;
  	  	for (int i = 0; i < chk.length; i++) {
  	  		deleteCnt = dao.exerciseDeletePro(chk[i]);
  	  	}

  	  	return deleteCnt;
	}

	// 운동검색목록 개수구하기
	@Override
	public int search_exerciseListCnt(Map<String, Object> map) {
		int selectCnt = 0;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		selectCnt = dao.search_exerciseListCnt(map);
		System.out.println("운동검색목록갯수 : " + selectCnt);
		return selectCnt;
	}

	// 운동검색목록 조회
	@Override
	public ArrayList<ExerciseVO> search_exerciseList(Map<String, Object> map) {
		ArrayList<ExerciseVO> dtos = null;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		dtos = dao.search_exerciseList(map);
		return dtos;
	}

	// 운동 추가 처리
	@Override
	public int exerciseAddPro(ExerciseVO dto) {
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int insertCnt = dao.exerciseAddPro(dto);
       
		System.out.println(insertCnt==1 ? "추가 성공":"추가 실패");
            
		return insertCnt;
	}

	// 운동 수정 폼
	@Override
	public ExerciseVO exerciseModify(String exerciseName) {

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		ExerciseVO dto = dao.exerciseModify(exerciseName);
		
		return dto;
	}
	
	// 운동 수정 처리
	@Override
	public int exerciseModifyPro(ExerciseVO dto) {
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int updateCnt = dao.exerciseModifyPro(dto);
       
		System.out.println("updateCnt : " + updateCnt);
		System.out.println(updateCnt==1 ? "수정 성공":"수정 실패");
            
		return updateCnt;
	}
	//------------------------------------------------------------ 희성
	@Override
	public int addEvent(EventVO dto) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int insertCnt = dao.addEvent(dto);
		return insertCnt;
	}
	
	@Override
	public int upEvent(EventVO dto) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int updateCnt = dao.upEvent(dto);
       
		System.out.println("updateCnt : " + updateCnt);
		System.out.println(updateCnt==1 ? "수정 성공":"수정 실패");
		return updateCnt;
	}

	@Override
	public int delEvent(int num) {
		System.out.println("삭제할  이벤트 번호 : " + num);

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int deleteCnt = dao.delEvent(num);
		
		System.out.println(deleteCnt == 1 ? "삭제성공" : "삭제실패");
		
		return deleteCnt;
	}

	@Override
	public int delChkEvent(String[] checkOne) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
  	  	int deleteCnt = 0;
  	  	for (int i = 0; i < checkOne.length; i++) {
  	  		deleteCnt += dao.delEvent(Integer.parseInt(checkOne[i]));
  	  	}

  	  	return deleteCnt;
	}
//------------------------------------------------------------ 희성

	// 포인트목록 개수 구하기
	@Override
	public int getPointListCnt(int status) {
		int selectCnt = 0;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		selectCnt = dao.getPointListCnt(status);
		System.out.println("포인트목록 개수 : " + selectCnt);
		return selectCnt;
	}

	// 포인트목록 조회
	@Override
	public ArrayList<PointVO> getPointList(Map<String, Object> map) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

 		ArrayList<PointVO> dtos = dao.getPointList(map);

 		return dtos;
 	}

	// 포인트차트 조회
	@Override
	public int pointChart(int status) {
		
		int point = 0;
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		
		point = dao.pointChart(status);
		
		return point;
	}

//------------------------------------------------------------
	
	// 공지사항 상세보기
	@Override
	public QuestionBoardVO adminReportInfo(int num) {
		
		QuestionBoardVO cVO = new QuestionBoardVO();
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		cVO=dao.adminReportInfo(num);
		
		return cVO;
	}
	// 공지사항 수정
	@Override
	public int adminReportModifyPro(QuestionBoardVO dto) {
		
		int cnt = 0;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		cnt = dao.adminReportModifyPro(dto);
		
		return cnt;
	}
	// 신고게시판 글 삭제
	@Override
	public int adminReportDeletePro(int num) {
		
		int cnt = 0;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		cnt = dao.adminReportDeletePro(num);
		
		return cnt;
	}
	
	// 신고게시판 다중삭제
	@Override
	public int adminReportDeleteProChek(String[] chk) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
  	  	int deleteCnt = 0;
  	  	for (int i = 0; i < chk.length; i++) {
  	  		deleteCnt = dao.adminReportDeletePro(Integer.parseInt(chk[i]));
  	  	}
  	  	return deleteCnt;
	}


}
