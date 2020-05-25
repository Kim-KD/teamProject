package com.app.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("login_data")
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
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
	
	@RequestMapping(value = "/normal_or_cpn", method = RequestMethod.GET)
	public String normal_or_cpn() {
		return "sign_up/normal_or_cpn";
	}
	
	@RequestMapping(value = "/sign_up", method = RequestMethod.GET)
	public String sign_up() {
		return "sign_up/sign_up";
	}
	
	@RequestMapping(value = "/cpn_sign_up", method = RequestMethod.GET)
	public String cpn_sign_up() {
		return "sign_up/cpn_sign_up";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login/login";
	}
	
	@RequestMapping(value = "/write_page", method = RequestMethod.GET)
	public String write_page() {
		return "write_page";
	}
	
	@RequestMapping(value = "/send_sms", method = RequestMethod.GET)
	public String sms_page() {
		return "send_sms";
	}
	
}