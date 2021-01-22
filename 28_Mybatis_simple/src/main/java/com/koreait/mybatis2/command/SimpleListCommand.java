package com.koreait.mybatis2.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.mybatis2.common.Paging;
import com.koreait.mybatis2.dao.SimpleDao;
import com.koreait.mybatis2.dto.SimpleDto;

public class SimpleListCommand implements SimpleCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		SimpleDao simpleDao = sqlSession.getMapper(SimpleDao.class);
		
		HttpServletRequest request = (HttpServletRequest)model.asMap().get("request");
		
		
		int page=1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int totalRecord = simpleDao.totalRecord();
		
		// SimpleList는 한 페이지에 몇 개의 레코드를 표시할 것인지 여기서 결정한다.
		int recordPerPage = 2;	// 각 ListCommand마다 다르게 설정해도 된다.
		int beginRecord = (page - 1)*recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		endRecord = endRecord > totalRecord ? totalRecord : endRecord;
		
		// beginRecord + endRecord를 list를 가져오는 simpleList()에 전달한다.
		List<SimpleDto> list = simpleDao.simpleList(beginRecord, endRecord);
		
		// Paging을 만든다. ( 이전 1 2 3 4 5 다음)
		// 아래 paging의 path는 List마다 다르다.
		// SimpleListCommand : simpleListPage.do
		// BoardListCommand : boardListPage.do
		// 검색결과의 페이징 : boardListPage.do?query=검색어
		String paging = Paging.getPaging("simpleListPage.do", totalRecord, recordPerPage, page);
		
		model.addAttribute("list",list);
		model.addAttribute("paging",paging);
		model.addAttribute("totalRecord",totalRecord);
		model.addAttribute("page",page);
		model.addAttribute("recordPerPage", recordPerPage);
		// model.addAttribute("totalCount", list.size());
		// paging 처리 할 때는 이런식으로 할 수 없다.
		// 따로 구현해야할 것 같다.
		// model.addAttribute("totalCount", simpleDao.totalCount());
	}

}
