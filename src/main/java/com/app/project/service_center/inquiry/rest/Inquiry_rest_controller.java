package com.app.project.service_center.inquiry.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.app.project.service_center.notice.Notice_service;

@RestController
public class Inquiry_rest_controller {

	@Autowired
	private Notice_service svc;

}