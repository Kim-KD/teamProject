package com.app.project.service_center.inquiry.mvc;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.app.project.service_center.inquiry.Inquiry_bean;
import com.app.project.service_center.inquiry.Inquiry_service;
import com.app.project.util.AuthorityPropertyEditor;

@Controller
public class Inquiry_mvc_controller {

	@Autowired
	private Inquiry_service svc;

	@InitBinder
	public void init(WebDataBinder wdb) {
		wdb.registerCustomEditor(List.class, "authorities",new AuthorityPropertyEditor());
	}
	
	// 관리자 권한 start
	// 답변 대기 목록
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/wait_list")
	public ModelAndView inquiry_wait_list(@RequestParam(defaultValue = "1") Integer pageno, @RequestParam(defaultValue="0") String inquiry_status, @Nullable String user_id) {
		return new ModelAndView("admin/inquiry_list").addObject("page", svc.inquiry_list(pageno, inquiry_status, user_id));
	}
	
	// 답변 완료 목록
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/success_list")
	public ModelAndView inquiry_success_list(@RequestParam(defaultValue = "1") Integer pageno, @RequestParam(defaultValue="1") String inquiry_status, @Nullable String user_id) {
		return new ModelAndView("admin/inquiry_list").addObject("page", svc.inquiry_list(pageno, inquiry_status, user_id));
	}
	
	// 관리자 문의 읽기
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/admin_inquiry_read")
	public ModelAndView admin_inquiry_read(Integer no, Principal pcp) {
		String user_id = pcp != null ? pcp.getName() : null;
		Inquiry_bean board = svc.inquiry_read(no, user_id);
		ModelAndView mav = new ModelAndView("admin/inquiry_read").addObject("board", board);
		return mav;
	}
	
	// 문의 답변
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/admin_inquiry_update")
	public ModelAndView update(Inquiry_bean board) {
		svc.inquiry_update(board);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/inquiry_read?no="+board.getNo());
		mav.addObject("board",board);
		return mav;
	}
	// 관리자 권한 end
	
	
	// 문의 내역
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/inquiry_list")
	public ModelAndView inquiry_list(@RequestParam(defaultValue = "1") Integer pageno,@Nullable String inquiry_status , Principal pcp) {
		return new ModelAndView("service_center/inquiry_list").addObject("page", svc.inquiry_list(pageno,inquiry_status, pcp.getName()));
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