package com.app.project.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes("login_data")
public class UserController {
	
	@Autowired
	private UserService usvc;
	
	// 회원가입
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(UserBean userBean) {
		usvc.join(userBean);
		
		return "index";
	}
	
	// 아이디 중복체크
	@RequestMapping(value="/id_chk", method = RequestMethod.POST)
	@ResponseBody
	public int id_chk(@RequestParam("user_id") String user_id) {
		int result = usvc.id_chk(user_id);
		return result;
	}
	
	// 이메일 중복체크
	@RequestMapping(value="/email_chk", method = RequestMethod.POST)
	@ResponseBody
	public int email_chk(@RequestParam("user_email") String user_email) {
		int result = usvc.email_chk(user_email);
		return result;
	}

	// 로그인
	@RequestMapping(value="/login1", method = RequestMethod.POST)
	@ResponseBody
	public int login(UserBean userBean, HttpServletRequest request) {
		int result = usvc.login(userBean, request);
		return result;
	}
	
	// 로그아웃
	@RequestMapping(value="/logout")
	public String logout(SessionStatus session) {
		session.setComplete();
		return "redirect:index";
	}
	
}