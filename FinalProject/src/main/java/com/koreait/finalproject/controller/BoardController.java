package com.koreait.finalproject.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.finalproject.command.BoardCommand;
import com.koreait.finalproject.command.BoardDeleteCommand;
import com.koreait.finalproject.command.BoardInsertCommand;
import com.koreait.finalproject.command.BoardListCommand;
import com.koreait.finalproject.command.BoardUpdateCommand;
import com.koreait.finalproject.command.BoardViewCommand;
import com.koreait.finalproject.dto.BoardDto;

@Controller
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	private BoardCommand boardCommand;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String list(Model model) {
		boardCommand = new BoardListCommand();
		boardCommand.execute(sqlSession, model);
		return "board/list";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		boardCommand = new BoardInsertCommand();
		boardCommand.execute(sqlSession, model);
		return "";
		
	}
	
	@RequestMapping(value="view", method=RequestMethod.GET)
	public String view(int bIdx, Model model ) {
		model.addAttribute("bIdx", bIdx);
		boardCommand = new BoardViewCommand();
		boardCommand.execute(sqlSession, model);
		return "board/view";
		
	}
	
	@RequestMapping(value="writePage", method=RequestMethod.GET)
	public String writePage() {
		return "board/writePage";
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(BoardDto boardDto, Model model, RedirectAttributes rttr) {
		model.addAttribute("boardDto", boardDto);
		model.addAttribute("rttr", rttr);
		boardCommand = new BoardInsertCommand();
		boardCommand.execute(sqlSession, model);
		return "redirect:list";
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(BoardDto boardDto, Model model, RedirectAttributes rttr) {
		model.addAttribute("boardDto", boardDto);
		model.addAttribute("rttr", rttr);
		boardCommand = new BoardUpdateCommand();
		boardCommand.execute(sqlSession,model);
		return "redirect:view?bIdx="+boardDto.getbIdx();
	}
	
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String delete(int bIdx, Model model, RedirectAttributes rttr) {
		model.addAttribute("bIdx", bIdx);
		model.addAttribute("rttr", rttr);
		boardCommand = new BoardDeleteCommand();
		boardCommand.execute(sqlSession, model);
		return "redirect:list";
	}
	
	
}
