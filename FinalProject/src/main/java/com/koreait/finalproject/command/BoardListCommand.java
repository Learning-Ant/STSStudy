package com.koreait.finalproject.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.finalproject.dao.BoardDao;

public class BoardListCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		model.addAttribute("list", boardDao.selectBoardList());
		model.addAttribute("totalBoard", boardDao.selectBoardCount());
		
	}

}
