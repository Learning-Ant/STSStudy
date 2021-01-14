package com.koreait.simple3.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.koreait.simple3.command.SimpleDeleteCommand;
import com.koreait.simple3.command.SimpleInsertCommand;
import com.koreait.simple3.command.SimpleListCommand;
import com.koreait.simple3.command.SimpleUpdateCommand;
import com.koreait.simple3.command.SimpleViewCommand;
import com.koreait.simple3.dao.SimpleDao;

/*
 * @Configuration
 * root-context.xml 처럼 Bean을 만드는 java class
 * 
 */

@Configuration
public class AppContext {
	/*
	 * @Bean
	 * Bean을 만드는 메소드
	 */
	/*
	 * 반환타입 : SimpleListCommand - > <bean class="~.SimpleListCommand" />
	 * 메소드명 : listCommand -> <bean id="listCommand" />
	 */
	
	@Bean
	public SimpleListCommand listCommand() {
		return new SimpleListCommand();
	}
	
	@Bean
	public SimpleInsertCommand insertCommand() {
		return new SimpleInsertCommand();
	}
	
	@Bean
	public SimpleViewCommand viewCommand() {
		return new SimpleViewCommand();
	}

	@Bean
	public SimpleUpdateCommand updateCommand() {
		return new SimpleUpdateCommand();
	}
	
	@Bean
	public SimpleDeleteCommand deleteCommand() {
		return new SimpleDeleteCommand();
	}
	
	@Bean
	public SimpleDao simpleDao() {
		return new SimpleDao();
	}
	
}
