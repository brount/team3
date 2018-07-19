package com.team.medical.persitence;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GuestDAOImpl implements GuestDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int guestLogin(Map<String, String> map) {
		int loginCnt=0;
		GuestDAO dao = sqlSession.getMapper(GuestDAO.class);
		loginCnt=dao.guestLogin(map);
		
		return loginCnt;
	}

}
