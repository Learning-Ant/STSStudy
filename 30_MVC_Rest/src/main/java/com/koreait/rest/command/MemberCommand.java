package com.koreait.rest.command;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface MemberCommand {
	// Map으로 설정한 이유
	// DML 명령어(insert, update, delete)들은 결과값으로 int를 반환한다..
	// 하지만 select 명령어는 결과값으로 객체(MemberDto)를 반환한다..
	// 모든 Command들의 결과값들이 하나의 타입이 아니기 때문에
	// 모든 결과값들을 다루기 위해 가장 적당한 Map타입을 사용한다.(key와 value의 pairing)
	// 이렇게하면 어떤 반환타입이 되더라도 Map에 저장하여 결과를 반환할 수 있는 것이다.
	// 왜 굳이 model에 저장하지 않는가? -> 이건 ajax처리와 관계있는 건가?
	// ajax에서는 model을 사용하지 못하는건가?
	public Map<String, Object> execute(SqlSession sqlSession, Model model) throws Exception;
}