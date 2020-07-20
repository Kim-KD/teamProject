package com.app.project.service_center.report.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.app.project.service_center.notice.Notice_service;
import com.app.project.service_center.report.Report_service;

@RestController
public class Report_rest_controller {

	@Autowired
	private Report_service svc;

}