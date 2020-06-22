package com.app.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("login_data")
public class HomeController {
	
	@GetMapping("test1")
	public String testst() {
		return "index/index";
	}
	@GetMapping("/about_us")
	public String about_us() {
		return "about_us";
	}
	
	@GetMapping("/guest_house_list")
	public String guest_house_list() {
		return "guest_house/guest_house_list";
	}
	
	@GetMapping("/guest_house_read")
	public String guest_house_read() {
		return "guest_house/guest_house_read";
	}
	
	@GetMapping("/guest_house_write")
	public String write_page() {
		return "guest_house/guest_house_write";
	}
	
	@GetMapping("/page3")
	public String page3() {
		return "page3";
	}
	
}