package com.bob.please.member.service;


	import java.util.HashMap;
	import java.util.Map;
	
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpSession;
	
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.security.crypto.bcrypt.BCrypt;
	import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
	import org.springframework.stereotype.Service;
	import org.springframework.web.servlet.ModelAndView;
	
	import com.bob.please.member.dao.MemberDao;
	import com.bob.please.member.dto.MemberDto;
	
	
	@Service
	public class MemberServiceImpl implements MemberService {
		@Autowired
		private MemberDao dao;
	
		@Override
		public void addUser(ModelAndView mView, MemberDto dto) {
			String planText=dto.getPwd();
			BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
			String hash=encoder.encode(planText);
			dto.setPwd(hash);
			dao.insert(dto);
			mView.addObject("userid", dto.getUserid());
	}
		
	@Override
	public void validUser(HttpSession session, ModelAndView mView, MemberDto dto) {
		boolean isValid=false;
		String pwdHash=dao.getPwdHash(dto.getUserid());
		if(pwdHash != null) {
			isValid=BCrypt.checkpw(dto.getPwd(), pwdHash);
		}
		if(isValid) {
			session.setAttribute("userid", dto.getUserid());
			mView.addObject("isSuccess", true);
		}else {
			mView.addObject("isSuccess", false);
		}
	}
	@Override
	public Map<String, Object> canUseId(String inputId) {	
		boolean isExist=dao.isExist(inputId);
		Map<String, Object> map=new HashMap<String,Object>();
		if(isExist) {
			map.put("canUse", false);
		}else {
			map.put("canUse", true);
		}
		return map;
	}
	
	@Override
	public void showInfo(HttpSession session, ModelAndView mView) {
		String userid=(String)session.getAttribute("userid");
		MemberDto dto=dao.getData(userid);
		mView.addObject("dto", dto);
	}
	@Override
	public void updateUser(MemberDto dto) {
		dao.update(dto);
	}
	@Override
	public void deleteUser(HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		dao.delete(userid);
		session.invalidate();
	}
	@Override
	public void updatePwd(HttpServletRequest request) {
		String userid=(String)request.getSession().getAttribute("userid");
		String pwd=request.getParameter("pwd");
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		MemberDto dto=new MemberDto();
		dto.setUserid(userid);
		dto.setPwd(encoder.encode(pwd));
		dao.updatePwd(dto);
	}
		
	}

