package com.app.project.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.app.project.util.AuthorityPropertyEditor;

@Controller
@SessionAttributes("login_data")
public class UserController {
	
	@Autowired
	private UserService usvc;
	
	@InitBinder
	public void init(WebDataBinder wdb) {
		wdb.registerCustomEditor(List.class, "authorities",new AuthorityPropertyEditor());
	}
	
	// 회원가입
	@PostMapping("/join")
	public String join(UserBean userBean) {
		usvc.join(userBean);
		
		return "index";
	}
	
	// 회원가입 이메일 인증
	@GetMapping("/join_check")
	public String join_check(String user_num) {
		
		boolean result = usvc.joinCheck(user_num);
		
		if(result==true) {
			// 인증 성공시 로그인
			return "redirect:login";
		}
		else {
			// 인증 실패시 홈화면으로
			return "redirect:index?state=check_fail";
		}
	}
	
	// 아이디 중복체크
	@PostMapping("/id_chk")
	@ResponseBody
	public int id_chk(@RequestParam("user_id") String user_id) {
		int result = usvc.id_chk(user_id);
		return result;
	}
	
	// 이메일 중복체크
	@PostMapping("/email_chk")
	@ResponseBody
	public int email_chk(@RequestParam("user_email") String user_email) {
		int result = usvc.email_chk(user_email);
		return result;
	}

	// 로그인 (스프링 시큐리티가 해줌)
//	@PostMapping("/login")
//	@ResponseBody
//	public int login(UserBean userBean, HttpServletRequest request) {
//		int result = usvc.login(userBean, request);
//		return result;
//	}
	
	// 로그아웃
	@PostMapping("/logout")
	public String logout(SessionStatus session) {
		session.setComplete();
		return "redirect:index";
	}
	
}