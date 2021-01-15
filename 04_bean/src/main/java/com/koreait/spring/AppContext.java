package com.koreait.spring;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/*
 * @Configuration
 * : app-context.xml과 같은 일을 하는 클래스에 달아주는 Annotation
 */

@Configuration
public class AppContext {

	// 메소드 하나당 Bean을 하나씩 만들어 준다.
	// Bean을 만드는 메소드들은 @Bean Annotation을 추가해준다.
	
	/*
	 * <bean id="song1" class="com.koreait.spring.Song">
	 * 		<property name="title" value="Dynamite" />
	 * 		<property name="genre" value="댄스" />
	 * </bean>
	 * 
	 * 아래 메소드는 위 <bean>태그와 같은 일을 한다.
	 * 
	 */
	
	@Bean	// 이 메소드는 Bean을 만드는 메소드
	public Song song1() {	// <bean id="song1" class="com.koreait.spring.Song">
		Song song = new Song();
		song.setTitle("Dynamite");
		song.setGenre("댄스");
		return song;
	}
	
	/*
	 * <bean id="song2" class="com.koreait.spring.Song">
	 * 		<constructor-arg value="Dynamite" />
	 * 		<constructor-arg value="댄스" />
	 * </bean>
	 * 
	 * 아래 메소드는 위 <bean>태그와 같은 일을 한다.
	 */
	@Bean(name="song2")		// @Bean(name="bean의 id")
	public Song zzzz() {	// 메소드의 이름 zzzz는 의미가 없다.
		return new Song("Dynamite", "댄스");
	}
	
	/*
	 * <bean id="singer1" class="com.koreait.spring.Singer">
	 * 		<property name="name" value="BTS" />
	 *		<property name="song" ref="song1" />
	 * </bean>
	 * 
	 * 아래 메소드는 위 <bean>태그와 같은 일을 한다.
	 */
	
	@Bean
	public Singer singer1() {
		Singer singer = new Singer();
		singer.setName("BTS");
		singer.setSong( song1() );	// public Song song1(){} 메소드를 호출하면 song1이라는 Bean이 반환된다.
		
		return singer;
	}
	
	/*
	 * <bean id="singer2" class="com.koreait.spring.Singer">
	 * 		<constructor-arg value="BTS" />
	 * 		<constructor-arg ref="song2" />
	 * </bean>
	 * 
	 * 아래 메소드는 위 <bean>태그와 같은 일을 한다.
	 */
	
	@Bean
	public Singer singer2() {
		return new Singer("BTS", zzzz());	// public Song zzzz(){} 메소드를 호출하면 song2라는 Bean이 반환된다.
	}
}
