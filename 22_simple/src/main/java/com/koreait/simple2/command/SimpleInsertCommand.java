package com.koreait.simple2.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.koreait.simple2.dao.SimpleDao;
import com.koreait.simple2.dto.SimpleDto;

public class SimpleInsertCommand implements SimpleCommand {

	@Autowired
	private SimpleDao simpleDao;
	
	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest)model.asMap().get("request");
		
		SimpleDto simpleDto = new SimpleDto();
		simpleDto.setWriter(request.getParameter("writer"));
		simpleDto.setTitle(request.getParameter("title"));
		simpleDto.setContent(request.getParameter("content"));
		
		simpleDao.simpleInsert(simpleDto);
		
	}

}
