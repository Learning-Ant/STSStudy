package com.koreait.finalproject.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.finalproject.dao.BoardDao;
import com.koreait.finalproject.dto.BoardDto;

public class BoardInsertCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		RedirectAttributes rttr = (RedirectAttributes)model.asMap().get("rttr"); 
		BoardDto boardDto = (BoardDto)model.asMap().get("boardDto");
		
		rttr.addFlashAttribute("insertResult", boardDao.insertBoard(boardDto));
	}

}
