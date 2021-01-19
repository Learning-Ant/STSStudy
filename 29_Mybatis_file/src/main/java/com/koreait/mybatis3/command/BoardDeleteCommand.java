package com.koreait.mybatis3.command;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.mybatis3.dao.BoardDao;

public class BoardDeleteCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		RedirectAttributes rttr = (RedirectAttributes) model.asMap().get("rttr");
		
		// 테이블의 데이터 삭제
		int no = Integer.parseInt(request.getParameter("no"));
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		rttr.addFlashAttribute("deleteResult",boardDao.boardDelete(no));
		
		// 첨부가 있으면 첨부파일 삭제
		String filename = request.getParameter("filename");
		String realPath = request.getServletContext().getRealPath("resources/storage");
		File file = new File(realPath, filename);
		if (file.exists()) {
			file.delete();
		}
		
		rttr.addFlashAttribute("afterDelete", true);
	}
}
