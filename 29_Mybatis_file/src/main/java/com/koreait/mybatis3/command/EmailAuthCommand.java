package com.koreait.mybatis3.command;

import java.util.Map;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.ui.Model;

public class EmailAuthCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		try {
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest)map.get("request");
			JavaMailSenderImpl mailSender = (JavaMailSenderImpl)map.get("mailSender");
			
			// MimeMessage 클래스가 이메일의 내용을 작성한다.
			MimeMessage message = mailSender.createMimeMessage();
			
			message.setHeader("Content-Type", "text/plain; charset=utf-8");
			message.setFrom(new InternetAddress("a86007681@gmail.com", "관리자"));	// 보내는 사람
			// 받는 사람
			InternetAddress to = new InternetAddress(request.getParameter("email"));	// 받는 사람
			InternetAddress[] toList = {to};	// 받는 사람을 배열에 저장해 두면 여러 곳에 한 번에 보낼 수도 있다.
			// message.addRecipient(Message.RecipientType.TO, to);		// 한명에게 보낸다.
			message.addRecipients(Message.RecipientType.TO, toList);	// 여러명에게 보낸다.
			
			message.setSubject("인증 요청 메일입니다.");	// 제목
			
			long authKey = (long)(Math.random()*10000000000L)+1234567890;		// 랜덤하게 마음대로 만든다.
			message.setText("인증코드 : " + authKey);
			
			mailSender.send(message);	// 메일을 보냅니다.
			
			// 생성한 인증키를 다음으로 넘겨서 
			model.addAttribute("authKey", authKey);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
