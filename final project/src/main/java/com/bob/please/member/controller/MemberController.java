package com.bob.please.member.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bob.please.member.dto.MemberDto;
import com.bob.please.member.service.MemberService;


@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	//회원 가입 폼 요청 처리
	@RequestMapping("/member/signup_form")
	public String signupForm() {
		return "member/signup_form";
	}
	
	//회원 가입 요청 처리
	@RequestMapping("/member/signup")
	public ModelAndView signup(ModelAndView mView, @ModelAttribute MemberDto dto) {
		//@ModelAttribute 라는 어노테이션을 UsersDto 앞에 붙여 놓으면
		//폼전송되는 파라미터가 추출되어서 UsersDto 객체에 담겨서 전달된다.
		//ModelAndView 객체가 필요하면 메소드에 받을 준비를 해놓으면 전달된다.
		service.addUser(mView, dto);

		mView.setViewName("member/signup");
		return mView;
	}
	//로그인 폼 요청 처리 
	@RequestMapping("/member/loginform")
	public String loginform() {
		
		return "member/loginform";
	}
	//로그인 요청 처리
	@RequestMapping("/member/login")
	public ModelAndView login(HttpSession session, ModelAndView mView, @ModelAttribute MemberDto dto) {
		//UsersService 를 통해서 로그인 관련 처리를 하고
		service.validUser(session, mView, dto);
		//view 페이지 정보를 담고  
		mView.setViewName("member/login");
		//ModelAndView 객체를 리턴해 준다.
		return mView;
	}
	//로그아웃 요청 처리
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		//로그 아웃 처리를 하고 
		session.invalidate();
		//home.do 로 리다일렉트 이동 시킨다.
		return "redirect:/home.do";
	}
	
	//아이디 중복 확인 ajax 요청 처리
	@RequestMapping("/member/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId){
		Map<String, Object> map=service.canUseId(inputId);
		//출력 되는 JSON 문자열은
		//{"canUse":true} 또는 {"canUse":false} 이다.
		return map;
	}
	//개인 정보 보기 요청 처리
	@RequestMapping("/member/info")
	public ModelAndView authInfo(ModelAndView mView, HttpServletRequest request) {
		
		service.showInfo(request.getSession(), mView);
		//view 페이지 정보를 담아서 
		mView.setViewName("member/info");
		//ModelAndView 객체를 리턴해준다. 
		return mView;
	}
	//개인정보 수정 폼 요청처리
	@RequestMapping("/member/updateform")
	public ModelAndView authUpdateForm(HttpServletRequest request, ModelAndView mView) {
		service.showInfo(request.getSession(), mView);
		mView.setViewName("member/updateform");
		return mView;
	}
	//개인정보 수정 요청처리
	@RequestMapping("/member/update")
	public ModelAndView authUpdate(@ModelAttribute MemberDto dto, HttpServletRequest request) {
		//UsersService 객체를 이용해서 수정반영
		service.updateUser(dto);
		// new ModelAndView("view 페이지 정보")
		return new ModelAndView("redirect:/member/info.do");
	}
	@RequestMapping("/member/delete")
	public ModelAndView authDelete(HttpServletRequest request) {
		service.deleteUser(request.getSession());
		return new ModelAndView("member/delete");
	}
	//비밀번호 수정폼 요청처리
	@RequestMapping("/member/pwd_updateform.do")
	public ModelAndView authPwdForm(HttpServletRequest request) {
		return new ModelAndView("member/pwd_updateform");
	}
	//비밀번호 수정반영 요청처리
	@RequestMapping("/member/update_pwd")
	public ModelAndView authUpdatePwd(HttpServletRequest request) {
		//비밀번호를 수정하는 비즈니스로직을 서비스로 수행하고
		service.updatePwd(request);
		//view 페이지로 forward 이동해서 응답
		return new ModelAndView("member/update_pwd");
	}
}

