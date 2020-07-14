package com.app.project.admin.mvc;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.project.admin.Admin_service;
import com.app.project.service_center.inquiry.Inquiry_bean;
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
	
	// 회원 관리 start
	// 일반 회원 목록
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/user_list")
	public ModelAndView user_list(@RequestParam(defaultValue="1") int pageno, @RequestParam(defaultValue="0") String user_status, @Nullable String user_id) {
		return new ModelAndView("admin/user_list").addObject("page",svc.userList(pageno, user_status, user_id));
	}

	// 기업 회원 목록
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
	// 회원 관리 end
	
	
	// 문의 관리 start
	// 답변 대기 목록
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/wait_list")
	public ModelAndView inquiry_wait_list(@RequestParam(defaultValue = "1") int pageno, @RequestParam(defaultValue="0") String inquiry_status, @Nullable String user_id) {
		return new ModelAndView("admin/inquiry_list").addObject("page", svc.inquiry_list(pageno, inquiry_status, user_id));
	}
	
	// 답변 완료 목록
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/success_list")
	public ModelAndView inquiry_success_list(@RequestParam(defaultValue = "1") int pageno, @RequestParam(defaultValue="1") String inquiry_status, @Nullable String user_id) {
		return new ModelAndView("admin/inquiry_list").addObject("page", svc.inquiry_list(pageno, inquiry_status, user_id));
	}
	
	// 문의 읽기
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/admin_inquiry_read")
	public ModelAndView inquiry_read(Integer no, HttpServletRequest req, HttpServletResponse res, Principal pcp) {
		String user_id = pcp != null ? pcp.getName() : null;
		Inquiry_bean board = svc.inquiry_read(no, user_id);
		ModelAndView mav = new ModelAndView("admin/inquiry_read").addObject("board", board);
		return mav;
	}
	
	// 문의 수정
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/admin_inquiry_update")
	public ModelAndView update(Inquiry_bean board) {
		svc.inquiry_update(board);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/inquiry_read?no="+board.getNo());
		mav.addObject("board",board);
		return mav;
	}
	// 문의 관리 end	
}