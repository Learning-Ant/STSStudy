package com.koreait.mybatis2.command;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.mybatis2.dao.SimpleDao;

public class SimpleUpdateCommand implements SimpleCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		HttpServletRequest request = (HttpServletRequest)model.asMap().get("request");
		RedirectAttributes rttr = (RedirectAttributes)model.asMap().get("rttr");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		SimpleDao simpleDao = sqlSession.getMapper(SimpleDao.class);
		
		int updateResult = simpleDao.simpleUpdate(title, content, no);
		
		rttr.addFlashAttribute("updateResult", updateResult);
		rttr.addFlashAttribute("afterUpdate", true);
	}

}
