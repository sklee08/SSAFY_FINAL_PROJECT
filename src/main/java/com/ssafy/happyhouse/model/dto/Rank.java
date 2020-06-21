package com.ssafy.happyhouse.model.dto;

public class Rank {
	
	private String keyword;
	private String attribute;
	private int cnt;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public String getAttribute() {
		return attribute;
	}
	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}
	
	public Rank(String keyword, String attribute, int cnt) {
		super();
		this.keyword = keyword;
		this.attribute = attribute;
		this.cnt = cnt;
	}
	
	
}
