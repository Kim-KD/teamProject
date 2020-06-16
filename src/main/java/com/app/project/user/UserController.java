package com.app.project.user;

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

import com.app.project.util.AuthorityPropertyEditor;
import com.sun.istack.internal.NotNull;

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
	public String join(UserBean user) {
		usvc.join(user);
		
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
	@GetMapping("/id_chk")
	@ResponseBody
	public int id_chk(@RequestParam String user_id) {
		return usvc.id_chk(user_id);
	}

	// 이메일 중복체크
	@GetMapping("/email_chk")
	@ResponseBody
	public int checkEmail(@RequestParam @NotNull String user_email) {
		return usvc.email_chk(user_email);
	}
	
	// 이메일 수정체크
	@GetMapping("/up_email_chk")
	@ResponseBody
	public int email_chk(String user_email, Principal pcp) {
		int result = 0;
		if(pcp ==null) {
			result = usvc.email_chk(user_email);
		}
		if(result == 1) {
			UserBean user = UserBean.builder().user_id(pcp.getName()).user_email(user_email).build();
			if(usvc.update_email_chk(user) == 1) {
				result = 0;
			}
		}
		return result;
	}
	
	// 아이디 찾기
	@PostMapping("/find_id")
	public ResponseEntity<Void> find_id(UserBean user) {
		usvc.findById(user);
		return ResponseEntity.ok(null);
	}
	
	// 비밀번호 찾기
	@PostMapping("/find_pwd")
	public ResponseEntity<Void> find_pwd(UserBean user) {
		usvc.findByPwd(user);
		return ResponseEntity.ok(null);
	}
	
	// 비밀번호 확인
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/check_pwd")
	public String checkPwd(String user_pwd, Principal pcp, HttpSession session) {
		session.setAttribute("check", "ok");
		UserBean user = UserBean.builder().user_id(pcp.getName()).user_pwd(user_pwd).build();
		System.out.println(usvc.pwd_chk(user));
		if(usvc.pwd_chk(user) == 1) {
			return "redirect:/profile_read";
		}
		else {
			return "redirect:/check_pwd?fail=0";
		}
	}
	
	// 유저 정보 수정
	@PostMapping("/update")
	public String update_info(UserBean user, Principal pcp) {
		user.setUser_id(pcp.getName());
		usvc.userInfoUpdate(user);
		return "profile_read";
	}
	
}