package com.team.medical.vo;

import java.sql.Date;

public class QuestionBoardVO {
	private int boardno;			// 게시글번호
	private String boardtitle;		// 게시글제목
	private String boardcontent;	// 게시글내용
	private String boardwriter;		// 작성자
	private int ref;				// 댓글유무
	private String boardpwd;		// 게시글 비밀번호
	private Date boarddate;			// 작성일
	private int notify;				// 신고여부
	private int notifycnt;			// 신고갯수
	private String notifyreason;	// 신고사유
	private int kind;				// 게시글종류
		
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getBoardtitle() {
		return boardtitle;
	}
	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}
	public String getBoardcontent() {
		return boardcontent;
	}
	public void setBoardcontent(String boardcontent) {
		this.boardcontent = boardcontent;
	}
	public String getBoardwriter() {
		return boardwriter;
	}
	public void setBoardwriter(String boardwriter) {
		this.boardwriter = boardwriter;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getBoardpwd() {
		return boardpwd;
	}
	public void setBoardpwd(String boardpwd) {
		this.boardpwd = boardpwd;
	}
	public Date getBoarddate() {
		return boarddate;
	}
	public void setBoarddate(Date boarddate) {
		this.boarddate = boarddate;
	}
	public int getNotify() {
		return notify;
	}
	public void setNotify(int notify) {
		this.notify = notify;
	}
	public int getNotifycnt() {
		return notifycnt;
	}
	public void setNotifycnt(int notifycnt) {
		this.notifycnt = notifycnt;
	}
	public String getNotifyreason() {
		return notifyreason;
	}
	public void setNotifyreason(String notifyreason) {
		this.notifyreason = notifyreason;
	}

	
}
