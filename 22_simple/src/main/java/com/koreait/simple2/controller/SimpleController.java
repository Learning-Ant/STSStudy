package com.koreait.simple2.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreait.simple2.command.SimpleDeleteCommand;
import com.koreait.simple2.command.SimpleInsertCommand;
import com.koreait.simple2.command.SimpleListCommand;
import com.koreait.simple2.command.SimpleUpdateCommand;
import com.koreait.simple2.command.SimpleViewCommand;
import com.koreait.simple2.dto.SimpleDto;

@Controller
public class SimpleController {
	
	// root-context.xml에 정의된 Bean 중에서
	// command 들을 필요로 하는 곳이다.
	
	/*
	 * 1. 하나하나 생성하기
	 * @Autowired
	 * private SimpleListCommand simpleListCommand;
	 * @Autowired
	 * private SimpleViewCommand simpleViewCommand;
	 * ...
	 */
	
	/*
	 * @Autowired의 적용 대상은 필드, 메소드 모두 가능하다.
	 * 2. 메소드의 매개변수에 배치해서 한 번에 생성하기
	 * @Autowired
	 * public void setCommand(SimpleListCommand simpleListCommand,
	 * 						  SimpleViewCommand simpleViewCommand,
	 * 						  SimpleInsertCommand simpleInsertCommand,
	 * 						  SimpleUpdateCommand simpleUpdateCommand,
	 * 						  SimpleDeleteCommand simpleDeleteCommand) {
	 * 		this.simpleListCommand = simpleListCommand;
	 * 		this.simpleViewCommand = simpleViewCommand;
	 * 		this.simpleInsertCommand = simpleInsertCommand;
	 * 		this.simpleUpdateCommand = simpleUpdateCommand;
	 * 		this.simpleDeleteCommand = simpleDeleteCommand;
	 * }
	 * 매개변수로 받은 애들이 @Autowired의 영향을 받아서 Bean이 생성된다.
	 * 그래서 생성된 객체들을 필드값으로 넘겨주는 방식이다.
	 */
	
	// field
	@Autowired
	private SimpleListCommand simpleListCommand;
	private SimpleViewCommand simpleViewCommand;
	private SimpleInsertCommand simpleInsertCommand;
	private SimpleUpdateCommand simpleUpdateCommand;
	private SimpleDeleteCommand simpleDeleteCommand;
	
	// Bean을 자동으로 생성해 주는 메소드
	@Autowired
	public void setCommand(SimpleListCommand simpleListCommand,
									  SimpleViewCommand simpleViewCommand,
									  SimpleInsertCommand simpleInsertCommand,
									  SimpleUpdateCommand simpleUpdateCommand,
									  SimpleDeleteCommand simpleDeleteCommand) {
					this.simpleListCommand = simpleListCommand;
					this.simpleViewCommand = simpleViewCommand;
					this.simpleInsertCommand = simpleInsertCommand;
					this.simpleUpdateCommand = simpleUpdateCommand;
					this.simpleDeleteCommand = simpleDeleteCommand;
	}
	
	@RequestMapping(value= {"/", "index"})
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="simpleListPage.do")
	public String simpleListPage(Model model) {
		simpleListCommand.execute(model);
		return "simple/simpleListPage";
	}
	
	@RequestMapping(value="simpleInsertPage.do")
	public String simpleInsertPage() {
		return "simple/simpleInsertPage";
	}
	
	@RequestMapping(value="simpleInsert.do")
	public String simpleInsert(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		simpleInsertCommand.execute(model);
		return "redirect:simpleListPage.do";
	}
	
	@RequestMapping(value="simpleViewPage.do")
	public String simpleViewPage(@RequestParam("no")int no, Model model) {
		model.addAttribute("no", no);
		simpleViewCommand.execute(model);
		return "simple/simpleViewPage";
	}
	
	@RequestMapping(value="simpleUpdatePage.do", method=RequestMethod.GET)
	public String simpleUpdatePage(SimpleDto simpleDto) {
		return "simple/simpleUpdatePage";
	}
	
	@RequestMapping(value="simpleUpdate.do", method=RequestMethod.GET)
	public String simpleUpdate(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
		simpleUpdateCommand.execute(model);
		
		return "redirect:simpleViewPage.do?no="+request.getParameter("no");
	}
	
	@RequestMapping(value="simpleDelete.do")
	public String simpleDelete(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		simpleDeleteCommand.execute(model);
		return "redirect:simpleListPage";
	}
	
}
