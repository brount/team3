package com.team.medical.vo;

public class CheckupresultVO {
	private String head;		// 항목명 (영어)
    private String value;		// 비교수치
    private int state;			// 상태  - 초과 : 1,  미만 : 2
    private String content;		// 관련내용
    private String name;		// 항목명 (한글)
    
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}       
}
