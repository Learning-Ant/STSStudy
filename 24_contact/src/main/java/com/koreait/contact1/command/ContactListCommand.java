package com.koreait.contact1.command;

import java.util.List;

import org.springframework.ui.Model;

import com.koreait.contact1.dao.ContactDao;
import com.koreait.contact1.dto.ContactDto;

public class ContactListCommand implements ContactCommand {

	@Override
	public void execute(Model model) {

		ContactDao contactDao = new ContactDao();
		// new를 사용하지만 결국 불러오는 건 SpringJdbc class에서 static way에서 생성해준 template이므로
		// 결국 어떤 Command에서 Dao를 new로 생성하더라도 singleton pattern처럼 1개를 쓰는 것이다.
		
		List<ContactDto> list = contactDao.contactList();
		
		model.addAttribute("list", list);
	}

}
