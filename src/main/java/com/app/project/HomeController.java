package com.app.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("login_data")
public class HomeController {
	
	@GetMapping("/about_us")
	public String about_us() {
		return "about_us";
	}
	
	@GetMapping("/page3")
	public String page3() {
		return "page3";
	}
	
	@GetMapping({"/","/index"})
	public String home() {
		return "main/index";
	}
	
}