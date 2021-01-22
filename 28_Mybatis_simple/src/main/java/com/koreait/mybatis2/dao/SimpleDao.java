package com.koreait.mybatis2.dao;

import java.util.List;

import com.koreait.mybatis2.dto.SimpleDto;

public interface SimpleDao {
	
	// public List<SimpleDto> simpleList();
	
	public List<SimpleDto> simpleList(int beginRecord, int endRecord);
	
	public int totalRecord();
	
	public int simpleInsert(SimpleDto simpleDto);
	
	public int simpleUpdate(String title, String content, int no);
	
	public int simpleDelete(int no);
	
	public SimpleDto simpleView(int no);
	
}
