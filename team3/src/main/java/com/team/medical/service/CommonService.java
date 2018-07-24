package com.team.medical.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface CommonService {
	// 질문 목록
	public void boardList(HttpServletRequest req, Model model);
	// 질문 상세
	public void boardInfo(HttpServletRequest req, Model model);
	// 질문등록 처리
	public void boardAddPro(HttpServletRequest req, Model model);
	// 질문수정상세페이지
	public void boardModify(HttpServletRequest req, Model model);
	// 질문수정처리페이지
	public void boardModifyPro(HttpServletRequest req, Model model);
	// 질문삭제 처리페이지
	public void boardDeletePro(HttpServletRequest req, Model model);
	//  의사 댓글작성
	public void inputre(HttpServletRequest req, Model model);
	// 이벤트 추가
	public void eventAdd(MultipartHttpServletRequest req, Model model);
	// 이벤트 리스트
	public void eventList(HttpServletRequest req, Model model);
	// 이벤트 상세 페이지
	public void eventInfo(HttpServletRequest req, Model model);
}
