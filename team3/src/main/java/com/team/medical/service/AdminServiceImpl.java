package com.team.medical.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.team.medical.persitence.AdminDAO;
import com.team.medical.vo.GuestVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDAO dao;
	
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
		String[] checkOne = req.getParameter("guestNo").split(",");
		ArrayList<Integer> member_arr = new ArrayList<Integer>();
		
		for (int i = 0; i < checkOne.length; i++) {
			member_arr.add(Integer.parseInt(checkOne[i]));
		
		}
		
		int deleteCnt = dao.memberChkdeletePro(checkOne);
		  
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("pageNum",pageNum);
	}
	
}
