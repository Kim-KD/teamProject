package com.app.project.admin.notice.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.app.project.admin.notice.Admin_notice_service;

@RestController
public class Admin_notice_rest_controller {
	
	@Autowired
	private Admin_notice_service svc;
	
}