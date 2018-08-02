package com.team.medical.persitence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.medical.vo.DiseaseVO;
import com.team.medical.vo.DrugVO;
import com.team.medical.vo.EventVO;
import com.team.medical.vo.ExerciseVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.PreventionVO;

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
	public int memberdeletePro(int num) {
		System.out.println("삭제할 회원 번호 : " + num);

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int deleteCnt = dao.memberdeletePro(num);
		
		System.out.println(deleteCnt == 1 ? "삭제성공" : "삭제실패");
		
		return deleteCnt;
	}
	
    // 일반탈퇴회원 다중삭제페이지
    @Override
    public int memberChkdeletePro(String[] chk) {
    	AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
  	  	int deleteCnt = 0;
  	  	for (int i = 0; i < chk.length; i++) {
  	  		deleteCnt = dao.memberdeletePro(Integer.parseInt(chk[i]));
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
 	
    // 약 목록 개수 구하기
	@Override
	public int getDrugListCnt() {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		int selectCnt = dao.getDrugListCnt();

		return selectCnt;
	}

	// 약 목록 조회
	@Override
	public ArrayList<DrugVO> getDrugList(Map<String, Object> map) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		ArrayList<DrugVO> dtos = dao.getDrugList(map);

		return dtos;
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
	public int diseasedeletePro(int num) {
		System.out.println("삭제할 회원 번호 : " + num);

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int deleteCnt = dao.diseasedeletePro(num);
		
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
		System.out.println("질병검색목록목록갯수 : " + selectCnt);
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

		int selectCnt = dao.getDiseaseListCnt();

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
	public int exercisedeletePro(String num) {

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int deleteCnt = dao.exercisedeletePro(num);
		
		System.out.println(deleteCnt == 1 ? "삭제성공" : "삭제실패");
		
		return deleteCnt;
	}

	// 운동목록 다중삭제
	@Override
	public int exerciseChkdeletePro(String[] chk) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
  	  	int deleteCnt = 0;
  	  	for (int i = 0; i < chk.length; i++) {
  	  		deleteCnt = dao.exercisedeletePro(chk[i]);
  	  	}

  	  	return deleteCnt;
	}

	// 운동검색목록 개수구하기
	@Override
	public int search_exerciseListCnt(Map<String, Object> map) {
		int selectCnt = 0;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		selectCnt = dao.search_exerciseListCnt(map);
		System.out.println("운동검색목록목록갯수 : " + selectCnt);
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
	public int exerciseAdd(ExerciseVO dto) {
		
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int insertCnt = dao.exerciseAdd(dto);
       
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

	
//---------------------------------------------------------------------------------------	
	
	// 예방정보 개수 구하기
	@Override
	public int getApreventionListCnt() {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		int selectCnt = dao.getApreventionListCnt();

		return selectCnt;
	}

	// 예방정보 목록 조회
	@Override
	public ArrayList<PreventionVO> getApreventionList(Map<String, Object> map) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		ArrayList<PreventionVO> dtos = dao.getApreventionList(map);

		return dtos;
	}

	// 예방정보 목록 조회2
	@Override
	public ArrayList<DiseaseVO> getApreventionList2(Map<String, Object> map) {
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);

		ArrayList<DiseaseVO> dtos = dao.getApreventionList2(map);

		return dtos;
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
}
