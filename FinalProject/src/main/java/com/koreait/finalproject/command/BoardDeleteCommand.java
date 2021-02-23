package com.koreait.finalproject.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.finalproject.dao.BoardDao;

public class BoardDeleteCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		RedirectAttributes rttr = (RedirectAttributes)model.asMap().get("rttr");
		
		int bIdx = (Integer)model.asMap().get("bIdx");
		
		rttr.addFlashAttribute("deleteResult", boardDao.deleteBoard(bIdx));
	}

}
