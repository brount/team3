package com.team.medical.persitence;

import java.util.ArrayList;
import java.util.Map;

import com.team.medical.vo.EventVO;
import com.team.medical.vo.QuestionBoardVO;

public interface CommonDAO {
	
	// 질문 갯수 구하기
	public int getQuestionCnt(int kind);
	// 질문 목록 뿌리기
	public ArrayList<QuestionBoardVO> getQuestionList(Map<String,Integer> map);
	// 질문 상세 보기
	public QuestionBoardVO getQuestion(int num);
	// 글 수정
	public int boardModifyPro(QuestionBoardVO dto);
	// 비밀번호 체크 ( 게시글 수정 , 게시글 삭제)
	public int pwdChk(Map<String,Object> map);
	// 글 작성
	public int boardAddPro(QuestionBoardVO dto);
	// 글 삭제
	public int boardDeletePro(int num);
	// 댓글불러오기
	public ArrayList<QuestionBoardVO> getreList(Map<String,Integer> map);
	// 댓글작성
	public int inputre(QuestionBoardVO dto);
	// 이벤트 생성에 필요한 닥터넘버를 받아오기 위한 sql
	public int eventNo(String id);
	// 이벤트 추가
	public int insertEvent(EventVO dto);
	// 이벤트 목록
	public ArrayList<EventVO> eventList();
	// 이벤트 상세 정보
	public EventVO eventInfo(int advertisementNo);
}
