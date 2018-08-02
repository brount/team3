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

import com.team.medical.persitence.AdminDAO;
import com.team.medical.persitence.CommonDAO;
import com.team.medical.vo.DiseaseVO;
import com.team.medical.vo.DrugVO;
import com.team.medical.vo.EventVO;
import com.team.medical.vo.ExerciseVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.PreventionVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDAO dao;
	@Autowired
	CommonDAO codao;
	
	// 관리자 로그인
	@Override
	public void adminLoginPro(HttpServletRequest req, Model model) {		
		String id =req.getParameter("id");
		String pwd = req.getParameter("pwd");
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pwd", pwd);
		int loginCnt = dao.adminLoginPro(map);
		if(loginCnt==1) {
			req.getSession().setAttribute("id", id);
		}else {
			req.getSession().setAttribute("member",null);
		}
		model.addAttribute("loginCnt",loginCnt);
	}
	
	// 일반회원 목록
	@Override
	public void memberList(HttpServletRequest req, Model model) {
		
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		int pageSize = 50; // 한 페이지당 출력할 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수

		int cnt = 0; // 갯수
		int start = 0; // 현재 페이지 시작 번호
		int end = 0; // 현재 페이지 마지막 번호
		int number = 0; // 출력용 번호
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 5단계. 갯수 구하기
		cnt = dao.getMemberListCnt();
		System.out.println("cnt : " + cnt); // 먼저 테이블에 30건을 insert 할것

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫페이지
		}

		currentPage = Integer.parseInt(pageNum); // 현재페이지 : 1
		System.out.println("currentPage : " + currentPage);

		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지갯수 + 나머지

		start = (currentPage - 1) * pageSize + 1; // 현재페이지의 시작번호

		end = start + pageSize - 1; // 현재페이지 마지막번호

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize; // 출력용 번호

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		if (cnt > 0) {
			// 게시글 목록 조회
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<GuestVO> dtos = dao.getMemberList(map);
			System.out.println("dtos : " + dtos.size());
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 cf)작은 바구니 : 게시글 1건
		}

		// 1 = (1 / 3) * 3 + 1
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작 페이지
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);

		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1; // 마지막 페이지
		if (endPage > pageCount)
			endPage = pageCount;

		System.out.println("endPage : " + endPage);

		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)

		model.addAttribute("cnt", cnt); // 재고 갯수
		model.addAttribute("number", number); // 재고 번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
		
	}
	
	// 일번회원검색목록
	@Override
	public void memberSearchList(HttpServletRequest req, Model model) {

		int pageSize = 50; // 한 페이지당 출력할 글 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글 갯수 30 db num 젤큰수 50 게시글 30개밖에20개지워지고
		int start = 0; // 현재페이지 시작 글번호
		int end = 0; // 현재페이지 마지막 글번호
		int number = 0; // 출력용 글번호 30
		String pageNum = null; // 페이지번호
		int currentPage = 0; // 현재페이지

		int pageCnt = 0; // 페이지갯수
		int startPage = 0; // 현재블록 시작 페이지
		int endPage = 0; // 현재블록 마지막 페이지

		int sc = Integer.parseInt(req.getParameter("sc"));
		String search = req.getParameter("search");
		// 5단계. 글갯수 구하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sc", sc);
		map.put("search", search);
		System.out.println("검색종류 : " + sc);
		System.out.println("검색내용 : " + search);
		cnt = dao.search_memberCnt(map);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1";
		}

		// 글 30건기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage " + currentPage);
		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCnt = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);

		// (1-1)*5 + 1
		start = (currentPage - 1) * pageSize + 1; // 현재 페이지의 시작번호 1

		// 5 = 1 + 5
		end = start + pageSize - 1; // 현재페이지의 마지막 번호 5
		System.out.println("start " + start);
		System.out.println("end " + end);

		// 30 = 30 - ( 1 - 1 ) * 5
		// 25 = 30 - ( 2 - 1 ) * 5
		number = 1; // 출력용 글번호
		System.out.println("number " + number);

		ArrayList<GuestVO> dtos = null;
		if (cnt > 0) {
			// 게시글 목록 조회

			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("sc", sc);
			map2.put("search", search);
			map2.put("start", start);
			map2.put("end", end);

			dtos = dao.search_member(map2);
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글목록 cf)작은바구니 : 게시글 1건
		}

		// 1 = (1 / 3) * 3 + 1
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock; // 나머지 계산
		}
		System.out.println("startPage " + startPage);
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1; // 마지막 페이지
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		System.out.println("endPage " + endPage);

		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 일반제제회원목록
	@Override
	public void membersanctionList(HttpServletRequest req, Model model) {

		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		int pageSize = 50; // 한 페이지당 출력할 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수

		int cnt = 0; // 갯수
		int start = 0; // 현재 페이지 시작 번호
		int end = 0; // 현재 페이지 마지막 번호
		int number = 0; // 출력용 번호
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 5단계. 갯수 구하기
		cnt = dao.getMembersanctionsListCnt();
		System.out.println("cnt : " + cnt); // 먼저 테이블에 30건을 insert 할것

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫페이지
		}

		currentPage = Integer.parseInt(pageNum); // 현재페이지 : 1
		System.out.println("currentPage : " + currentPage);

		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지갯수 + 나머지

		start = (currentPage - 1) * pageSize + 1; // 현재페이지의 시작번호

		end = start + pageSize - 1; // 현재페이지 마지막번호

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize; // 출력용 번호

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		if (cnt > 0) {
			// 게시글 목록 조회
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<GuestVO> dtos = dao.getMembersanctionsList(map);
			System.out.println("dtos : " + dtos.size());
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 cf)작은 바구니 : 게시글 1건
		}

		// 1 = (1 / 3) * 3 + 1
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작 페이지
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);

		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1; // 마지막 페이지
		if (endPage > pageCount)
			endPage = pageCount;

		System.out.println("endPage : " + endPage);

		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)

		model.addAttribute("cnt", cnt); // 재고 갯수
		model.addAttribute("number", number); // 재고 번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 일반제제회원검색목록
	@Override
	public void membersanctionSearchList(HttpServletRequest req, Model model) {
		int pageSize = 50; // 한 페이지당 출력할 글 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글 갯수 30 db num 젤큰수 50 게시글 30개밖에20개지워지고
		int start = 0; // 현재페이지 시작 글번호
		int end = 0; // 현재페이지 마지막 글번호
		int number = 0; // 출력용 글번호 30
		String pageNum = null; // 페이지번호
		int currentPage = 0; // 현재페이지

		int pageCnt = 0; // 페이지갯수
		int startPage = 0; // 현재블록 시작 페이지
		int endPage = 0; // 현재블록 마지막 페이지

		int sc = Integer.parseInt(req.getParameter("sc"));
		String search = req.getParameter("search");
		// 5단계. 글갯수 구하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sc", sc);
		map.put("search", search);
		System.out.println("검색종류 : " + sc);
		System.out.println("검색내용 : " + search);
		cnt = dao.search_membersanctionsListCnt(map);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1";
		}

		// 글 30건기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage " + currentPage);
		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCnt = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);

		// (1-1)*5 + 1
		start = (currentPage - 1) * pageSize + 1; // 현재 페이지의 시작번호 1

		// 5 = 1 + 5
		end = start + pageSize - 1; // 현재페이지의 마지막 번호 5
		System.out.println("start " + start);
		System.out.println("end " + end);

		// 30 = 30 - ( 1 - 1 ) * 5
		// 25 = 30 - ( 2 - 1 ) * 5
		number = 1; // 출력용 글번호
		System.out.println("number " + number);

		ArrayList<GuestVO> dtos = null;
		if (cnt > 0) {
			// 게시글 목록 조회

			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("sc", sc);
			map2.put("search", search);
			map2.put("start", start);
			map2.put("end", end);

			dtos = dao.search_membersanctionsList(map2);
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글목록 cf)작은바구니 : 게시글 1건
		}

		// 1 = (1 / 3) * 3 + 1
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock; // 나머지 계산
		}
		System.out.println("startPage " + startPage);
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1; // 마지막 페이지
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		System.out.println("endPage " + endPage);

		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 일반탈퇴회원목록
	@Override
	public void membersecessionList(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		int pageSize = 50; // 한 페이지당 출력할 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수

		int cnt = 0; // 갯수
		int start = 0; // 현재 페이지 시작 번호
		int end = 0; // 현재 페이지 마지막 번호
		int number = 0; // 출력용 번호
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 5단계. 갯수 구하기
		cnt = dao.getMembersecessionListCnt();
		System.out.println("cnt : " + cnt); // 먼저 테이블에 30건을 insert 할것

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫페이지
		}
		System.out.println("pageNum : " + pageNum);
		currentPage = Integer.parseInt(pageNum); // 현재페이지 : 1
		System.out.println("currentPage : " + currentPage);

		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지갯수 + 나머지

		start = (currentPage - 1) * pageSize + 1; // 현재페이지의 시작번호

		end = start + pageSize - 1; // 현재페이지 마지막번호

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize; // 출력용 번호

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		if (cnt > 0) {
			// 게시글 목록 조회
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<GuestVO> dtos = dao.getMembersecessionList(map);
			System.out.println("dtos : " + dtos.size());
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 cf)작은 바구니 : 게시글 1건
		}

		// 1 = (1 / 3) * 3 + 1
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작 페이지
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);

		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1; // 마지막 페이지
		if (endPage > pageCount)
			endPage = pageCount;

		System.out.println("endPage : " + endPage);

		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)

		model.addAttribute("cnt", cnt); // 재고 갯수
		model.addAttribute("number", number); // 재고 번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 일반탈퇴회원검색목록
	@Override
	public void membersecessionSearchList(HttpServletRequest req, Model model) {
		int pageSize = 50; // 한 페이지당 출력할 글 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글 갯수 30 db num 젤큰수 50 게시글 30개밖에20개지워지고
		int start = 0; // 현재페이지 시작 글번호
		int end = 0; // 현재페이지 마지막 글번호
		int number = 0; // 출력용 글번호 30
		String pageNum = null; // 페이지번호
		int currentPage = 0; // 현재페이지

		int pageCnt = 0; // 페이지갯수
		int startPage = 0; // 현재블록 시작 페이지
		int endPage = 0; // 현재블록 마지막 페이지

		int sc = Integer.parseInt(req.getParameter("sc"));
		String search = req.getParameter("search");
		// 5단계. 글갯수 구하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sc", sc);
		map.put("search", search);
		System.out.println("검색종류 : " + sc);
		System.out.println("검색내용 : " + search);
		cnt = dao.search_membersecessionListCnt(map);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1";
		}
		System.out.println("pageNum " + pageNum);
		// 글 30건기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage " + currentPage);
		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCnt = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);

		// (1-1)*5 + 1
		start = (currentPage - 1) * pageSize + 1; // 현재 페이지의 시작번호 1

		// 5 = 1 + 5
		end = start + pageSize - 1; // 현재페이지의 마지막 번호 5
		System.out.println("start " + start);
		System.out.println("end " + end);

		// 30 = 30 - ( 1 - 1 ) * 5
		// 25 = 30 - ( 2 - 1 ) * 5
		number = 1; // 출력용 글번호
		System.out.println("number " + number);

		ArrayList<GuestVO> dtos = null;
		if (cnt > 0) {
			// 게시글 목록 조회

			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("sc", sc);
			map2.put("search", search);
			map2.put("start", start);
			map2.put("end", end);

			dtos = dao.search_membersecessionList(map2);
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글목록 cf)작은바구니 : 게시글 1건
		}

		// 1 = (1 / 3) * 3 + 1
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock; // 나머지 계산
		}
		System.out.println("startPage " + startPage);
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1; // 마지막 페이지
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		System.out.println("endPage " + endPage);

		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}

	// 일반탈퇴회원 삭제처리
	@Override
	public void memberdeletePro(HttpServletRequest req, Model model) {
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String[] checkOne = req.getParameter("guestno").split(",");
		ArrayList<Integer> member_arr = new ArrayList<Integer>();
		
		for (int i = 0; i < checkOne.length; i++) {
			member_arr.add(Integer.parseInt(checkOne[i]));
		
		}
		
		int deleteCnt = dao.memberChkdeletePro(checkOne);
		  
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("pageNum",pageNum);
	}

	// 일반회원제제관리
	@Override
	public void membersanctionManage(HttpServletRequest req, Model model) {
		
		int guestNo = Integer.parseInt(req.getParameter("guestNo"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));


		GuestVO dto = dao.membersanctionManage(guestNo);
		model.addAttribute("dto", dto);
		model.addAttribute("guestNo", guestNo);
		model.addAttribute("pageNum", pageNum);
	}
	
	// 일반회원제제관리처리
	@Override
	public void membersanctionManagePro(HttpServletRequest req, Model model) {
		
		int guestNo = Integer.parseInt(req.getParameter("guestNo"));
		String guestname = req.getParameter("guestname");
		String guestid = req.getParameter("guestid");
		int sanctions = Integer.parseInt(req.getParameter("sanctions"));
		String reason = req.getParameter("reason");
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		GuestVO dto = new GuestVO();
		
		if(reason == null) {
			reason = " ";
		}
		
		dto.setGuestNo(guestNo);
		dto.setGuestname(guestname);
		dto.setGuestid(guestid);
		dto.setSanctions(sanctions);
		dto.setReason(reason);
		
		int updateCnt = dao.membersanctionManagePro(dto);
		
		model.addAttribute("updateCnt",updateCnt);
		model.addAttribute("guestNo", guestNo);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("sanctions",sanctions);
	}
	
