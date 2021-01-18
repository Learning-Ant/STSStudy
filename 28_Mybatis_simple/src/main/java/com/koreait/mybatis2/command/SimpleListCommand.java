package com.koreait.mybatis2.command;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.mybatis2.dao.SimpleDao;
import com.koreait.mybatis2.dto.SimpleDto;

public class SimpleListCommand implements SimpleCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		SimpleDao simpleDao = sqlSession.getMapper(SimpleDao.class);
		
		List<SimpleDto> list = simpleDao.simpleList();
		
		model.addAttribute("list",list);
		// model.addAttribute("totalCount", list.size());
		// paging 처리 할 때는 이런식으로 할 수 없다.
		// 따로 구현해야할 것 같다.
		model.addAttribute("totalCount", simpleDao.totalCount());
	}

}
