package com.team.medical.persitence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.medical.vo.DrugVO;
import com.team.medical.vo.GuestVO;

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
		System.out.println("일반제제회원검색목록갯수 : " + selectCnt);
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

	
	//일반탈퇴회원 삭제페이지
	@Override
	public int memberdeletePro(int num) {
		System.out.println("삭제할 회원 번호 : " + num);

		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		int deleteCnt = dao.memberdeletePro(num);
		
		System.out.println(deleteCnt == 1 ? "삭제성공" : "삭제실패");
		
		return deleteCnt;
	}
	

    //일반탈퇴회원 다중삭제페이지
    @Override
    public int memberChkdeletePro(String[] chk) {
    	AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
  	  	int deleteCnt = 0;
  	  	for (int i = 0; i < chk.length; i++) {
  	  		deleteCnt = dao.memberdeletePro(Integer.parseInt(chk[i]));
  	  	}

  	  	return deleteCnt;
    }

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
}
