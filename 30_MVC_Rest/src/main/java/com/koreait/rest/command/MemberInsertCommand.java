package com.koreait.rest.command;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.rest.dao.MemberDao;
import com.koreait.rest.dto.MemberDto;

public class MemberInsertCommand implements MemberCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) throws Exception {
		// 넘어온 model 안에 attribute로 memberDto가 저장되어 있다.
		
		MemberDto memberDto = (MemberDto)model.asMap().get("memberDto");
		
		Map<String, Object> resultMap = new HashMap<>();
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		resultMap.put("result", memberDao.memberInsert(memberDto));
		
		return resultMap;
	}

}
