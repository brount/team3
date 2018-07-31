package com.team.medical.persitence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.medical.vo.CheckupListVO;
import com.team.medical.vo.CheckupVO;
import com.team.medical.vo.DoctorVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.HospitalVO;
import com.team.medical.vo.HpVO;

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

	public int getdocnoInfo(String id) {
		
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int selectCnt = dao.getdocnoInfo(id);
		return selectCnt;
	}
	
		// 내 병원 정보 가져오기
		@Override
	   public HospitalVO getMyhospitalInfo(String doctorno) {
	      DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
	      HospitalVO selectCnt = dao.getMyhospitalInfo(doctorno);
	      
	      return selectCnt;
	   }
	   // 제휴병원 중복체크
	   @Override
	   public int chkHospital(String hospitalphone) {
	      DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
	      int chkCnt = dao.chkHospital(hospitalphone);
	     
	      
	      return chkCnt;
	   }
	   // 병원정보가져오기 (병원번호)
	   @Override
	   public HospitalVO getHospitalInfo(String hospitalphone) {
	      DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
	      HospitalVO vo = dao.getHospitalInfo(hospitalphone);
	      
	      return vo;
	   }
	   // 일반병원정보가져오기 (병원번호)
	   @Override
	   public HpVO getHpInfo(String hospitalphone) {
	      DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
	      HpVO vo = dao.getHpInfo(hospitalphone);
	      
	      return vo;
	   }
	   // 병원정보수정
	   @Override
	   public int updateHospital(HospitalVO vo) {
	      int updateCnt=0;
	      DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
	      updateCnt = dao.updateHospital(vo); 
	      return updateCnt;
	   }

	@Override
	public DoctorVO getDocInfo(String id) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		DoctorVO selectCnt = dao.getDocInfo(id);
		return selectCnt;
	}

	@Override
	public int checkListInput(CheckupListVO vo) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int insertCnt = dao.checkListInput(vo);
		return insertCnt;
	}

	@Override
	public int getcheckupListCnt(int kind) {
		int selectCnt=0;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		selectCnt = dao.getcheckupListCnt(kind);
		return selectCnt;
	}

	@Override
	public ArrayList<CheckupListVO> CheckupList(Map<String, Integer> map) {
		ArrayList<CheckupListVO> dtos =null;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		
		dtos=dao.CheckupList(map);
		
		return dtos;
	}
	
	//일반 회원 정보
	@Override
	public GuestVO getcusInfo(int guestno) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		GuestVO cnt = dao.getcusInfo(guestno);
		return cnt;
	}

	@Override
	public DoctorVO getDoctorInfo(int doctorno) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		DoctorVO cnt = dao.getDoctorInfo(doctorno);
		return cnt;
	}


	@Override
	public int checkupdoc(int checkuplist) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.checkupdoc(checkuplist);
		return cnt;
	}

	@Override
	public CheckupListVO getCheckupInfo(int checkuplist) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		CheckupListVO cnt = dao.getCheckupInfo(checkuplist);
		return cnt;
	}

	@Override
	public int checkupAdd(CheckupVO vo) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int insertCnt = dao.checkupAdd(vo);
		return insertCnt;
	}

	@Override
	public int getcusnoInfo(int checkuplist) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		int cnt = dao.getcusnoInfo(checkuplist);
		return cnt;
	}

	@Override
	public int getCheckupResultListCnt(int i) {
		int selectCnt=0;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		selectCnt = dao.getCheckupResultListCnt(i);
		return selectCnt;
	}

	@Override
	public ArrayList<CheckupVO> getCheckupResultList(Map<String, Integer> map) {
		ArrayList<CheckupVO> dtos =null;
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		
		dtos=dao.getCheckupResultList(map);
		
		return dtos;
	}

	@Override
	public CheckupVO getCheckupResultInfo(int checkup) {
		DoctorDAO dao = sqlSession.getMapper(DoctorDAO.class);
		CheckupVO cnt = dao.getCheckupResultInfo(checkup);
		return cnt;
	}

	



	
	


	
}
