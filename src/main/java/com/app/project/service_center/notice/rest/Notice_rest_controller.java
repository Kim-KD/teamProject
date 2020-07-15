package com.app.project.service_center.notice.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.app.project.service_center.inquiry.Inquiry_service;

@RestController
public class Notice_rest_controller {

	@Autowired
	private Inquiry_service svc;

}