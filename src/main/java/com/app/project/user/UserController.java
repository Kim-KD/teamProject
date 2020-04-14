package com.app.project.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
	
	@Autowired
	private UserService usvc;
	
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(UserBean userBean) {
		usvc.join(userBean);
		
		return "index";
	}
	
}