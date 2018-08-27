package com.team.medical.persitence;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.medical.vo.DiseaseVO;
import com.team.medical.vo.DrugVO;
import com.team.medical.vo.EventVO;
import com.team.medical.vo.ExerciseVO;
import com.team.medical.vo.HealthcareVO;
import com.team.medical.vo.HospitalVO;
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
	// 게시글 목록 조회
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
	// 병원 갯수 구하기
	@Override
	public int getHospitalCnt(Map<String,Object> map) {
		int selectCnt=0;
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		selectCnt=dao.getHospitalCnt(map);
		
		return selectCnt;
	}
	// 병원 목록 뿌리기
	@Override
	public ArrayList<HospitalVO> getHospitalList(Map<String,Object> map) {
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		ArrayList<HospitalVO> dtos=dao.getHospitalList(map);
		System.out.println("1"+dtos);
		return dtos;
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
	public ArrayList<EventVO> eventList(Map<String,Integer> map) {

		ArrayList<EventVO> dtos = null;
		
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		dtos = dao.eventList(map);
		
		return dtos;
	}
	// 이벤트 상세 정보
	@Override
	public EventVO eventInfo(int advertisementNo) {

		EventVO vo = null;
		
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		vo = dao.eventInfo(advertisementNo);
		
		return vo;
	}
	// 이벤트 갯수 구하기
	@Override
	public int getEventCnt() {
		
		int selectCnt = 0;
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		selectCnt = dao.getEventCnt();
		
		return selectCnt;
	}
	// 질병 갯수 구하기
	@Override
	public int getDiseaseCnt() {
		
		int selectCnt = 0;
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		selectCnt = dao.getDiseaseCnt();
		
		return selectCnt;
	}
	// 질병 목록
	@Override
	public ArrayList<DiseaseVO> diseaseList(Map<String, Integer> map) {
		
		ArrayList<DiseaseVO> dtos = null;
		
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		dtos = dao.diseaseList(map);
		
		return dtos;
	}
	// 질병 상세 정보
	@Override
	public DiseaseVO diseaseInfo(int diseaseCode) {

		DiseaseVO vo = null;
		
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		vo = dao.diseaseInfo(diseaseCode);
		
		return vo;
	}
	// 질병 갯수 구하기
	@Override
	public int getPreventionCnt() {
		
		int selectCnt = 0;
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		selectCnt = dao.getPreventionCnt();
		
		return selectCnt;
	}
	
	// 운동 갯수 구하기
	@Override
	public int getExerciseCnt() {
		
		int selectCnt = 0;
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		selectCnt = dao.getExerciseCnt();
		
		return selectCnt;
	}
	// 운동 목록
	@Override
	public ArrayList<ExerciseVO> exerciseList(Map<String, Integer> map) {

		ArrayList<ExerciseVO> dtos = null;
		
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		dtos = dao.exerciseList(map);
		
		return dtos;
	}
	// 운동 상세 정보
	@Override
	public ExerciseVO exerciseInfo(String exerciseName) {

		ExerciseVO vo = null;
		
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		vo = dao.exerciseInfo(exerciseName);
		
		return vo;
	}
	// 고객센터 갯수 구하기
	@Override
	public int getReportBoardCnt(Map<String, Integer> map) {
		
		int selectCnt=0;
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		selectCnt=dao.getReportBoardCnt(map);
		
		return selectCnt;
	}
	// 고객센터 목록 조회
	@Override
	public ArrayList<QuestionBoardVO> getReportBoardList(Map<String, Integer> map) {

		ArrayList<QuestionBoardVO> dtos = null;
		
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		dtos=dao.getReportBoardList(map);
		
		return dtos;
	}
	// 질병 갯수 구하기
	@Override
	public int getDrugListCnt(Map<String, Object> map) {
		
		int selectCnt = 0;
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		selectCnt = dao.getDrugListCnt(map);
		
		return selectCnt;
	}
	// 질병 리스트
	@Override
	public ArrayList<DrugVO> getDrugList(Map<String, Object> map) {
		ArrayList<DrugVO> list = null;
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		list =  dao.getDrugList(map);
		return list;
	}
	// 업데이트 포인트
	@Override
	public int updatePoint(String id) {
		int cnt = 0;
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		cnt = dao.updatePoint(id);
		return cnt;
	}
	// 포인트 체크
	@Override
	public int checkPoint(String id) {
		int cnt = 0;
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		cnt = dao.checkPoint(id);
		return cnt;
	}
	// 포인트 사용
	@Override
	public int usePoint(Map<String,Object> map) {
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		int updateCnt = dao.usePoint(map);
		
		return updateCnt;
	}
	// 포인트 인서트
	@Override
	public int pointInsert (Map<String,Object> map) {
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		int updateCnt = dao.pointInsert(map);
		
		return updateCnt;
	}
	// 글 상세보기
	@Override
	public DrugVO drugInfo(int drugCode) {
		
		DrugVO vo = new DrugVO();
		
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		vo = dao.drugInfo(drugCode);
		
		return vo;
	}
	
	
	// 테스트
	@Override
	public ArrayList<String> test(String[] args) throws IOException {
		
		java.util.Date today = new java.util.Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		
		String[] arr = {"1100000000", "2600000000"};
        
		ArrayList<String> a = new ArrayList<String>();
		
		for (String arr1 : arr) {
			
	        StringBuilder urlBuilder = new StringBuilder("http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getFsnLifeList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=A2X1aQuzE9qW3%2FmSsIpe83iQVh3HdleyFy5nRQQH%2BkUucy%2BBHAq9iIZYepGkzqLATSjd2zdaiS2CNkfW1Fm61g%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
	        urlBuilder.append("&" + URLEncoder.encode("areaNo","UTF-8") + "=" + URLEncoder.encode(arr1, "UTF-8")); /*지점코드*/
	        urlBuilder.append("&" + URLEncoder.encode("time","UTF-8") + "=" + URLEncoder.encode(date.format(today)+"06", "UTF-8")); /*2017년6월8일6시*/
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            a.add(line);
	        }
	        
	        rd.close();
	        conn.disconnect();
	        
		}
		
		return a;
		
		
    }
	// 안드로이드 DAO
	
	// 항목별 정보 가져오기
	@Override
	public HealthcareVO getAndroidHealthcareInfo(Map<String, String> map) {
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		HealthcareVO vo =  dao.getAndroidHealthcareInfo(map);
		
		return vo;
	}
	// 항목별 정보 목록 가져오기
	@Override
	public List<HealthcareVO> getAndroidHealthcareList(Map<String, String> map) {
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		List<HealthcareVO> vo =  dao.getAndroidHealthcareList(map);
		
		return vo;
	}
	// 항목별 정보 insert
	@Override
	public int addAndroidHealthcareInfo(Map<String, Object> map) {
		CommonDAO dao = sqlSession.getMapper(CommonDAO.class);
		int vo =  dao.addAndroidHealthcareInfo(map);
		
		return vo;
	}
	
	// 안드로이드 DAO
	
}
