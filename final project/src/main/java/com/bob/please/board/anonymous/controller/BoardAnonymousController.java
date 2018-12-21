package com.bob.please.board.anonymous.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bob.please.board.anonymous.service.BoardAnonymousService;




@Controller
public class BoardAnonymousController {

	@Autowired
	private BoardAnonymousService service;
	
	@RequestMapping("/board_anonymous/list")
	public ModelAndView getList(HttpServletRequest request) {
		//HttpServletRequest 객체를 전달해서 필요한 모델이 담기게 한다. 
		service.getList(request);
		//view 페이지로 forward 이동해서 글 목록 출력하기 
		return new ModelAndView("board_anonymous/list");
	}
}
