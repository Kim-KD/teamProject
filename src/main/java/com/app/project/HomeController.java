package com.app.project;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.app.project.user.UserBean;
import com.app.project.user.UserService;

@Controller
@SessionAttributes("login_data")
public class HomeController {
<<<<<<< HEAD
	
	@Autowired
	private UserService svc;

	@GetMapping({"/index","/"})
	public String index() {
		return "index";
	}
	
	@GetMapping("/about_us")
=======
	@RequestMapping(value = "/about_us", method = RequestMethod.GET)
>>>>>>> branch 'master' of https://github.com/Kim-KD/teamProject.git
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
	
	@GetMapping("/normal_or_cpn")
	public String normal_or_cpn() {
		return "sign_up/normal_or_cpn";
	}
	
	@GetMapping("/sign_up")
	public String sign_up() {
		return "sign_up/sign_up";
	}
	
	@GetMapping("/cpn_sign_up")
	public String cpn_sign_up() {
		return "sign_up/cpn_sign_up";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login/login";
	}
	
	@GetMapping("/write_page")
	public String write_page() {
		return "write_page";
	}
	
	@GetMapping("/find_info")
	public String find_info() {
		return "find_info";
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