//--------------------------------------------------------------------------------------	
	
	// 의사회원목록
	@Override
	public void doctorList(HttpServletRequest req, Model model) {

		
	}

//--------------------------------------------------------------------------------------	
	
	// 약 목록
	@Override
	public void drugList(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		int pageSize = 50; // 한 페이지당 출력할 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수

		int cnt = 0; // 갯수
		int start = 0; // 현재 페이지 시작 번호
		int end = 0; // 현재 페이지 마지막 번호
		int number = 0; // 출력용 번호
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 5단계. 갯수 구하기
		cnt = dao.getDrugListCnt();
		System.out.println("cnt : " + cnt); // 먼저 테이블에 30건을 insert 할것

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫페이지
		}

		currentPage = Integer.parseInt(pageNum); // 현재페이지 : 1
		System.out.println("currentPage : " + currentPage);

		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지갯수 + 나머지

		start = (currentPage - 1) * pageSize + 1; // 현재페이지의 시작번호

		end = start + pageSize - 1; // 현재페이지 마지막번호

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize; // 출력용 번호

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		if (cnt > 0) {
			// 게시글 목록 조회
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<DrugVO> dtos = dao.getDrugList(map);
			System.out.println("dtos : " + dtos.size());
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 cf)작은 바구니 : 게시글 1건
		}

		// 1 = (1 / 3) * 3 + 1
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작 페이지
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);

		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1; // 마지막 페이지
		if (endPage > pageCount)
			endPage = pageCount;

		System.out.println("endPage : " + endPage);

		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)

		model.addAttribute("cnt", cnt); // 재고 갯수
		model.addAttribute("number", number); // 재고 번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
				
	}

