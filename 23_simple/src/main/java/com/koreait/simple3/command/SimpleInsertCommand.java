package com.koreait.simple3.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.ui.Model;

import com.koreait.simple3.config.AppContext;
import com.koreait.simple3.dao.SimpleDao;
import com.koreait.simple3.dto.SimpleDto;

public class SimpleInsertCommand implements SimpleCommand {

	@Override
	public void execute(Model model) {

		AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(AppContext.class);
		SimpleDao simpleDao = ctx.getBean("simpleDao", SimpleDao.class);
		
		HttpServletRequest request = (HttpServletRequest)model.asMap().get("request");
		SimpleDto simpleDto = new SimpleDto();
		simpleDto.setWriter(request.getParameter("writer"));
		simpleDto.setTitle(request.getParameter("title"));
		simpleDto.setContent(request.getParameter("content"));
		
		simpleDao.simpleInsert(simpleDto);
	}

}
