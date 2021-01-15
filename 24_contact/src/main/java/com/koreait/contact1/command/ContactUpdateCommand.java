package com.koreait.contact1.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.koreait.contact1.dao.ContactDao;
import com.koreait.contact1.dto.ContactDto;

public class ContactUpdateCommand implements ContactCommand {

	@Override
	public void execute(Model model) {
		// controller에서 바로 Dto로 받아올 경우
		// ContactDto contactDto = (ContactDto)model.asMap().get("contactDto");
		
		// script사용을 위해 request를 받아올 경우
		HttpServletRequest request = (HttpServletRequest)model.asMap().get("request");
		HttpServletResponse response = (HttpServletResponse)model.asMap().get("response");

		ContactDto contactDto = new ContactDto();
		contactDto.setNo(Integer.parseInt(request.getParameter("no")));
		contactDto.setName(request.getParameter("name"));
		contactDto.setPhone(request.getParameter("phone"));
		contactDto.setAddress(request.getParameter("address"));
		contactDto.setEmail(request.getParameter("email"));
		contactDto.setNote(request.getParameter("note"));
		
		ContactDao contactDao = new ContactDao();
		contactDao.contactUpdate(contactDto);
		
		// 변경 후 alert창이 나오도록 하는 방법
		// 생각해보기
		try {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('변경되었습니다.');");
			out.println("</script>");
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

}
