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
	
	//ȸ�� ���� �� ��û ó��
	@RequestMapping("/member/signup_form")
	public String signupForm() {
		return "member/signup_form";
	}
	
	//ȸ�� ���� ��û ó��
	@RequestMapping("/member/signup")
	public ModelAndView signup(ModelAndView mView, @ModelAttribute MemberDto dto) {
		//@ModelAttribute ��� ������̼��� UsersDto �տ� �ٿ� ������
		//�����۵Ǵ� �Ķ���Ͱ� ����Ǿ UsersDto ��ü�� ��ܼ� ���޵ȴ�.
		//ModelAndView ��ü�� �ʿ��ϸ� �޼ҵ忡 ���� �غ� �س����� ���޵ȴ�.
		service.addUser(mView, dto);

		mView.setViewName("member/signup");
		return mView;
	}
	//�α��� �� ��û ó�� 
	@RequestMapping("/member/loginform")
	public String loginform() {
		
		return "member/loginform";
	}
	//�α��� ��û ó��
	@RequestMapping("/member/login")
	public ModelAndView login(HttpSession session, ModelAndView mView, @ModelAttribute MemberDto dto) {
		//UsersService �� ���ؼ� �α��� ���� ó���� �ϰ�
		service.validUser(session, mView, dto);
		//view ������ ������ ��� 
		mView.setViewName("member/login");
		//ModelAndView ��ü�� ������ �ش�. 
		return mView;
	}
	//�α׾ƿ� ��û ó��
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		//�α� �ƿ� ó���� �ϰ� 
		session.invalidate();
		//home.do �� �����Ϸ�Ʈ �̵� ��Ų��.
		return "redirect:/home.do";
	}
	
	//���̵� �ߺ� Ȯ�� ajax ��û ó��
	@RequestMapping("/member/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId){
		Map<String, Object> map=service.canUseId(inputId);
		//��� �Ǵ� JSON ���ڿ���
		//{"canUse":true} �Ǵ� {"canUse":false} �̴�.
		return map;
	}
	//���� ���� ���� ��û ó��
	@RequestMapping("/member/info")
	public ModelAndView authInfo(ModelAndView mView, HttpServletRequest request) {
		
		service.showInfo(request.getSession(), mView);
		//view ������ ������ ��Ƽ� 
		mView.setViewName("member/info");
		//ModelAndView ��ü�� �������ش�. 
		return mView;
	}
	//�������� ���� �� ��ûó��
	@RequestMapping("/member/updateform")
	public ModelAndView authUpdateForm(HttpServletRequest request, ModelAndView mView) {
		service.showInfo(request.getSession(), mView);
		mView.setViewName("member/updateform");
		return mView;
	}
	//�������� ���� ��ûó��
	@RequestMapping("/member/update")
	public ModelAndView authUpdate(@ModelAttribute MemberDto dto, HttpServletRequest request) {
		//UsersService ��ü�� �̿��ؼ� �����ݿ�
		service.updateUser(dto);
		// new ModelAndView("view ������ ����")
		return new ModelAndView("redirect:/member/info.do");
	}
	@RequestMapping("/member/delete")
	public ModelAndView authDelete(HttpServletRequest request) {
		service.deleteUser(request.getSession());
		return new ModelAndView("member/delete");
	}
	//��й�ȣ ������ ��ûó��
	@RequestMapping("/member/pwd_updateform.do")
	public ModelAndView authPwdForm(HttpServletRequest request) {
		return new ModelAndView("member/pwd_updateform");
	}
	//��й�ȣ �����ݿ� ��ûó��
	@RequestMapping("/member/update_pwd")
	public ModelAndView authUpdatePwd(HttpServletRequest request) {
		//��й�ȣ�� �����ϴ� ����Ͻ������� ���񽺷� �����ϰ�
		service.updatePwd(request);
		//view �������� forward �̵��ؼ� ����
		return new ModelAndView("member/update_pwd");
	}
}

