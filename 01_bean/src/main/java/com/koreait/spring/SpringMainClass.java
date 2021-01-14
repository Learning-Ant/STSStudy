package com.koreait.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class SpringMainClass {

	public static void main(String[] args) {

		// app-context.xml에 정의된 빈(bean)을 생성하는 클래스가 있다.
		// GenericXmlApplicationContext 클래스이다.
		
		// AbstractApplicationContext는 GenericXmlApplicationContext의 슈퍼클래스이다.
		
		String resourceLocation = "classpath:app-context.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(resourceLocation);
		
		// cal1과 cal2의 생성을 app-context.xml에서 한다.
		// 개발자가 직접 생성하지 않고(new로 객체를 직접 생성하지 않음), app-context.xml에게 빈을 요청하는 방식(getBean()메소드)
		
		// 빈의 생성 권한을 스프링 프레임워크가 가져간다.
		// 개발자가 빈을 생성하지 않는다. => IoC : Inversion of Control (제어 역전)
		
		// getBean(bean태그의 id, bean태그의 class)
		Calculator cal1 = ctx.getBean("calculator1", Calculator.class);
		cal1.add(10, 3);
		cal1.subtract(10, 3);
		cal1.multiply(10, 3);
		cal1.divide(10, 3);
		
		Calculator cal2 = ctx.getBean("calculator2", Calculator.class);
		cal1.add(100, 30);
		cal1.subtract(100, 30);
		cal1.multiply(100, 30);
		cal1.divide(100, 30);
		
		EngineerCalculator eCal1 = ctx.getBean("eCalculator1", EngineerCalculator.class);
		eCal1.add();
		eCal1.subtract();
		eCal1.multiply();
		eCal1.divide();
		
		EngineerCalculator eCal2 = ctx.getBean("eCalculator2", EngineerCalculator.class);
		eCal2.add();
		eCal2.subtract();
		eCal2.multiply();
		eCal2.divide();
		
		ctx.close();
	}

}
