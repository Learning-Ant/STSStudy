package com.koreait.contact2.command;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.koreait.contact2.dao.ContactDao;

public class ContactDeleteCommand implements ContactCommand {

	@Autowired
	private ContactDao contactDao;
	
	@Override
	public void execute(Model model) {
		contactDao.contactDelete((int)model.asMap().get("no"));
	}

}
