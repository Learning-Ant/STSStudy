package com.koreait.contact2.command;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.koreait.contact2.dao.ContactDao;
import com.koreait.contact2.dto.ContactDto;

public class ContactInsertCommand implements ContactCommand {

	@Autowired
	private ContactDao contactDao;
	
	@Override
	public void execute(Model model) {
		ContactDto contactDto = (ContactDto)model.asMap().get("contactDto");
		
		contactDao.contactInsert(contactDto);
	}

}
