package com.app.project.service_center.inquiry.mvc;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.app.project.service_center.inquiry.Inquiry_bean;
import com.app.project.service_center.inquiry.Inquiry_service;

@Controller
public class Inquiry_mvc_controller {

	@Autowired
	private Inquiry_service svc;

	// 문의 내역
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/inquiry_list")
	public ModelAndView inquiry_list(@RequestParam(defaultValue = "1") int pageno, Principal pcp) {
		return new ModelAndView("service_center/inquiry_list").addObject("page", svc.inquiry_list(pageno, pcp.getName()));
	}
	
	// 문의 작성 페이지
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/inquiry_write")
	public String inquiry_write() {
		return "service_center/inquiry_write";
	}

	// 문의 등록
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/inquiry_write")
	public String inquiry_write(Inquiry_bean board, Principal pcp) {
		if(board.getUser_id().equals(pcp.getName())) {
			return "redirect:/inquiry_read?no=" + svc.inquiry_write(board);
		}
		return null;
	}
	
	// 문의 읽기
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/inquiry_read")
	public ModelAndView inquiry_read(Integer no, Principal pcp) {
		String user_id = pcp != null ? pcp.getName() : null;
		Inquiry_bean board = svc.inquiry_read(no, user_id);
		ModelAndView mav = new ModelAndView("service_center/inquiry_read").addObject("board", board);
		return mav;
	}
	

	// 문의 수정 페이지
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/inquiry_update")
	public ModelAndView update(Integer no, String user_id, Principal pcp) {
		if(user_id.equals(pcp.getName())) {
			Inquiry_bean board = svc.inquiry_read(no,user_id);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("service_center/inquiry_update");
			mav.addObject("board",board);
			return mav;
		}
		return null;
	}

	// 문의 수정
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/inquiry_update")
	public ModelAndView update(Inquiry_bean board, Principal pcp) {
		if(board.getUser_id().equals(pcp.getName())) {
			svc.inquiry_update(board);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("service_center/inquiry_read?no="+board.getNo());
			mav.addObject("board",board);
			return mav;
		}
		return null;
	}
	
	// 문의 삭제
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/inquiry_delete")
	public String delete(Integer no, String user_id, Principal pcp) {
		if(user_id.equals(pcp.getName())) {
			svc.inquiry_delete(no);
			return "service_center/inquiry_list";
		}
			return null;
	}
}