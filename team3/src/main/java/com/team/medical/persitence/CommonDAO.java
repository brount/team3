package com.team.medical.persitence;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.team.medical.vo.DiseaseVO;
import com.team.medical.vo.DrugVO;
import com.team.medical.vo.EventVO;
import com.team.medical.vo.ExerciseVO;
import com.team.medical.vo.HealthcareVO;
import com.team.medical.vo.HospitalVO;
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
	// 병원 갯수 구하기
	public int getHospitalCnt(Map<String,Object> map);
	// 병원 목록 뿌리기
	public ArrayList<HospitalVO> getHospitalList(Map<String,Object> map);
	// 이벤트 생성에 필요한 닥터넘버를 받아오기 위한 sql
	public int eventNo(String id);
	// 이벤트 추가
	public int insertEvent(EventVO dto);
	// 이벤트 목록
	public ArrayList<EventVO> eventList(Map<String,Integer> map);
	// 이벤트 상세 정보
	public EventVO eventInfo(int advertisementNo);
	// 이벤트 갯수 구하기
	public int getEventCnt();
	// 질병 갯수 구하기
	public int getDiseaseCnt();
	// 질병 목록
	public ArrayList<DiseaseVO> diseaseList(Map<String,Integer> map);
	// 질병 상세 정보
	public DiseaseVO diseaseInfo(int diseaseCode);
	// 예방 갯수 구하기
	public int getPreventionCnt();
	// 운동 갯수 구하기
	public int getExerciseCnt();
	// 운동 목록
	public ArrayList<ExerciseVO> exerciseList(Map<String,Integer> map);
	// 운동 상세 정보
	public ExerciseVO exerciseInfo(String exerciseName);
	// 고객센터 게시글 갯수
	public int getReportBoardCnt(Map<String, Integer> map);
	// 고객센터 목록 조회
	public ArrayList<QuestionBoardVO> getReportBoardList(Map<String,Integer> map);
	// 약 갯수 구하기
	public int getDrugListCnt(Map<String, Object> map);
	// 약 선택검색
	public ArrayList<DrugVO> getDrugList(Map<String, Object> map);
	// 포인트 업데이트
	public int updatePoint(String id);
	// 포인트 사용
	public int usePoint(Map<String,Object> map);
	// 포인트 인서트
	public int pointInsert(Map<String,Object> map);
	
	public ArrayList<String> test(String[] args) throws IOException;
	
	// 안드로이드 DAO
	
	// 항목별 정보 가져오기
	public HealthcareVO getAndroidHealthcareInfo(Map<String,String> map);
	// 항목별 정보 목록 가져오기
	public List<HealthcareVO> getAndroidHealthcareList(Map<String, String> map);
	// 안드로이드 DAO
	public int addAndroidHealthcareInfo(Map<String, Object> map);
}
