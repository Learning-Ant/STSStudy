package com.koreait.finalproject.dto;

import java.sql.Date;

public class BoardDto {

	private int bIdx;
	private String bWriter, bTitle, bContent;
	private Date bDate;
	
	public BoardDto() {}
	public BoardDto(int bIdx, String bWriter, String bTitle, String bContent, Date bDate) {
		super();
		this.bIdx = bIdx;
		this.bWriter = bWriter;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDate = bDate;
	}
	
	public int getbIdx() {
		return bIdx;
	}
	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}
	public String getbWriter() {
		return bWriter;
	}
	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	
}
