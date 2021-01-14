package com.koreait.simple2.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.koreait.simple2.dao.SimpleDao;

public class SimpleDeleteCommand implements SimpleCommand {

	@Autowired
	private SimpleDao simpleDao=new SimpleDao();
	
	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest)model.asMap().get("request");
		simpleDao.simpleDelete(Integer.parseInt(request.getParameter("no")));
	}

}
