package com.app.project.user.mvc;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.project.user.User_bean;
import com.app.project.user.User_service;
import com.app.project.util.AuthorityPropertyEditor;

@Controller
public class User_mvc_controller {
	
	@Autowired
	private User_service svc;
	
	@InitBinder
	public void init(WebDataBinder wdb) {
		wdb.registerCustomEditor(List.class, "authorities",new AuthorityPropertyEditor());
	}
	
	@GetMapping("/sign_up")
	public String sign_up() {
		return "user/sign_up";
	}
	
	@GetMapping("/cpn_sign_up")
	public String cpn_sign_up() {
		return "user/cpn_sign_up";
	}
	
	@GetMapping("/find_info")
	public String find_info() {
		return "user/find_info";
	}
	
	@GetMapping("/login")
	public String login() {
		return "user/login";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/profile")
	public ModelAndView profile_read(Principal principal, HttpSession session) {
		if(session.getAttribute("check")==null)
			return new ModelAndView("user/check_pwd");
		
		User_bean user = svc.userInfoRead(principal.getName());
		return new ModelAndView("user/profile").addObject("user",user);
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/check_pwd")
	public String checkPwd() {
		return "user/check_pwd";
	}
	
	// 회원가입
	@PostMapping("/join")
	public String join(User_bean user) {
		svc.join(user);
		
		return "/";
	}
	
	// 회원가입 이메일 인증
	@GetMapping("/join_check")
	public String join_check(String user_num) {
		
		boolean result = svc.joinCheck(user_num);
		
		if(result==true) {
			// 인증 성공시 로그인
			return "user/login";
		}
		else {
			// 인증 실패시 홈화면으로
			return "index/index?state=check_fail";
		}
	}
}