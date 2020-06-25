package com.app.project.user.rest;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.app.project.user.User_bean;
import com.app.project.user.User_service;
import com.app.project.util.AuthorityPropertyEditor;
import com.sun.istack.internal.NotNull;

@Controller
@SessionAttributes("login_data")
public class User_rest_controller {
	
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
			return new ModelAndView("check_pwd");
		
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
	
	// 아이디 중복체크
	@PostMapping("/id_chk")
	@ResponseBody
	public int id_chk(@RequestParam String user_id) {
		return svc.id_chk(user_id);
	}

	// 이메일 중복체크
	@PostMapping("/email_chk")
	@ResponseBody
	public int checkEmail(@RequestParam @NotNull String user_email) {
		return svc.email_chk(user_email);
	}
	
	// 이메일 수정체크
	@GetMapping("/up_email_chk")
	@ResponseBody
	public int email_chk(String user_email, Principal pcp) {
		int result = 0;
		if(pcp ==null) {
			result = svc.email_chk(user_email);
		}
		if(result == 1) {
			User_bean user = User_bean.builder().user_id(pcp.getName()).user_email(user_email).build();
			if(svc.update_email_chk(user) == 1) {
				result = 0;
			}
		}
		return result;
	}
	
	// 아이디 찾기
	@PostMapping("/find_id")
	public ResponseEntity<Void> find_id(User_bean user) {
		svc.findById(user);
		return ResponseEntity.ok(null);
	}
	
	// 비밀번호 찾기
	@PostMapping("/find_pwd")
	public ResponseEntity<Void> find_pwd(User_bean user) {
		svc.findByPwd(user);
		return ResponseEntity.ok(null);
	}
	
	// 비밀번호 확인
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/check_pwd")
	public String checkPwd(String user_pwd, Principal pcp, HttpSession session) {
		session.setAttribute("check", "ok");
		User_bean user = User_bean.builder().user_id(pcp.getName()).user_pwd(user_pwd).build();
		System.out.println(svc.pwd_chk(user));
		if(svc.pwd_chk(user) == 1) {
			return "user/profile";
		}
		else {
			return "user/check_pwd?fail=0";
		}
	}
	
	// 유저 정보 수정
	@PostMapping("/update")
	public String update_info(User_bean user, Principal pcp) {
		user.setUser_id(pcp.getName());
		svc.userInfoUpdate(user);
		return "user/profile";
	}
	
}