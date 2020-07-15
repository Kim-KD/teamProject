package com.app.project.service_center.notice.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.app.project.admin.notice.Notice_bean;
import com.app.project.service_center.notice.Notice_service;

@Controller
public class Notice_mvc_controller {

	@Autowired
	private Notice_service svc;
	

	// 공지사항 리스트
	@GetMapping("/notice_list")
	public ModelAndView inquiry_list(@RequestParam(defaultValue = "1") Integer pageno, @Nullable String title) {
		return new ModelAndView("service_center/notice_list").addObject("page", svc.notice_list(pageno, title));
	}
	
	// 공지사항 읽기
	@GetMapping("/notice_read")
	public ModelAndView inquiry_read(Integer no) {
		Notice_bean board = svc.notice_read(no);
		ModelAndView mav = new ModelAndView("service_center/notice_read").addObject("board", board);
		return mav;
	}
}