package com.team.medical.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team.medical.persitence.CommonDAO;
import com.team.medical.persitence.DoctorDAO;
import com.team.medical.vo.DiseaseVO;
import com.team.medical.vo.DrugVO;
import com.team.medical.vo.EventVO;
import com.team.medical.vo.ExerciseVO;
import com.team.medical.vo.HospitalVO;
import com.team.medical.vo.PreventionVO;
import com.team.medical.vo.QuestionBoardVO;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	CommonDAO dao;
	
	@Autowired
	DoctorDAO docdao;
	
	//글목록
	@Override
	public void boardList(HttpServletRequest req, Model model) {
		
		// 3단계 화면으롭터 입력받은 값을 받아온다.
		//게시판 관련
		int pageSize = 5; //한 페이지당 출력할 글 갯수
		int pageBlock = 3; //한 블럭당 페이지 갯수
		
		int cnt=0;        // 글 갯수 30 db num 젤큰수  50 게시글 30개밖에20개지워지고
		int start = 0;     // 현재페이지 시작 글번호
		int end = 0;      // 현재페이지 마지막 글번호
		int number=0;     // 출력용 글번호 30
		String pageNum = null; // 페이지번호 
		int currentPage=0;  // 현재페이지
		
		int pageCnt=0; //페이지갯수
		int startPage=0; //현재블록 시작 페이지
		int endPage=0; // 현재블록   마지막 페이지
		
		// 5단계. 글갯수 구하기
		cnt = dao.getQuestionCnt(1); 
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum==null) {
			pageNum="1";
		}
		
		//글 30건기준
		currentPage = Integer.parseInt(pageNum);
		
		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCnt= ( cnt / pageSize ) + ( cnt % pageSize > 0 ? 1 : 0 );
		
		// (1-1)*5 + 1
		start = (currentPage - 1) * pageSize + 1; // 현재 페이지의 시작번호 1
		
		// 5 = 1 + 5
		end = start + pageSize - 1; // 현재페이지의 마지막 번호 5
		
		// 30 = 30 - ( 1 - 1 ) * 5
		// 25 = 30 - ( 2 - 1 ) * 5  
		number = cnt - (currentPage -1)* pageSize; // 출력용 글번호
		
		ArrayList<QuestionBoardVO> dtos = null;
		if(cnt > 0) {
			// 게시글 목록 조회 
			Map<String,Integer> map = new HashMap<String,Integer>();
			map.put("start", start);
			map.put("end", end);
			map.put("kind", 1);
			dtos = dao.getQuestionList(map);
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글목록 cf)작은바구니  : 게시글 1건
		}
		
		// 1 = (1 / 3) * 3 + 1
 		startPage =(currentPage / pageBlock) * pageBlock +1; // 시작페이지
 		if(currentPage % pageBlock == 0) {
 			startPage -= pageBlock; // 나머지 계산
 		}		 		
 		
 		// 3 = 1 + 3 - 1
 		endPage = startPage + pageBlock - 1; // 마지막 페이지
 		if(endPage > pageCnt) {
 			endPage = pageCnt;
 		}
		
		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if(cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 글 상세보기
	@Override
	public void boardInfo(HttpServletRequest req, Model model) {
		//3단계 화면으로부터 값 받기
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		
		//5단계 상세페이지 가져오기 
		QuestionBoardVO dto=dao.getQuestion(num);
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("kind", 2);
		map.put("ref", dto.getBoardno());
		ArrayList<QuestionBoardVO> dtos = dao.getreList(map);
		
		//6단계 request 나 session 에 결과값 저장하기
		model.addAttribute("dto", dto);
		model.addAttribute("dtos", dtos);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("number",number);
	}
	
	// 글 수정 페이지
	@Override
	public void boardModify(HttpServletRequest req, Model model) {
		//3단계 화면으로부터 값 받기
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int kind = Integer.parseInt(req.getParameter("kind"));
		String pwd = req.getParameter("boardpwd");
		int pwdCnt = 0;
		QuestionBoardVO dto=null;
		//5단계 비밀번호 확인
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("boardno",num );
		map.put("boardpwd", pwd);
		pwdCnt = dao.pwdChk(map);
		//6단계  비밀번호가 맞으면
		if(pwdCnt == 1) {
			dto = dao.getQuestion(num);
		}
		//7단계 결과들 저장.
		model.addAttribute("pwdCnt", pwdCnt);
		model.addAttribute("num",num);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("dto",dto);
		model.addAttribute("kind",kind);
	}

	// 글 수정
	@Override
	public void boardModifyPro(HttpServletRequest req, Model model) {
		//3단계 화면으로부터 값 받기
		int num = Integer.parseInt(req.getParameter("num"));			
		int kind = Integer.parseInt(req.getParameter("kind"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		QuestionBoardVO dto = new QuestionBoardVO();
		
		//5단계 바구니에 담기
		dto.setBoardcontent(req.getParameter("boardcontent"));
		dto.setBoardtitle(req.getParameter("boardtitle"));
		dto.setBoardpwd(req.getParameter("boardpwd"));
		dto.setBoardno(num);
		int modifyCnt=dao.boardModifyPro(dto);
		//6단계 결과들 저장.
		model.addAttribute("modifyCnt", modifyCnt);
		model.addAttribute("kind",kind);
		model.addAttribute("num",num);
		model.addAttribute("pageNum",pageNum);
	}

	// 글 작성
	@Override
	public void boardAddPro(HttpServletRequest req, Model model) {
		
		//3단계 값받기
		QuestionBoardVO dto = new QuestionBoardVO();
		//화면에서 입력한값
		dto.setBoardwriter(req.getParameter("boardwriter"));
		dto.setBoardtitle(req.getParameter("boardtitle"));
		dto.setBoardcontent(req.getParameter("boardcontent"));
		dto.setBoardpwd(req.getParameter("boardpwd"));
		
		//hidden 으로 넘어온값
		int kind=Integer.parseInt(req.getParameter("kind"));
		dto.setBoardwriter((String)req.getSession().getAttribute("id"));
		dto.setBoardno(Integer.parseInt(req.getParameter("num")));
		dto.setKind(Integer.parseInt(req.getParameter("kind")));
		dto.setBoarddate(new Date(System.currentTimeMillis()));
		// localhost 대신에 내 ip (192.168.0.21)입력 
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
	
		//5단계  비즈니스 로직
		int insertCnt = dao.boardAddPro(dto);
		//6단계 결과 저장
		model.addAttribute("inserCnt",insertCnt);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("kind", kind);
	}
	
	// 글삭제
	@Override
	public void boardDeletePro(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		String pwd = req.getParameter("boardpwd");
		int kind=Integer.parseInt(req.getParameter("kind"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int deleteCnt = 0;

		//5단계 비즈니스 로직
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("boardno",num );
		map.put("boardpwd", pwd);
		int pwdCnt=dao.pwdChk(map);
		//6단계  비밀번호가 맞으면
		if(pwdCnt==1) {
			deleteCnt=dao.boardDeletePro(num);
		}
		
		//6단계 결과들 저장.
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("num",num);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("kind", kind);
	}

	//댓글작성
	@Override
	public void inputre(HttpServletRequest req, Model model) {
		QuestionBoardVO dto = new QuestionBoardVO();
		//화면에서 입력한값
		dto.setBoardwriter(req.getParameter("boardwriter"));
		dto.setBoardtitle("댓글");
		dto.setBoardcontent(req.getParameter("boardcontent"));
		dto.setBoardpwd(req.getParameter("boardpwd"));
		
		//hidden 으로 넘어온값
		int ref=Integer.parseInt(req.getParameter("ref"));
		dto.setRef(ref);
		dto.setBoardwriter((String)req.getSession().getAttribute("id"));
		dto.setKind(Integer.parseInt(req.getParameter("kind")));
		// localhost 대신에 내 ip (192.168.0.21)입력 
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
	
		//5단계  비즈니스 로직
		dao.inputre(dto);
		//6단계 결과 저장
		int num = Integer.parseInt(req.getParameter("num"));
		int number = Integer.parseInt(req.getParameter("number"));
		model.addAttribute("num",num);
		model.addAttribute("number",number);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("ref",ref);
	}
	
	//병원 검색목록
	@Override
	public void hospitalList(HttpServletRequest req, Model model) {		
		
		int pageSize = 15; //한 페이지당 출력할 글 갯수
		int pageBlock = 3; //한 블럭당 페이지 갯수
		
		int cnt=0;        // 글 갯수 30 db num 젤큰수  50 게시글 30개밖에20개지워지고
		int start = 0;     // 현재페이지 시작 글번호
		int end = 0;      // 현재페이지 마지막 글번호
		int number=0;     // 출력용 글번호 30
		String pageNum=null; // 페이지번호 
		int currentPage=0;  // 현재페이지
		
		int pageCnt=0; //페이지갯수
		int startPage=0; //현재블록 시작 페이지
		int endPage=0; // 현재블록   마지막 페이지
		
		String select = null;
		int sc =0;
		if(req.getParameter("select") != null) {
			sc = Integer.parseInt(req.getParameter("sc"));
			select = req.getParameter("select");
		}
		int state = 0;
		if(req.getParameter("state")!=null) {
			state= Integer.parseInt(req.getParameter("state"));
		}
		// 5단계. 글갯수 구하기
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("sc", sc);
		map.put("select", select);
		map.put("state", state);
		System.out.println("state = "+ state);
		cnt = dao.getHospitalCnt(map); 
		pageNum = req.getParameter("pageNum");
		
		if(pageNum==null) {
			pageNum="1";
		}
		
		//글 30건기준
		currentPage = Integer.parseInt(pageNum);
		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCnt= ( cnt / pageSize ) + ( cnt % pageSize > 0 ? 1 : 0 );
		
		// (1-1)*5 + 1
		start = ( currentPage - 1) * pageSize + 1; // 현재 페이지의 시작번호 1
		// 5 = 1 + 5
		end = start + pageSize - 1; // 현재페이지의 마지막 번호 5
		// 30 = 30 - ( 1 - 1 ) * 5
		// 25 = 30 - ( 2 - 1 ) * 5  
		number = cnt - (currentPage -1)* pageSize; // 출력용 글번호
		
		ArrayList<HospitalVO> dtos = null;
		if(cnt > 0) {
			// 게시글 목록 조회 
			Map<String,Object> map2 = new HashMap<String,Object>();
			map2.put("sc", sc);
			map2.put("select", select);
			map2.put("start", start);
			map2.put("end", end);
			dtos = dao.getHospitalList(map2);
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글목록 cf)작은바구니  : 게시글 1건
		}
		// 1 = (1 / 3) * 3 + 1
 		startPage =(currentPage / pageBlock) * pageBlock +1; // 시작페이지
 		if(currentPage % pageBlock == 0) {
 			startPage -= pageBlock; // 나머지 계산
 		}		 		
 		// 3 = 1 + 3 - 1
 		endPage = startPage + pageBlock - 1; // 마지막 페이지
 		if(endPage > pageCnt) {
 			endPage = pageCnt;
 		}
		
		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if(cnt > 0) {
			model.addAttribute("sc",sc);
			model.addAttribute("select",select);
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}	
	}
	// 병원검색 상세페이지
	@Override
	public void getHospitalInfo(HttpServletRequest req, Model model) {
		String hospitalphone = null;
		String pageNum = req.getParameter("pageNum");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("hospitalphone", hospitalphone);
		if(req.getParameter("hospitalphone")!=null) {
			hospitalphone=req.getParameter("hospitalphone");
			String hospitaladdr = req.getParameter("hospitaladdr");
			map.put("hospitalphone", hospitalphone);
			map.put("hospitaladdr", hospitaladdr);
		}
		map.put("hospitalno", null);
		if(req.getParameter("hospitalno")!=null) {
			int hospitalno =Integer.parseInt(req.getParameter("hospitalno")); 
			map.put("hospitalno", hospitalno);
		}
		
		HospitalVO vo = docdao.getHospitalInfo(map);
		if(vo != null) {
			model.addAttribute("vo", vo);
			System.out.println(1);
		} 
		
		model.addAttribute("pageNum",pageNum);
	}
	// 이벤트 추가
	@Override
	public void eventAdd(MultipartHttpServletRequest req, Model model) {
		
		MultipartFile file = req.getFile("image");
		
		MultipartFile file2 = req.getFile("thumbnail");
        
        String saveDir = req.getRealPath("/resources/images/event");
        
        String realDir="C:\\Dve36\\gitTeam\\team3\\src\\main\\webapp\\resources\\images\\event\\";
        
        try {
            file.transferTo(new File(saveDir+file.getOriginalFilename()));
            
            FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
            FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
            
            file2.transferTo(new File(saveDir+file2.getOriginalFilename()));
            
            FileInputStream fis2 = new FileInputStream(saveDir + file2.getOriginalFilename());
            FileOutputStream fos2 = new FileOutputStream(realDir + file2.getOriginalFilename());
            
            int data = 0;
            int data2 = 0;
            
            while((data = fis.read()) != -1) {
                fos.write(data);
            }
            
            while((data2 = fis2.read()) != -1) {
                fos2.write(data2);
            }
            fis.close();
            fos.close();
            fis2.close();
            fos2.close();
            
            String id = req.getParameter("id");
            
    		int doctorno = dao.eventNo(id);
    		String advertisementTitle = req.getParameter("title");
    		String advertisementThumbnail = file2.getOriginalFilename();
    		String advertisementImage = file.getOriginalFilename();
    		String advertisementContents = req.getParameter("content");
    		int advertisementKind = Integer.parseInt(req.getParameter("kind"));
    		String date1 = req.getParameter("date1");
    		Date advertisementStart = Date.valueOf(date1);
    		String date2 = req.getParameter("date2");
    		Date advertisementEnd = Date.valueOf(date2);
    		System.out.println(advertisementStart);
    		System.out.println(advertisementEnd);
    		
            EventVO dto = new EventVO();
            dto.setDoctorno(doctorno);
            dto.setAdvertisementTitle(advertisementTitle);
            dto.setAdvertisementThumbnail(advertisementThumbnail);
            dto.setAdvertisementImage(advertisementImage);
            dto.setAdvertisementContents(advertisementContents);
            dto.setAdvertisementKind(advertisementKind);
            dto.setAdvertisementStart(advertisementStart);
            dto.setAdvertisementEnd(advertisementEnd);
            dto.setAdvertisementState(1);
            
            int insertCnt = 0;
            insertCnt = dao.insertEvent(dto);
            
            model.addAttribute("insertCnt", insertCnt);
            
        } catch(IOException e) {
            e.printStackTrace();
        }
		
	}
	// 이벤트 리스트
	@Override
	public void eventList(HttpServletRequest req, Model model) {

		//게시판 관련
		int pageSize = 12; //한 페이지당 출력할 글 갯수
		int pageBlock = 3; //한 블럭당 페이지 갯수
		
		int cnt = 0;        // 글 갯수 30 db num 젤큰수  50 게시글 30개밖에20개지워지고
		int start = 0;     // 현재페이지 시작 글번호
		int end = 0;      // 현재페이지 마지막 글번호
		int number = 0;     // 출력용 글번호 30
		String pageNum = null; // 페이지번호 
		int currentPage = 0;  // 현재페이지
		
		int pageCnt = 0; //페이지갯수
		int startPage = 0; //현재블록 시작 페이지
		int endPage = 0; // 현재블록   마지막 페이지
		
		// 5단계. 글갯수 구하기
		cnt = dao.getEventCnt();
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum="1";
		}
		
		//글 30건기준
		currentPage = Integer.parseInt(pageNum);
		
		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCnt= ( cnt / pageSize ) + ( cnt % pageSize > 0 ? 1 : 0 );
		
		// (1-1)*5 + 1
		start = ( currentPage - 1) * pageSize + 1; // 현재 페이지의 시작번호 1
		
		// 5 = 1 + 5
		end = start + pageSize - 1; // 현재페이지의 마지막 번호 5
		
		// 30 = 30 - ( 1 - 1 ) * 5
		// 25 = 30 - ( 2 - 1 ) * 5  
		number = cnt - (currentPage -1)* pageSize; // 출력용 글번호
		
		ArrayList<EventVO> dtos = null;
		
		if(cnt > 0) {
			// 게시글 목록 조회 
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			dtos = dao.eventList(map);
			model.addAttribute("dtos", dtos);
		}
		
		// 1 = (1 / 3) * 3 + 1
 		startPage =(currentPage / pageBlock) * pageBlock +1; // 시작페이지
 		if(currentPage % pageBlock == 0) {
 			startPage -= pageBlock; // 나머지 계산
 		}		 		
 		// 3 = 1 + 3 - 1
 		endPage = startPage + pageBlock - 1; // 마지막 페이지
 		if(endPage > pageCnt) {
 			endPage = pageCnt;
 		}
		
		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if(cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
		
	}
	// 이벤트 상세페이지
	@Override
	public void eventInfo(HttpServletRequest req, Model model) {
		
		int advertisementNo = Integer.parseInt(req.getParameter("advertisementNo"));
		
		EventVO dto = dao.eventInfo(advertisementNo);
		
		model.addAttribute("dto", dto);
		model.addAttribute("advertisementNo", advertisementNo);
	}

	@Override
	public void diseaseList(HttpServletRequest req, Model model) {
		
		//게시판 관련
		int pageSize = 5; //한 페이지당 출력할 글 갯수
		int pageBlock = 3; //한 블럭당 페이지 갯수
		
		int cnt = 0;        // 글 갯수 30 db num 젤큰수  50 게시글 30개밖에20개지워지고
		int start = 0;     // 현재페이지 시작 글번호
		int end = 0;      // 현재페이지 마지막 글번호
		int number = 0;     // 출력용 글번호 30
		String pageNum = null; // 페이지번호 
		int currentPage = 0;  // 현재페이지
		
		int pageCnt = 0; //페이지갯수
		int startPage = 0; //현재블록 시작 페이지
		int endPage = 0; // 현재블록   마지막 페이지
		
		// 5단계. 글갯수 구하기
		cnt = dao.getDiseaseCnt();
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum="1";
		}
		
		//글 30건기준
		currentPage = Integer.parseInt(pageNum);
		
		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCnt= ( cnt / pageSize ) + ( cnt % pageSize > 0 ? 1 : 0 );
		
		// (1-1)*5 + 1
		start = ( currentPage - 1) * pageSize + 1; // 현재 페이지의 시작번호 1
		
		// 5 = 1 + 5
		end = start + pageSize - 1; // 현재페이지의 마지막 번호 5
		
		// 30 = 30 - ( 1 - 1 ) * 5
		// 25 = 30 - ( 2 - 1 ) * 5  
		number = cnt - (currentPage -1)* pageSize; // 출력용 글번호
		
		ArrayList<DiseaseVO> dtos = null;
		
		if(cnt > 0) {
			// 게시글 목록 조회 
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			dtos = dao.diseaseList(map);
			model.addAttribute("dtos", dtos);
		}
		
		// 1 = (1 / 3) * 3 + 1
 		startPage =(currentPage / pageBlock) * pageBlock +1; // 시작페이지
 		if(currentPage % pageBlock == 0) {
 			startPage -= pageBlock; // 나머지 계산
 		}		 		
 		// 3 = 1 + 3 - 1
 		endPage = startPage + pageBlock - 1; // 마지막 페이지
 		if(endPage > pageCnt) {
 			endPage = pageCnt;
 		}
		
		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if(cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}
	// 질병 상세 페이지
	@Override
	public void diseaseInfo(HttpServletRequest req, Model model) {
		
		int diseaseCode = Integer.parseInt(req.getParameter("diseaseCode"));
		
		DiseaseVO dto = dao.diseaseInfo(diseaseCode);
		
		model.addAttribute("dto", dto);
		model.addAttribute("diseaseCode", diseaseCode);
	}
	// 예방 목록
	@Override
	public void preventionList(HttpServletRequest req, Model model) {
		//게시판 관련
		int pageSize = 5; //한 페이지당 출력할 글 갯수
		int pageBlock = 3; //한 블럭당 페이지 갯수
		
		int cnt = 0;        // 글 갯수 30 db num 젤큰수  50 게시글 30개밖에20개지워지고
		int start = 0;     // 현재페이지 시작 글번호
		int end = 0;      // 현재페이지 마지막 글번호
		int number = 0;     // 출력용 글번호 30
		String pageNum = null; // 페이지번호 
		int currentPage = 0;  // 현재페이지
		
		int pageCnt = 0; //페이지갯수
		int startPage = 0; //현재블록 시작 페이지
		int endPage = 0; // 현재블록   마지막 페이지
		
		// 5단계. 글갯수 구하기
		cnt = dao.getPreventionCnt();
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum="1";
		}
		
		//글 30건기준
		currentPage = Integer.parseInt(pageNum);
		
		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCnt= ( cnt / pageSize ) + ( cnt % pageSize > 0 ? 1 : 0 );
		
		// (1-1)*5 + 1
		start = ( currentPage - 1) * pageSize + 1; // 현재 페이지의 시작번호 1
		
		// 5 = 1 + 5
		end = start + pageSize - 1; // 현재페이지의 마지막 번호 5
		
		// 30 = 30 - ( 1 - 1 ) * 5
		// 25 = 30 - ( 2 - 1 ) * 5  
		number = cnt - (currentPage -1)* pageSize; // 출력용 글번호
		
		ArrayList<PreventionVO> dtos = null;
		
		if(cnt > 0) {
			// 게시글 목록 조회 
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			dtos = dao.preventionList(map);
			model.addAttribute("dtos", dtos);
		}
		
		// 1 = (1 / 3) * 3 + 1
 		startPage =(currentPage / pageBlock) * pageBlock +1; // 시작페이지
 		if(currentPage % pageBlock == 0) {
 			startPage -= pageBlock; // 나머지 계산
 		}		 		
 		// 3 = 1 + 3 - 1
 		endPage = startPage + pageBlock - 1; // 마지막 페이지
 		if(endPage > pageCnt) {
 			endPage = pageCnt;
 		}
		
		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if(cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}
	// 예방 상세페이지
	@Override
	public void preventionInfo(HttpServletRequest req, Model model) {

		int preventionCode = Integer.parseInt(req.getParameter("preventionCode"));
		
		PreventionVO dto = dao.preventionInfo(preventionCode);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preventionCode", preventionCode);
	}
	// 운동 목록
	@Override
	public void exerciseInfoList(HttpServletRequest req, Model model) {
		//게시판 관련
		int pageSize = 5; //한 페이지당 출력할 글 갯수
		int pageBlock = 3; //한 블럭당 페이지 갯수
		
		int cnt = 0;        // 글 갯수 30 db num 젤큰수  50 게시글 30개밖에20개지워지고
		int start = 0;     // 현재페이지 시작 글번호
		int end = 0;      // 현재페이지 마지막 글번호
		int number = 0;     // 출력용 글번호 30
		String pageNum = null; // 페이지번호 
		int currentPage = 0;  // 현재페이지
		
		int pageCnt = 0; //페이지갯수
		int startPage = 0; //현재블록 시작 페이지
		int endPage = 0; // 현재블록   마지막 페이지
		
		// 5단계. 글갯수 구하기
		cnt = dao.getExerciseCnt();
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum="1";
		}
		
		//글 30건기준
		currentPage = Integer.parseInt(pageNum);
		
		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCnt= ( cnt / pageSize ) + ( cnt % pageSize > 0 ? 1 : 0 );
		
		// (1-1)*5 + 1
		start = ( currentPage - 1) * pageSize + 1; // 현재 페이지의 시작번호 1
		
		// 5 = 1 + 5
		end = start + pageSize - 1; // 현재페이지의 마지막 번호 5
		
		// 30 = 30 - ( 1 - 1 ) * 5
		// 25 = 30 - ( 2 - 1 ) * 5  
		number = cnt - (currentPage -1)* pageSize; // 출력용 글번호
		
		ArrayList<ExerciseVO> dtos = null;
		
		if(cnt > 0) {
			// 게시글 목록 조회 
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			dtos = dao.exerciseList(map);
			model.addAttribute("dtos", dtos);
		}
		
		// 1 = (1 / 3) * 3 + 1
 		startPage =(currentPage / pageBlock) * pageBlock +1; // 시작페이지
 		if(currentPage % pageBlock == 0) {
 			startPage -= pageBlock; // 나머지 계산
 		}		 		
 		// 3 = 1 + 3 - 1
 		endPage = startPage + pageBlock - 1; // 마지막 페이지
 		if(endPage > pageCnt) {
 			endPage = pageCnt;
 		}
		
		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if(cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}
	// 운동 상세페이지
	@Override
	public void exerciseInfo(HttpServletRequest req, Model model) {

		String exerciseName = req.getParameter("exerciseName");
		
		ExerciseVO dto = dao.exerciseInfo(exerciseName);
		
		model.addAttribute("dto", dto);
		model.addAttribute("exerciseName", exerciseName);
	}
	// 고객센터 글목록
	@Override
	public void reportBoardList(HttpServletRequest req, Model model) {
		
		// 3단계 화면으롭터 입력받은 값을 받아온다.
		//게시판 관련
		int pageSize = 5; //한 페이지당 출력할 글 갯수
		int pageBlock = 3; //한 블럭당 페이지 갯수
		
		int cnt=0;        // 글 갯수 30 db num 젤큰수  50 게시글 30개밖에20개지워지고
		int start = 0;     // 현재페이지 시작 글번호
		int end = 0;      // 현재페이지 마지막 글번호
		int number=0;     // 출력용 글번호 30
		String pageNum = null; // 페이지번호 
		int currentPage=0;  // 현재페이지
		
		int pageCnt=0; //페이지갯수
		int startPage=0; //현재블록 시작 페이지
		int endPage=0; // 현재블록   마지막 페이지
		
		// 5단계. 글갯수 구하기
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("notice", 3);
		map.put("report", 4);
		cnt = dao.getReportBoardCnt(map);
		pageNum = req.getParameter("pageNum");
		
		if(pageNum==null) {
			pageNum="1";
		}
		
		//글 30건기준
		currentPage = Integer.parseInt(pageNum);
		
		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCnt= ( cnt / pageSize ) + ( cnt % pageSize > 0 ? 1 : 0 );
		
		// (1-1)*5 + 1
		start = (currentPage - 1) * pageSize + 1; // 현재 페이지의 시작번호 1
		
		// 5 = 1 + 5
		end = start + pageSize - 1; // 현재페이지의 마지막 번호 5
		
		// 30 = 30 - ( 1 - 1 ) * 5
		// 25 = 30 - ( 2 - 1 ) * 5  
		number = cnt - (currentPage -1)* pageSize; // 출력용 글번호
		
		ArrayList<QuestionBoardVO> dtos = null;
		if(cnt > 0) {
			// 게시글 목록 조회 
			Map<String,Integer> map2 = new HashMap<String,Integer>();
			map2.put("start", start);
			map2.put("end", end);
			map2.put("notice", 3);
			map2.put("report", 4);
			dtos = dao.getReportBoardList(map2);
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글목록 cf)작은바구니  : 게시글 1건
		}
		
		// 1 = (1 / 3) * 3 + 1
 		startPage =(currentPage / pageBlock) * pageBlock +1; // 시작페이지
 		if(currentPage % pageBlock == 0) {
 			startPage -= pageBlock; // 나머지 계산
 		}		 		
 		
 		// 3 = 1 + 3 - 1
 		endPage = startPage + pageBlock - 1; // 마지막 페이지
 		if(endPage > pageCnt) {
 			endPage = pageCnt;
 		}
		
		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if(cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}
	// 고객센터 글 상세보기
	@Override
	public void reportBoardInfo(HttpServletRequest req, Model model) {
		//3단계 화면으로부터 값 받기
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		
		//5단계 상세페이지 가져오기 
		QuestionBoardVO dto = dao.getQuestion(num);
		
		//6단계 request 나 session 에 결과값 저장하기
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("number",number);
	}
	// 약 검색목록 페이지
	@Override
	public void drugSeachList(HttpServletRequest req, Model model) {
		
		//게시판 관련
		int pageSize = 20; //한 페이지당 출력할 글 갯수
		int pageBlock = 3; //한 블럭당 페이지 갯수
		
		int cnt = 0;        // 글 갯수 30 db num 젤큰수  50 게시글 30개밖에20개지워지고
		int start = 0;     // 현재페이지 시작 글번호
		int end = 0;      // 현재페이지 마지막 글번호
		int number = 0;     // 출력용 글번호 30
		String pageNum = null; // 페이지번호 
		int currentPage = 0;  // 현재페이지
		
		int pageCnt = 0; //페이지갯수
		int startPage = 0; //현재블록 시작 페이지
		int endPage = 0; // 현재블록   마지막 페이지
		// (1-1)*5 + 1
		
		// 5단계. 글갯수 구하기.
		
		Map<String, Object> map = new HashMap<String, Object>();
		// 식별표시
		String sign = null;
		if(req.getParameter("sign")!=null);{
			 sign = req.getParameter("sign");
		}		
		// 식별표시 검색종류 포함 일치 시작
		int sign_flag = 0 ;
		if(req.getParameter("sign_flag")!=null) {
			sign_flag =Integer.parseInt(req.getParameter("sign_flag"));	
		}
		
		// 제형 리스트
		String[] shape = null;
		String shape_etc = null;
		if(req.getParameterValues("shape")!=null) {
			shape = req.getParameterValues("shape");
			for(int i =0; i<shape.length;i++) {
				if(!shape[i].equals("전체")){				
					shape_etc =req.getParameter("shape_etc");
				}
			}
		}	
		// 모양 리스트
		String[] drugForm = null;
		String drugForm_etc =null;
		if(req.getParameterValues("drugForm")!=null) {
			drugForm =req.getParameterValues("drugForm");
			for(int i =0; i<drugForm.length;i++) {
				if(!drugForm[i].equals("전체")){				
					drugForm_etc =req.getParameter("drugForm_etc");
				}
			}
		}
		// 색깔 리스트
		String[] color =null;
		if(req.getParameterValues("color")!=null) {
			color=req.getParameterValues("color");
		}		
		// 분할선 앞 리스트
		String[] splitlineF =null;
		if(req.getParameterValues("splitlineF")!=null) {
			splitlineF=req.getParameterValues("splitlineF");
		}		
		// 분할선 뒤 리스트
		String[] splitlineB =null;
		if(req.getParameterValues("splitlineB")!=null) {
			splitlineB=req.getParameterValues("splitlineB");
		}
		// 제품명
		String drugName = null;
		if(req.getParameter("drugName")!=null) {
			drugName= req.getParameter("drugName");
		}
		// 제조사
		String drugCompany = null;
		if(req.getParameter("drugCompany")!=null) {
			drugCompany= req.getParameter("drugCompany");
		}
				
		map.put("sign", sign);
		map.put("sign_flag", sign_flag);
		map.put("shape", shape);
		map.put("shape_etc", shape_etc);
		map.put("drugForm", drugForm);
		map.put("drugForm_etc", drugForm_etc);
		map.put("color", color);
		map.put("splitlineF", splitlineF);
		map.put("splitlineB", splitlineB);
		map.put("drugName", drugName);
		map.put("drugCompany", drugCompany);
		
		model.addAttribute("sign", sign);
		model.addAttribute("sign_flag", sign_flag);
		model.addAttribute("shape", shape);
		model.addAttribute("shape_etc", shape_etc);
		model.addAttribute("drugForm", drugForm);
		model.addAttribute("drugForm_etc", drugForm_etc);
		model.addAttribute("color", color);
		model.addAttribute("splitlineF", splitlineF);
		model.addAttribute("splitlineB", splitlineB);
		model.addAttribute("drugName", drugName);
		model.addAttribute("drugCompany", drugCompany);
		
		cnt = dao.getDrugListCnt(map);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum="1";
		}
		
		//글 30건기준
		currentPage = Integer.parseInt(pageNum);
		
		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCnt= ( cnt / pageSize ) + ( cnt % pageSize > 0 ? 1 : 0 );
		
		start = ( currentPage - 1) * pageSize + 1; // 현재 페이지의 시작번호 1
		
		// 5 = 1 + 5
		end = start + pageSize - 1; // 현재페이지의 마지막 번호 5
		
		// 30 = 30 - ( 1 - 1 ) * 5
		// 25 = 30 - ( 2 - 1 ) * 5  
		number = cnt - (currentPage -1)* pageSize; // 출력용 글번호
		
		ArrayList<DrugVO> dtos = null;
		
		if(cnt > 0) {
			// 게시글 목록 조회 
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("sign", sign);
			map2.put("sign_flag", sign_flag);
			map2.put("shape", shape);
			map2.put("shape_etc", shape_etc);
			map2.put("drugForm", drugForm);
			map2.put("drugForm_etc", drugForm_etc);
			map2.put("color", color);
			map2.put("splitlineF", splitlineF);
			map2.put("splitlineB", splitlineB);
			map2.put("drugName", drugName);
			map2.put("drugCompany", drugCompany);
			map2.put("start", start);
			map2.put("end", end);
			dtos = dao.getDrugList(map2);
			model.addAttribute("dtos", dtos);
		}
		
		// 1 = (1 / 3) * 3 + 1
 		startPage =(currentPage / pageBlock) * pageBlock +1; // 시작페이지
 		if(currentPage % pageBlock == 0) {
 			startPage -= pageBlock; // 나머지 계산
 		}		 		
 		// 3 = 1 + 3 - 1
 		endPage = startPage + pageBlock - 1; // 마지막 페이지
 		if(endPage > pageCnt) {
 			endPage = pageCnt;
 		}
		
		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if(cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	@Override
	public void test(HttpServletRequest req, Model model) throws IOException {
		
		String[] args = null;
		
		ArrayList<String> a = null;
		
		a = dao.test(args);
		
		System.out.println(a);
		model.addAttribute("a", a);
		
		
	}

	

	


}
