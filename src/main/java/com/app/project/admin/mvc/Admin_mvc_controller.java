package com.app.project.admin.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.app.project.admin.Admin_service;
import com.app.project.user.User_bean;
import com.app.project.util.AuthorityPropertyEditor;

@Controller
public class Admin_mvc_controller {
	
	@Autowired
	private Admin_service svc;
	
	@InitBinder
	public void init(WebDataBinder wdb) {
		wdb.registerCustomEditor(List.class, "authorities",new AuthorityPropertyEditor());
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/user_list")
	public ModelAndView user_list(@RequestParam(defaultValue="1") int pageno, @RequestParam(defaultValue="0") String user_status, @Nullable String user_id) {
		return new ModelAndView("admin/user_list").addObject("page",svc.userList(pageno, user_status, user_id));
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/cpn_list")
	public ModelAndView cpn_list(@RequestParam(defaultValue="1") int pageno, @RequestParam(defaultValue="1") String user_status, @Nullable String user_id) {
		return new ModelAndView("admin/user_list").addObject("page",svc.userList(pageno, user_status, user_id));
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/user_read")
	public ModelAndView user_read(String user_id) {
		User_bean user = svc.userInfoRead(user_id);
		return new ModelAndView("admin/user_read").addObject("user",user);
	}
	
}