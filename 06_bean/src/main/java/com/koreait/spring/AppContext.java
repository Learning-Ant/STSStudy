package com.koreait.spring;

import java.util.ArrayList;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

// @Configuration : Bean을 생성하는 app-context.xml과 같은 일을 한다.

@Configuration
public class AppContext {

	// 메소드가 @Bean Annotation을 가지면 Bean을 만든다.
	// 메소드는 만든 Bean을 반환 처리한다.
	
	/*
	 * @Bean
	 * public 클래스명 객체명(){
	 * 		return Bean;
	 * }
	 */
	@Bean
	public Person person2() {
		ArrayList<String> hobbies = new ArrayList<String>();
		hobbies.add("요리");
		hobbies.add("독서");
		hobbies.add("배드민턴");
		// 필드를 이용한 생성자
		return new Person("앨리스", hobbies);
	}
}
