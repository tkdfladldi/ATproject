package com.spring.shop.notice;


public class NoticeVo {
	private int bid; 
	private String title;
	private String content;
	private String reg_id;
	private String reg_date;
	
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "NoticeVo [bid=" + bid + ", title=" + title + ", content=" + content + ", reg_id=" + reg_id
				+ ", reg_date=" + reg_date + "]";
	}
}