//--------------------------------------------------------------------------------------	
	
	// 질병목록
	@Override
	public void diseaseList(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		int pageSize = 50; // 한 페이지당 출력할 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수

		int cnt = 0; // 갯수
		int start = 0; // 현재 페이지 시작 번호
		int end = 0; // 현재 페이지 마지막 번호
		int number = 0; // 출력용 번호
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 5단계. 갯수 구하기
		cnt = dao.getDiseaseListCnt();
		System.out.println("cnt : " + cnt); // 먼저 테이블에 30건을 insert 할것

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫페이지
		}

		currentPage = Integer.parseInt(pageNum); // 현재페이지 : 1
		System.out.println("currentPage : " + currentPage);

		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지갯수 + 나머지

		start = (currentPage - 1) * pageSize + 1; // 현재페이지의 시작번호

		end = start + pageSize - 1; // 현재페이지 마지막번호

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize; // 출력용 번호

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		if (cnt > 0) {
			// 게시글 목록 조회
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<DiseaseVO> dtos = dao.getDiseaseList(map);
			System.out.println("dtos : " + dtos.size());
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 cf)작은 바구니 : 게시글 1건
		}

		// 1 = (1 / 3) * 3 + 1
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작 페이지
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);

		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1; // 마지막 페이지
		if (endPage > pageCount)
			endPage = pageCount;

		System.out.println("endPage : " + endPage);

		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)

		model.addAttribute("cnt", cnt); // 재고 갯수
		model.addAttribute("number", number); // 재고 번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
				
	}

	// 질병목록 삭제처리
	@Override
	public void diseasedeletePro(HttpServletRequest req, Model model) {
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String[] checkOne = req.getParameter("diseaseCode").split(",");
		ArrayList<Integer> disease_arr = new ArrayList<Integer>();
		
		for (int i = 0; i < checkOne.length; i++) {
			disease_arr.add(Integer.parseInt(checkOne[i]));
		}
		
		int deleteCnt = dao.diseaseChkdeletePro(checkOne);
		  
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("pageNum",pageNum);
	}

	// 질병검색목록
	@Override
	public void diseaseSearchList(HttpServletRequest req, Model model) {

		int pageSize = 50; // 한 페이지당 출력할 글 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글 갯수 30 db num 젤큰수 50 게시글 30개밖에20개지워지고
		int start = 0; // 현재페이지 시작 글번호
		int end = 0; // 현재페이지 마지막 글번호
		int number = 0; // 출력용 글번호 30
		String pageNum = null; // 페이지번호
		int currentPage = 0; // 현재페이지

		int pageCnt = 0; // 페이지갯수
		int startPage = 0; // 현재블록 시작 페이지
		int endPage = 0; // 현재블록 마지막 페이지

		int sc = Integer.parseInt(req.getParameter("sc"));
		String search = req.getParameter("search");
		// 5단계. 글갯수 구하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sc", sc);
		map.put("search", search);
		System.out.println("검색종류 : " + sc);
		System.out.println("검색내용 : " + search);
		cnt = dao.search_diseaseListCnt(map);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1";
		}

		// 글 30건기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage " + currentPage);
		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCnt = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);

		// (1-1)*5 + 1
		start = (currentPage - 1) * pageSize + 1; // 현재 페이지의 시작번호 1

		// 5 = 1 + 5
		end = start + pageSize - 1; // 현재페이지의 마지막 번호 5
		System.out.println("start " + start);
		System.out.println("end " + end);

		// 30 = 30 - ( 1 - 1 ) * 5
		// 25 = 30 - ( 2 - 1 ) * 5
		number = 1; // 출력용 글번호
		System.out.println("number " + number);

		ArrayList<DiseaseVO> dtos = null;
		if (cnt > 0) {
			// 게시글 목록 조회

			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("sc", sc);
			map2.put("search", search);
			map2.put("start", start);
			map2.put("end", end);

			dtos = dao.search_diseaseList(map2);
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글목록 cf)작은바구니 : 게시글 1건
		}

		// 1 = (1 / 3) * 3 + 1
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock; // 나머지 계산
		}
		System.out.println("startPage " + startPage);
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1; // 마지막 페이지
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		System.out.println("endPage " + endPage);

		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
		
	}
	
	// 질병추가 처리
	@Override
	public void diseaseAddPro(HttpServletRequest req, Model model) {
		
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String diseaseName = req.getParameter("diseaseName");
		String diseaseDefine = req.getParameter("diseaseDefine");
		String diseaseCause = req.getParameter("diseaseCause");
		String diseaseSymptom = req.getParameter("diseaseSymptom");
		String diseaseDiagnosis = req.getParameter("diseaseDiagnosis");
		String diseaseCure = req.getParameter("diseaseCure");
		String complications = req.getParameter("complications");
		String prevention = req.getParameter("prevention");
		
		DiseaseVO dto = new DiseaseVO();
		
		dto.setDiseaseName(diseaseName);
		dto.setDiseaseDefine(diseaseDefine);
		dto.setDiseaseCause(diseaseCause);
		dto.setDiseaseSymptom(diseaseSymptom);
		dto.setDiseaseDiagnosis(diseaseDiagnosis);
		dto.setDiseaseCure(diseaseCure);
		dto.setComplications(complications);
		dto.setPrevention(prevention);

		int insertCnt = dao.diseaseAdd(dto);
		
		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("pageNum", pageNum);
	}

	
	// 질병 수정 폼
	@Override
	public void diseaseModify(HttpServletRequest req, Model model) {
		
		int diseaseCode = Integer.parseInt(req.getParameter("diseaseCode"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		// 5-2단계. 목록 1건을 읽어온다.
		DiseaseVO dto = dao.diseaseModify(diseaseCode);
		model.addAttribute("dto", dto);

		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("diseaseCode", diseaseCode);
		model.addAttribute("pageNum", pageNum);
	}
	
	// 질병수정 처리
	@Override
	public void diseaseModifyPro(HttpServletRequest req, Model model) {
		
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int diseaseCode = Integer.parseInt(req.getParameter("diseaseCode"));
		String diseaseName = req.getParameter("diseaseName");
		String diseaseDefine = req.getParameter("diseaseDefine");
		String diseaseCause = req.getParameter("diseaseCause");
		String diseaseSymptom = req.getParameter("diseaseSymptom");
		String diseaseDiagnosis = req.getParameter("diseaseDiagnosis");
		String diseaseCure = req.getParameter("diseaseCure");
		String complications = req.getParameter("complications");
		String prevention = req.getParameter("prevention");
		
		DiseaseVO dto = new DiseaseVO();
		
		dto.setDiseaseCode(diseaseCode);
		dto.setDiseaseName(diseaseName);
		dto.setDiseaseDefine(diseaseDefine);
		dto.setDiseaseCause(diseaseCause);
		dto.setDiseaseSymptom(diseaseSymptom);
		dto.setDiseaseDiagnosis(diseaseDiagnosis);
		dto.setDiseaseCure(diseaseCure);
		dto.setComplications(complications);
		dto.setPrevention(prevention);

		int updateCnt = dao.diseaseModifyPro(dto);
		
		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("diseaseCode",diseaseCode);
		model.addAttribute("pageNum", pageNum);
	}

	
//--------------------------------------------------------------------------------------	
/*
	// 운동목록
	@Override
	public void exerciseList(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		int pageSize = 50; // 한 페이지당 출력할 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수

		int cnt = 0; // 갯수
		int start = 0; // 현재 페이지 시작 번호
		int end = 0; // 현재 페이지 마지막 번호
		int number = 0; // 출력용 번호
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 5단계. 갯수 구하기
		cnt = dao.getExerciseListCnt();
		System.out.println("cnt : " + cnt); // 먼저 테이블에 30건을 insert 할것

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫페이지
		}

		currentPage = Integer.parseInt(pageNum); // 현재페이지 : 1
		System.out.println("currentPage : " + currentPage);

		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지갯수 + 나머지

		start = (currentPage - 1) * pageSize + 1; // 현재페이지의 시작번호

		end = start + pageSize - 1; // 현재페이지 마지막번호

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize; // 출력용 번호

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		if (cnt > 0) {
			// 게시글 목록 조회
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<ExerciseVO> dtos = dao.getExerciseList(map);
			System.out.println("dtos : " + dtos.size());
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 cf)작은 바구니 : 게시글 1건
		}

		// 1 = (1 / 3) * 3 + 1
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작 페이지
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);

		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1; // 마지막 페이지
		if (endPage > pageCount)
			endPage = pageCount;

		System.out.println("endPage : " + endPage);

		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)

		model.addAttribute("cnt", cnt); // 재고 갯수
		model.addAttribute("number", number); // 재고 번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
				
	}

	// 운동목록 삭제처리
	@Override
	public void exercisedeletePro(HttpServletRequest req, Model model) {
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String[] checkOne = req.getParameter("exerciseName").split(",");
		ArrayList<String> exercise_arr = new ArrayList<String>();
		
		for (int i = 0; i < checkOne.length; i++) {
			exercise_arr.add(checkOne[i]);
		}
		
		int deleteCnt = dao.exerciseChkdeletePro(checkOne);
		  
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("pageNum",pageNum);
	}

	// 운동검색목록
	@Override
	public void exerciseSearchList(HttpServletRequest req, Model model) {

		int pageSize = 50; // 한 페이지당 출력할 글 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수

		int cnt = 0; // 글 갯수 30 db num 젤큰수 50 게시글 30개밖에20개지워지고
		int start = 0; // 현재페이지 시작 글번호
		int end = 0; // 현재페이지 마지막 글번호
		int number = 0; // 출력용 글번호 30
		String pageNum = null; // 페이지번호
		int currentPage = 0; // 현재페이지

		int pageCnt = 0; // 페이지갯수
		int startPage = 0; // 현재블록 시작 페이지
		int endPage = 0; // 현재블록 마지막 페이지

		int sc = Integer.parseInt(req.getParameter("sc"));
		String search = req.getParameter("search");
		// 5단계. 글갯수 구하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sc", sc);
		map.put("search", search);
		System.out.println("검색종류 : " + sc);
		System.out.println("검색내용 : " + search);
		cnt = dao.search_exerciseListCnt(map);

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1";
		}

		// 글 30건기준
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage " + currentPage);
		// 페이지 갯수 6 = (30 / 5 ) + (0)
		pageCnt = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);

		// (1-1)*5 + 1
		start = (currentPage - 1) * pageSize + 1; // 현재 페이지의 시작번호 1

		// 5 = 1 + 5
		end = start + pageSize - 1; // 현재페이지의 마지막 번호 5
		System.out.println("start " + start);
		System.out.println("end " + end);

		// 30 = 30 - ( 1 - 1 ) * 5
		// 25 = 30 - ( 2 - 1 ) * 5
		number = 1; // 출력용 글번호
		System.out.println("number " + number);

		ArrayList<ExerciseVO> dtos = null;
		if (cnt > 0) {
			// 게시글 목록 조회

			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("sc", sc);
			map2.put("search", search);
			map2.put("start", start);
			map2.put("end", end);

			dtos = dao.search_exerciseList(map2);
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글목록 cf)작은바구니 : 게시글 1건
		}

		// 1 = (1 / 3) * 3 + 1
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작페이지
		if (currentPage % pageBlock == 0) {
			startPage -= pageBlock; // 나머지 계산
		}
		System.out.println("startPage " + startPage);
		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1; // 마지막 페이지
		if (endPage > pageCnt) {
			endPage = pageCnt;
		}
		System.out.println("endPage " + endPage);

		model.addAttribute("cnt", cnt); // 글갯수
		model.addAttribute("number", number); // 글번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCnt", pageCnt); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
		
	}
	
	// 운동추가 처리
	@Override
	public void exerciseAddPro(HttpServletRequest req, Model model) {
		
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String exerciseName = req.getParameter("exerciseName");
		String exerciseMethod = req.getParameter("exerciseMethod");
		String exercisePurpose = req.getParameter("exercisePurpose");
		String exerciseMerit = req.getParameter("exerciseMerit");
		String exerciseDemerits = req.getParameter("exerciseDemerits");
		String exerciseCaution = req.getParameter("exerciseCaution");
		
		ExerciseVO dto = new ExerciseVO();
		
		dto.setExerciseName(exerciseName);
		dto.setExerciseMethod(exerciseMethod);
		dto.setExercisePurpose(exercisePurpose);
		dto.setExerciseMerit(exerciseMerit);
		dto.setExerciseDemerits(exerciseDemerits);
		dto.setExerciseCaution(exerciseCaution);

		int insertCnt = dao.exerciseAdd(dto);
		
		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("pageNum", pageNum);
	}

	// 운동 수정 폼
	@Override
	public void exerciseModify(HttpServletRequest req, Model model) {
		
		String exerciseName = req.getParameter("exerciseName");
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		// 5-2단계. 목록 1건을 읽어온다.
		ExerciseVO dto = dao.exerciseModify(exerciseName);
		model.addAttribute("dto", dto);

		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("exerciseName", exerciseName);
		model.addAttribute("pageNum", pageNum);
	}
	
	// 운동수정 처리
	@Override
	public void exerciseModifyPro(HttpServletRequest req, Model model) {
		
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String exerciseName = req.getParameter("exerciseName");
		String exerciseMethod = req.getParameter("exerciseMethod");
		String exercisePurpose = req.getParameter("exercisePurpose");
		String exerciseMerit = req.getParameter("exerciseMerit");
		String exerciseDemerits = req.getParameter("exerciseDemerits");
		String exerciseCaution = req.getParameter("exerciseCaution");
		
		ExerciseVO dto = new ExerciseVO();
		
		dto.setExerciseName(exerciseName);
		dto.setExerciseMethod(exerciseMethod);
		dto.setExercisePurpose(exercisePurpose);
		dto.setExerciseMerit(exerciseMerit);
		dto.setExerciseDemerits(exerciseDemerits);
		dto.setExerciseCaution(exerciseCaution);

		int updateCnt = dao.exerciseModifyPro(dto);
		
		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("exerciseName",exerciseName);
		model.addAttribute("pageNum", pageNum);
	}
*/
	//--------------------------------------------------------------------------------------	

	// 예방접종 목록
	@Override
	public void apreventionList(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		int pageSize = 50; // 한 페이지당 출력할 갯수
		int pageBlock = 5; // 한 블럭당 페이지 갯수

		int cnt = 0; // 갯수
		int start = 0; // 현재 페이지 시작 번호
		int end = 0; // 현재 페이지 마지막 번호
		int number = 0; // 출력용 번호
		String pageNum = null; // 페이지 번호
		int currentPage = 0; // 현재 페이지

		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지

		// 5단계. 갯수 구하기
		cnt = dao.getApreventionListCnt();
		System.out.println("cnt : " + cnt); // 먼저 테이블에 30건을 insert 할것

		pageNum = req.getParameter("pageNum");

		if (pageNum == null) {
			pageNum = "1"; // 첫페이지
		}

		currentPage = Integer.parseInt(pageNum); // 현재페이지 : 1
		System.out.println("currentPage : " + currentPage);

		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); // 페이지갯수 + 나머지

		start = (currentPage - 1) * pageSize + 1; // 현재페이지의 시작번호

		end = start + pageSize - 1; // 현재페이지 마지막번호

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		if (end > cnt)
			end = cnt;

		// 30 = 30 - (1 - 1) * 5
		number = cnt - (currentPage - 1) * pageSize; // 출력용 번호

		System.out.println("number : " + number);
		System.out.println("pageSize : " + pageSize);

		if (cnt > 0) {
			// 게시글 목록 조회
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<PreventionVO> dtos = dao.getApreventionList(map);
			System.out.println("dtos : " + dtos.size());
			model.addAttribute("dtos", dtos); // 큰바구니 : 게시글 cf)작은 바구니 : 게시글 1건
			
			
			
			Map<String,Object> map2 = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			
			ArrayList<DiseaseVO> dtos2 = dao.getApreventionList2(map2);
			System.out.println("dtos2 : " + dtos2.size());
			model.addAttribute("dtos2", dtos2); // 큰바구니 : 게시글 cf)작은 바구니 : 게시글 1건
		}

		// 1 = (1 / 3) * 3 + 1
		startPage = (currentPage / pageBlock) * pageBlock + 1; // 시작 페이지
		if (currentPage % pageBlock == 0)
			startPage -= pageBlock;

		System.out.println("startPage : " + startPage);

		// 3 = 1 + 3 - 1
		endPage = startPage + pageBlock - 1; // 마지막 페이지
		if (endPage > pageCount)
			endPage = pageCount;

		System.out.println("endPage : " + endPage);

		// 6단계. request나 session에 처리결과를 저장(jsp에 전달하기 위함)

		model.addAttribute("cnt", cnt); // 재고 갯수
		model.addAttribute("number", number); // 재고 번호
		model.addAttribute("pageNum", pageNum); // 페이지 번호

		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("currentPage", currentPage); // 현재 페이지
		}
	}
	
