package com.team.medical.persitence;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int adminLoginPro(Map<String, String> map) {
		int loginCnt=0;
		AdminDAO dao = sqlSession.getMapper(AdminDAO.class);
		loginCnt=dao.adminLoginPro(map);
		
		return loginCnt;
	}
}
