package com.koreait.contact1.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreait.contact1.command.ContactCommand;
import com.koreait.contact1.command.ContactDeleteCommand;
import com.koreait.contact1.command.ContactInsertCommand;
import com.koreait.contact1.command.ContactListCommand;
import com.koreait.contact1.command.ContactUpdateCommand;
import com.koreait.contact1.command.ContactViewCommand;
import com.koreait.contact1.common.SpringJdbc;
import com.koreait.contact1.dto.ContactDto;

@Controller
public class ContactController {

	
	// field (Controller에서 사용할 template)
	// Controller는 최대한 기능이 없는 편이 좋다.
	// private JdbcTemplate template;
	
	@Autowired								// 매개변수르 받는 JdbcTemplate template의 new를 Bean이 처리해줌
	public void setTemplate(JdbcTemplate template) {	// @Autowired로 injection된 매개변수
		// this.template = template;		// Controller에서 사용할 수 있도록 넘겨 주고,
		SpringJdbc.template = template;	// 다른 곳에서도 사용할 수 있도록 넘겨준다.
	}
	
	private ContactCommand command;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="contactListPage.do", method=RequestMethod.GET)
	public String list(Model model) {
		command = new ContactListCommand();
		command.execute(model);
		return "contact/contactListPage";
	}
	
	@RequestMapping(value="contactInsertPage.do")
	public String insertPage() {
		return "contact/contactInsertPage";
	}
	
	@RequestMapping(value="contactInsert.do", method=RequestMethod.POST)
	public String insert(HttpServletRequest request, Model model) {
		// request : contactInsertPage.jsp에서 전달된 5개 파라미터
		// model : ContactInsertCommand에 전달하는 파라미터
		model.addAttribute("request", request);
		command = new ContactInsertCommand();
		command.execute(model);
		return "redirect:contactListPage.do";
	}
	
	@RequestMapping(value="contactViewPage.do", method=RequestMethod.GET)
	public String viewPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
		command = new ContactViewCommand();
		command.execute(model);
		
		return "contact/contactViewPage";
	}
	
	// 일단 이것도 되는건 확인했음
	/*
	@RequestMapping(value="contactUpdate.do", method=RequestMethod.POST)
	public String update(ContactDto contactDto, Model model) {
		model.addAttribute("contactDto", contactDto);
		
		command = new ContactUpdateCommand();
		command.execute(model);
		return "redirect:contactViewPage.do?no="+contactDto.getNo();
	}
	*/
	@RequestMapping(value="contactUpdate.do", method=RequestMethod.POST)
	public String update(HttpServletRequest request, Model model, HttpServletResponse response) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		
		command = new ContactUpdateCommand();
		command.execute(model);
		return "redirect:contactViewPage.do?no="+request.getParameter("no");
	}
	@RequestMapping(value="contactDelete.do", method=RequestMethod.POST)
	public String delete(@RequestParam("no")int no, Model model) {
		model.addAttribute("no",no);
		
		command = new ContactDeleteCommand();
		command.execute(model);
		return "redirect:contactListPage.do";
	}
}
