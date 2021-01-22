package com.koreait.mybatis2.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.mybatis2.command.SimpleCommand;
import com.koreait.mybatis2.command.SimpleDeleteCommand;
import com.koreait.mybatis2.command.SimpleInsertCommand;
import com.koreait.mybatis2.command.SimpleListCommand;
import com.koreait.mybatis2.command.SimpleUpdateCommand;
import com.koreait.mybatis2.command.SimpleViewCommand;
import com.koreait.mybatis2.dto.SimpleDto;

@Controller
public class SimpleController {

	// filed로 SqlSession sqlSession을 만들어 둡니다.
	// root-context.xml을 참고해서 그대로 만들자면
	// SqlSessionTemplate sqlSession; 이것을 생성해야 하지만,
	// SqlSession sqlSession;으로 바꿔서 생성하고 있습니다.
	
	@Autowired
	private SqlSession sqlSession;
	// root-context에 작성한 bean을 보면 원래는 SqlSessionTemplate클래스를 사용한다.
	// 다만 SqlSession도 가능한 이유는
	// SqlSession이 SqlSessionTemplate에서 구현하는 interface이기 때문
	private SimpleCommand command;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="simpleInsertPage.do", method=RequestMethod.GET)
	public String simpleInsertPage() {
		return "simple/simpleInsertPage";
	}
	
	@RequestMapping(value="simpleListPage.do", method=RequestMethod.GET)
	public String simpleListPage(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		command = new SimpleListCommand();
		command.execute(sqlSession, model);
		return "simple/simpleListPage";
	}
	
	@RequestMapping(value="simpleInsert.do", method=RequestMethod.POST)
	public String simpleInsertPage(HttpServletRequest request, Model model, RedirectAttributes rttr) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		
		command = new SimpleInsertCommand();
		command.execute(sqlSession, model);
		
		
		// model에 저장된 insertResult는 request에 저장되어 있다.
		// return "redirect:simpleListPage.do"; 를 통해서 이동할 때는 request가 전달되지 않기 때문에
		// simpleListPage.do로 이동되는 JSP 페이지인 simpleListPage.jsp에 insertResult는 전달되지 않는다.
		// 18_redirect에서 배웠던 RedirectAttributes interface를 이용한다.
		
		// rttr에 저장된 insertResult는 이동할 JSP에 잘 전달된다.
		// rttr에 저장된 afterInsert도 이동할 JSP에 잘 전달된다.
		// rttr에 저장된 값도 JSP는 EL로 처리하면 된다. (${insertResult}, ${afterInsert})
		
		return "redirect:simpleListPage.do";
	}
	
	@RequestMapping(value="simpleViewPage.do", method=RequestMethod.GET)
	public String simpleViewPage(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		command = new SimpleViewCommand();
		command.execute(sqlSession, model);
		return "simple/simpleViewPage";
	}
	
	@RequestMapping(value="simpleUpdatePage.do", method=RequestMethod.POST)
	public String simpleUpdatePage(@ModelAttribute("simpleDto")SimpleDto simpleDto) {
		return "simple/simpleUpdatePage";
	}
	
	@RequestMapping(value="simpleUpdate.do", method=RequestMethod.POST)
	public String simpleUpdate(HttpServletRequest request, Model model, RedirectAttributes rttr) {
		model.addAttribute("request",request);
		model.addAttribute("rttr", rttr);
		
		command = new SimpleUpdateCommand();
		command.execute(sqlSession, model);
		
		return "redirect:simpleViewPage.do?no="+request.getParameter("no");
	}
	
	@RequestMapping(value="simpleDelete.do", method=RequestMethod.POST)
	public String simpleDelete(HttpServletRequest request, Model model, RedirectAttributes rttr) {
		model.addAttribute("request",request);
		model.addAttribute("rttr", rttr);
		
		command = new SimpleDeleteCommand();
		command.execute(sqlSession, model);
		
		return "redirect:simpleListPage.do";
	}
}
