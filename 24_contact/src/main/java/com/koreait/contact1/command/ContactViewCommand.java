package com.koreait.contact1.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.koreait.contact1.dao.ContactDao;
import com.koreait.contact1.dto.ContactDto;

public class ContactViewCommand implements ContactCommand {

	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest)model.asMap().get("request");
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		ContactDao contactDao = new ContactDao();
		ContactDto contactDto = contactDao.contactView(no);
		
		model.addAttribute("contactDto", contactDto);
	}

}
