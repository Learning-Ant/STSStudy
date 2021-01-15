package com.koreait.simple3.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.simple3.command.SimpleInsertCommand;
import com.koreait.simple3.command.SimpleListCommand;
import com.koreait.simple3.command.SimpleViewCommand;
import com.koreait.simple3.config.AppContext;

@Controller
public class SimpleController {
	/*
	 * Java(AppContext.java)로 Bean을 만들 때
	 * 1. Controller는 AnnotationConfigApplicationContext ctx를 필드로 선언해 둔다.
	 * 2. 모든 command는 ctx.getBean()으로 필요하면 Bean을 가져와서 사용합니다.
	 * 3. com.springsource.net.sf.cglib-2.1.3.jar 라이브러리를 추가해 줍니다.
	 * 	1) tomcat/lib 폴더에 추가할 수 있고,
	 * 	2) 아니면 maven dependencies 에 추가해서 해당 프로젝트에서만 사용 할 수도 있다.
	 */
	
	// field
	private AbstractApplicationContext ctx = new AnnotationConfigApplicationContext(AppContext.class);
	
	@RequestMapping(value="simpleListPage.do")
	public String simpleListPage(Model model) {
		SimpleListCommand simpleListCommand = ctx.getBean("listCommand",SimpleListCommand.class);
		// SimpleListCommand simpleListCommand = (SimpleListCommand)ctx.getBean("listCommand");

		simpleListCommand.execute(model);
		return "simple/simpleListPage";
	}
	
	@RequestMapping(value="simpleInsertPage.do")
	public String simpleInsertPage() {
		return "simple/simpleInsertPage";
	}
	
	@RequestMapping(value="simpleInsert.do")
	public String simpleInsert(HttpServletRequest request , Model model) {
		model.addAttribute("request",request);
		
		SimpleInsertCommand simpleInsertCommand = ctx.getBean("insertCommand", SimpleInsertCommand.class);
		
		simpleInsertCommand.execute(model);
		
		return "redirect:simpleListPage.do";
	}
	
	
	@RequestMapping(value="simpleViewPage.do")
	public String simpleViewPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
		SimpleViewCommand simpleViewCommand = ctx.getBean("viewCommand", SimpleViewCommand.class);
		
		simpleViewCommand.execute(model);
		
		return "simple/simpleViewPage";
	}
	
	
	
	
}
