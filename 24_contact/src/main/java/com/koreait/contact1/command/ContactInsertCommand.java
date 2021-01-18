package com.koreait.contact1.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.koreait.contact1.dao.ContactDao;
import com.koreait.contact1.dto.ContactDto;

public class ContactInsertCommand implements ContactCommand {

	@Override
	public void execute(Model model) {

		HttpServletRequest request = (HttpServletRequest)model.asMap().get("request");
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String note = request.getParameter("note");
		
		ContactDto contactDto = new ContactDto();
		contactDto.setName(name);
		contactDto.setPhone(phone);
		contactDto.setAddress(address);
		contactDto.setEmail(email);
		contactDto.setNote(note);
		
		ContactDao contactDao = new ContactDao();
		// contactDao.contactInsert1(contactDto);
		// contactDao.contactInsert2(contactDto);
		// contactDao.contactInsert3(name, phone, address, email, note);
		// contactDao.contactInsert4(contactDto);
		contactDao.contactInsert5(contactDto);
	}

}
