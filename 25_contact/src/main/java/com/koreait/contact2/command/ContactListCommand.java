package com.koreait.contact2.command;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.koreait.contact2.dao.ContactDao;

public class ContactListCommand implements ContactCommand {

	@Autowired
	private ContactDao contactDao;
	
	@Override
	public void execute(Model model) {
		model.addAttribute("list", contactDao.contactList());
	}

}
