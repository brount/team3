package com.team.medical.persitence;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DoctorDAOImpl implements DoctorDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int doctorLogin(Map<String, String> map) {
		int loginCnt=0;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		loginCnt=dao.doctorLogin(map);
		
		return loginCnt;
	}
	
}
