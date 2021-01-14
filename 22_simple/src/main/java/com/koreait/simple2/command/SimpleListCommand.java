package com.koreait.simple2.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.koreait.simple2.dao.SimpleDao;
import com.koreait.simple2.dto.SimpleDto;

public class SimpleListCommand implements SimpleCommand {

	// field
	@Autowired
	private SimpleDao simpleDao=new SimpleDao();
	
	
	/*
	 * private SimpleDao simpleDao;
	 * 
	 * @Autowired
	 * public void setDao(SimpleDao simpleDao) {
	 * 	this.simpleDao = simpleDao;
	 * }
	 */
	
	// method
	@Override
	public void execute(Model model) {
		
		List<SimpleDto> list = simpleDao.simpleList();
		model.addAttribute("list",list);
	}

}