//---------------------------------------------------------------------------------------- 희성
	// 이벤트추가
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
            dto.setAdvertisementTitle(advertisementTitle);
            dto.setAdvertisementThumbnail(advertisementThumbnail);
            dto.setAdvertisementImage(advertisementImage);
            dto.setAdvertisementContents(advertisementContents);
            dto.setAdvertisementKind(advertisementKind);
            dto.setAdvertisementStart(advertisementStart);
            dto.setAdvertisementEnd(advertisementEnd);
            dto.setAdvertisementState(1);
            
            int insertCnt = 0;
            insertCnt = dao.addEvent(dto);
            
            model.addAttribute("insertCnt", insertCnt);
            
        } catch(IOException e) {
            e.printStackTrace();
        }      
		
	}
	// 이벤트수정
	@Override
	public void eventUp(MultipartHttpServletRequest req, Model model) {
		int advertisementNo = Integer.parseInt(req.getParameter("advertisementNo"));
        EventVO dto = codao.eventInfo(advertisementNo);
        
		if(req.getParameter("image") != null) {
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
	                String advertisementThumbnail = file2.getOriginalFilename();
	        		String advertisementImage = file.getOriginalFilename();
	        		dto.setAdvertisementThumbnail(advertisementThumbnail);
	                dto.setAdvertisementImage(advertisementImage);
	        	          
	            
	        } catch(IOException e) {
	            e.printStackTrace();
	        }   
		} 
        
		String advertisementTitle = req.getParameter("title");    		
		String advertisementContents = req.getParameter("content");
		int advertisementKind = Integer.parseInt(req.getParameter("kind"));
		String date1 = req.getParameter("date1");
		Date advertisementStart = Date.valueOf(date1);
		String date2 = req.getParameter("date2");
		Date advertisementEnd = Date.valueOf(date2);
		System.out.println(advertisementStart);
		System.out.println(advertisementEnd);      
        
        dto.setAdvertisementTitle(advertisementTitle);           
        dto.setAdvertisementContents(advertisementContents);
        dto.setAdvertisementKind(advertisementKind);
        dto.setAdvertisementStart(advertisementStart);
        dto.setAdvertisementEnd(advertisementEnd);
        dto.setAdvertisementState(1);
        
        int insertCnt = 0;
        insertCnt = dao.upEvent(dto);
        
        model.addAttribute("insertCnt", insertCnt);
	}
	// 이벤트삭제
	@Override
	public void eventDel(HttpServletRequest req, Model model) {
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String[] checkOne = req.getParameter("advertisementNo").split(",");
		ArrayList<Integer> member_arr = new ArrayList<Integer>();
		
		for (int i = 0; i < checkOne.length; i++) {
			member_arr.add(Integer.parseInt(checkOne[i]));
			System.out.println(Integer.parseInt(checkOne[i]));
		}
		
		int deleteCnt = dao.delChkEvent(checkOne);
		  
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("pageNum",pageNum);
	}


	
	//--------------------------------------------------------------------------------------
}
