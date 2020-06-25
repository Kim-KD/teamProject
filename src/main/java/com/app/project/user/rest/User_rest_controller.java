package com.app.project.user.rest;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.app.project.user.User_bean;
import com.app.project.user.User_service;
import com.app.project.util.AuthorityPropertyEditor;
import com.sun.istack.internal.NotNull;

@RestController
public class User_rest_controller {
	
	@Autowired
	private User_service svc;
	
	@InitBinder
	public void init(WebDataBinder wdb) {
		wdb.registerCustomEditor(List.class, "authorities",new AuthorityPropertyEditor());
	}
	
	// 아이디 중복체크
	@PostMapping("/id_chk")
	public int id_chk(@RequestParam String user_id) {
		return svc.id_chk(user_id);
	}

	// 이메일 중복체크
	@PostMapping("/email_chk")
	public int checkEmail(@RequestParam @NotNull String user_email) {
		return svc.email_chk(user_email);
	}
	
	// 이메일 수정체크
	@GetMapping("/up_email_chk")
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