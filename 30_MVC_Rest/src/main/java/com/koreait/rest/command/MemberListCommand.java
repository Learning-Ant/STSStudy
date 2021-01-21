package com.koreait.rest.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.rest.dao.MemberDao;
import com.koreait.rest.dto.MemberDto;

public class MemberListCommand implements MemberCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) throws Exception {
		
		MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		List<MemberDto> list = memberDao.memberList();
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		if(list.size()>0) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		
		return map;
	}

}
