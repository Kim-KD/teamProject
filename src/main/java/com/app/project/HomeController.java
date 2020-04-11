package com.app.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	@RequestMapping(value = "/about_us", method = RequestMethod.GET)
	public String about_us() {
		return "about_us";
	}
	
	@RequestMapping(value = "/page1", method = RequestMethod.GET)
	public String page1() {
		return "page1";
	}
	
	@RequestMapping(value = "/page2", method = RequestMethod.GET)
	public String page2() {
		return "page2";
	}
	
	@RequestMapping(value = "/page3", method = RequestMethod.GET)
	public String page3() {
		return "page3";
	}
	
}