package com.app.project;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.app.project.user.UserBean;
import com.app.project.user.UserService;

@Controller
@SessionAttributes("login_data")
public class HomeController {
	
	@Autowired
	private UserService svc;
	
	@GetMapping("/about_us")
	public String about_us() {
		return "about_us";
	}
	
	@GetMapping("/page1")
	public String page1() {
		return "page1";
	}
	
	@GetMapping("/page2")
	public String page2() {
		return "page2";
	}
	
	@GetMapping("/page3")
	public String page3() {
		return "page3";
	}
	
	@GetMapping("/sign_up")
	public String sign_up() {
		return "sign_up/sign_up";
	}
	
	@GetMapping("/cpn_sign_up")
	public String cpn_sign_up() {
		return "sign_up/cpn_sign_up";
	}
	
	@GetMapping("/write_page")
	public String write_page() {
		return "write_page";
	}
	
	@GetMapping("/find_info")
	public String find_info() {
		return "find_info";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login/login";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/profile_read")
	public ModelAndView profile_read(Principal principal, HttpSession session) {
		if(session.getAttribute("check")==null)
			return new ModelAndView("check_pwd");
		
		UserBean user = svc.userInfoRead(principal.getName());
		return new ModelAndView("profile_read").addObject("user",user);
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/check_pwd")
	public String checkPwd() {
		return "check_pwd";
	}
	
}