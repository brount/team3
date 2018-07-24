package com.team.medical.persitence;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.medical.vo.DoctorVO;
import com.team.medical.vo.HospitalVO;

@Repository
public class DoctorDAOImpl implements DoctorDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int doctorLogin(Map<String, String> map) {
		int selectCnt = 0;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		selectCnt = dao.doctorLogin(map);
		
		int idChkCnt =dao.idCheck((String)map.get("id"));
		
		// 로그인한 id에 해당하는 데이터가 있고
		if(idChkCnt == 1) {
			int pwdChkCnt = dao.doctorLogin(map);
			
			//패스워드가 일치하면 selectCnt = 1
			if(pwdChkCnt == 1) {
				selectCnt = 1;
				
				//패스워드가일치하지 않으면 selectCnt = -1
			} else {
				selectCnt = -1;
			}
		}
		
		return selectCnt;
	}
	
	//아이디 체크
	@Override
	public int idCheck(String id) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.idCheck(id);
		
		return cnt;
	}
	
	//회원가입 정보 넣기
	@Override
	public int insertMember(DoctorVO vo) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.insertMember(vo);
		return cnt;
	}


	//회원 정보 수정
	@Override
	public int updateMemberInfo(DoctorVO vo) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int updateCnt = dao.updateMemberInfo(vo);
		return updateCnt;
	}

	@Override
	public int deleteMember(String id) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int deleteCnt = dao.deleteMember(id);
		return deleteCnt;
	}

	@Override
	public int insertHospitalInfo(HospitalVO vo) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.insertHospitalInfo(vo);
		return cnt;
	}

	public int getMyInfo(String id) {
		
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int selectCnt = dao.getMyInfo(id);
		return selectCnt;
	}
	
	@Override
	public HospitalVO getMyhospitalInfo(int doctorno) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		HospitalVO selectCnt = dao.getMyhospitalInfo(doctorno);
		
		return selectCnt;
	}
	
	

	/*//일반 회원 정보
	@Override
	public GuestVO getcusInfo(String id) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		GuestVO cnt = dao.getcusInfo(id);
		return cnt;
	}*/
	
}
