package com.app.project.admin.inquiry.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.app.project.admin.inquiry.Admin_inquiry_service;

@RestController
public class Admin_inquiry_rest_controller {
	
	@Autowired
	private Admin_inquiry_service svc;
	
}