package com.koreait.simple2.command;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.koreait.simple2.dao.SimpleDao;
import com.koreait.simple2.dto.SimpleDto;

public class SimpleViewCommand implements SimpleCommand {

	@Autowired
	private SimpleDao simpleDao;
	
	@Override
	public void execute(Model model) {
		int no = (int)model.asMap().get("no");
		SimpleDto simpleDto = simpleDao.simpleView(no);
		
		model.addAttribute("simpleDto", simpleDto);
	}

}
