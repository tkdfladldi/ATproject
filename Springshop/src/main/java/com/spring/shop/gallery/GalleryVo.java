package com.spring.shop.gallery;

import org.springframework.web.multipart.MultipartFile;

public class GalleryVo {
		
	private int gid;
	private String title;
	private String content;
	private String reg_id;
	private String reg_date;
	private String fileName;
	private String fakeName;
	private MultipartFile file;
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
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
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFakeName() {
		return fakeName;
	}
	public void setFakeName(String fakeName) {
		this.fakeName = fakeName;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "GalleryVo [gid=" + gid + ", title=" + title + ", content=" + content + ", reg_id=" + reg_id
				+ ", reg_date=" + reg_date + ", fileName=" + fileName + ", fakeName=" + fakeName + ", file=" + file
				+ "]";
	}
}
