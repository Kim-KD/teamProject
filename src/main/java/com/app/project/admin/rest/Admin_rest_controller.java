package com.app.project.admin.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.project.admin.Admin_service;
import com.app.project.user.User_bean;

@RestController
public class Admin_rest_controller {
	
	@Autowired
	private Admin_service svc;
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/enabled_update")
	public void enabled_update(String user_id, boolean enabled) {
		User_bean user = User_bean.builder().user_id(user_id).enabled(enabled).build();
		svc.enabledUpdate(user);
	}
}