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
	
	@GetMapping("test1")
	public String testst() {
		return "index/index";
	}
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
	
	@GetMapping("/write_page")
	public String write_page() {
		return "write_page";
	}
}