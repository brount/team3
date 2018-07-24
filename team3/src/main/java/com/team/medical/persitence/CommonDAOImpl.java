package com.team.medical.persitence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.medical.vo.EventVO;
import com.team.medical.vo.QuestionBoardVO;

@Repository
public class CommonDAOImpl implements CommonDAO {

	@Autowired
	SqlSession sqlSession;

	// 글 갯수 구하기
	@Override
	public int getQuestionCnt(int kind) {
		int selectCnt=0;
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		selectCnt=dao.getQuestionCnt(kind);
		
		return selectCnt;
	}
	
	//게시글 목록 조회
	@Override
	public ArrayList<QuestionBoardVO> getQuestionList(Map<String,Integer> map) {		
		ArrayList<QuestionBoardVO> dtos =null ;
		
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		dtos=dao.getQuestionList(map);
		
		return dtos;
	}
	
	// 글 상세보기
	@Override
	public QuestionBoardVO getQuestion(int num) {
		QuestionBoardVO cVO = new QuestionBoardVO();
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		cVO=dao.getQuestion(num);
		
		return cVO;
	}
	
	// 글 수정
	@Override
	public int boardModifyPro(QuestionBoardVO dto) {
		int cnt =0;
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		cnt=dao.boardModifyPro(dto);
		
		return cnt;
	}
	
	// pwdChk
	@Override
	public int pwdChk(Map<String,Object> map) {
		int cnt =0;
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		cnt=dao.pwdChk(map);
		
		return cnt;
	}
	
	// 글 작성
	@Override
	public int boardAddPro(QuestionBoardVO dto) {
		int cnt =0;
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		cnt=dao.boardAddPro(dto);		
		
		return cnt;
	}	
	
	// 글 삭제
	@Override
	public int boardDeletePro(int num) {
		int cnt =0;
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		cnt=dao.boardDeletePro(num);		
		
		return cnt;
	}
	
	// 댓글 가져오기
	@Override
	public ArrayList<QuestionBoardVO> getreList(Map<String,Integer> map) {
		ArrayList<QuestionBoardVO> dtos =null ;	
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		dtos=dao.getreList(map);				
		return dtos;
	}
	// 댓글 작성
	@Override
	public int inputre(QuestionBoardVO dto) {
		int cnt =0;
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		cnt=dao.inputre(dto);	
			
		return cnt;
	}
	
	// 이벤트 생성에 필요한 닥터넘버를 받아오기 위한 sql
	@Override
	public int eventNo(String id) {
		
		int cnt = 0;
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		cnt = dao.eventNo(id);
		
		return cnt;
	}
	
	// 이벤트 추가
	@Override
	public int insertEvent(EventVO dto) {
		
		int insertCnt = 0;
		
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		insertCnt = dao.insertEvent(dto);
		
		return insertCnt;
	}

	// 이벤트 목록
	@Override
	public ArrayList<EventVO> eventList() {

		ArrayList<EventVO> dtos = null;
		
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		dtos = dao.eventList();
		
		return dtos;
	}

	@Override
	public EventVO eventInfo(int advertisementNo) {

		EventVO vo = null;
		
		CommonDAO SDAO = sqlSession.getMapper(CommonDAO.class);
		vo = SDAO.eventInfo(advertisementNo);
		
		return vo;
	}
}
