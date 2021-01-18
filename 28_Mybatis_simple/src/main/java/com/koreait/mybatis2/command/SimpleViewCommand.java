package com.koreait.mybatis2.command;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.mybatis2.dao.SimpleDao;

public class SimpleViewCommand implements SimpleCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		int no = Integer.parseInt(request.getParameter("no"));
		SimpleDao simpleDao = sqlSession.getMapper(SimpleDao.class);
		
		model.addAttribute("simpleDto", simpleDao.simpleView(no));
	}

}
