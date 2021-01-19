package com.koreait.mybatis3.dao;

import java.util.List;

import com.koreait.mybatis3.dto.BoardDto;

public interface BoardDao {
	
	// 메소드의 이름이 mapper의 쿼리문(<select>태그)의 id가 된다.
	public List<BoardDto> boardList();
	
	public int boardInsert(String writer, String title, String content, String filename);
	
	public BoardDto boardView(int no);
	
	public int boardDelete(int no);
}
