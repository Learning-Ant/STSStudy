package com.koreait.finalproject.dao;

import java.util.ArrayList;

import com.koreait.finalproject.dto.BoardDto;

public interface BoardDao {

	public ArrayList<BoardDto> selectBoardList(); 
	public int selectBoardCount();
	public int insertBoard(BoardDto boardDto);
	public BoardDto viewBoard(int bIdx);
	public int updateBoard(BoardDto boardDto);
	public int deleteBoard(int bIdx);
	
}
