package com.koreait.finalproject.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.finalproject.dao.BoardDao;

public class BoardViewCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		int bIdx = (Integer)model.asMap().get("bIdx");
		
		model.addAttribute("boardDto", boardDao.viewBoard(bIdx));
	}

}
