package com.koreait.contact1.command;

import org.springframework.ui.Model;

import com.koreait.contact1.dao.ContactDao;

public class ContactDeleteCommand implements ContactCommand {

	@Override
	public void execute(Model model) {

		int no = (int)model.asMap().get("no");
		
		ContactDao contactDao = new ContactDao();
		contactDao.contactDelete(no);
		
	}

}
