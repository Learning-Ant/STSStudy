package com.koreait.spring;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

public class SpringMainClass {

	public static void main(String[] args) {

		AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(AppContext.class);
		
		Student s1 = ctx.getBean("student1", Student.class);
		Student s2 = ctx.getBean("student2", Student.class);
		
		s1.studentInfo();
		s2.studentInfo();
		
		ctx.close();
	}

}
