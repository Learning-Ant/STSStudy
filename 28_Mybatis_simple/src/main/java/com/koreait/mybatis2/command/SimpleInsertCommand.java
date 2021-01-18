package com.koreait.mybatis2.command;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.mybatis2.dao.SimpleDao;
import com.koreait.mybatis2.dto.SimpleDto;

public class SimpleInsertCommand implements SimpleCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		SimpleDao simpleDao = sqlSession.getMapper(SimpleDao.class);
		
		HttpServletRequest request = (HttpServletRequest)model.asMap().get("request");
		RedirectAttributes rttr = (RedirectAttributes)model.asMap().get("rttr");
		

		SimpleDto simpleDto = new SimpleDto();
		simpleDto.setWriter(request.getParameter("writer"));
		simpleDto.setTitle(request.getParameter("title"));
		simpleDto.setContent(request.getParameter("content"));
		
		int insertResult = simpleDao.simpleInsert(simpleDto);
		
		// model은 리다이렉트할 때 값의 전달이 안 됩니다.
		// model.addAttribute("insertResult",insertResult);
		
		// rttr은 리다이렉트할 때도 값을 전달할 수 있습니다.
		rttr.addFlashAttribute("insertResult", insertResult);
		
		// insert 후에 이동 되었음을 JSP에게 알려준다.
		rttr.addFlashAttribute("afterInsert", true);
	}

}
