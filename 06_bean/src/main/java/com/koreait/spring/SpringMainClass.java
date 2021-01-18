package com.koreait.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class SpringMainClass {

	public static void main(String[] args) {

		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:app-context.xml");
		
		Person p1 = ctx.getBean("person1", Person.class);
		Person p2 = ctx.getBean("person2", Person.class);
		
		p1.personInfo();
		p2.personInfo();
		
		ctx.close();
	}

}
