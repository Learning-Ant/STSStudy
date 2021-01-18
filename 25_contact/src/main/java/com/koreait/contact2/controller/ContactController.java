package com.koreait.contact2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.contact2.command.ContactDeleteCommand;
import com.koreait.contact2.command.ContactInsertCommand;
import com.koreait.contact2.command.ContactListCommand;
import com.koreait.contact2.command.ContactUpdateCommand;
import com.koreait.contact2.command.ContactViewCommand;
import com.koreait.contact2.common.SpringJdbc;
import com.koreait.contact2.dto.ContactDto;

@Controller
public class ContactController {

	@Autowired
	public void setTemplate(JdbcTemplate template) {
		SpringJdbc.template = template;
	}
	
	private ContactListCommand contactListCommand;
	private ContactViewCommand contactViewCommand;
	private ContactInsertCommand contactInsertCommand;
	private ContactUpdateCommand contactUpdateCommand;
	private ContactDeleteCommand contactDeleteCommand;
	
	@Autowired
	public void setCommand(ContactListCommand contactListCommand,
			ContactViewCommand contactViewCommand,
			ContactInsertCommand contactInsertCommand,
			ContactUpdateCommand contactUpdateCommand,
			ContactDeleteCommand contactDeleteCommand) {
		this.contactListCommand=contactListCommand;
		this.contactViewCommand=contactViewCommand;
		this.contactInsertCommand=contactInsertCommand;
		this.contactUpdateCommand=contactUpdateCommand;
		this.contactDeleteCommand=contactDeleteCommand;
	}
	
	
	@RequestMapping(value= {"/","index.do"}, method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="contactListPage.do", method=RequestMethod.GET)
	public String listPage(Model model) {
		contactListCommand.execute(model);
		return "contact/contactListPage";
	}
	
	@RequestMapping(value="contactInsertPage.do", method=RequestMethod.GET)
	public String insertPage() {
		return "contact/contactInsertPage";
	}
	
	@RequestMapping(value="contactInsert.do", method=RequestMethod.POST)
	public String insert(ContactDto contactDto ,Model model) {
		model.addAttribute("contactDto", contactDto);
		contactInsertCommand.execute(model);
		return "redirect:contactListPage.do";
	}
	
	@RequestMapping(value="conatcViewPage.do", method=RequestMethod.GET)
	public String viewPage(int no, Model model) {
		model.addAttribute("no",no);
		contactViewCommand.execute(model);
		return "contact/contactViewPage";
	}
	
	@RequestMapping(value="conactUpdate.do", method=RequestMethod.POST)
	public String update(ContactDto contactDto, Model model) {
		model.addAttribute("contactDto", contactDto);
		contactUpdateCommand.execute(model);
		return "redirect:";
	}
	
	@RequestMapping(value="contactDelete.do", method=RequestMethod.POST)
	public String delete(int no, Model model) {
		model.addAttribute("no",no);
		contactDeleteCommand.execute(model);
		return "redirect:contactListPage.do";
	}
	
	
}
