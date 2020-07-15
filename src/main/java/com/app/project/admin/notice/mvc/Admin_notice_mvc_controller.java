package com.app.project.admin.notice.mvc;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.project.admin.notice.Notice_bean;
import com.app.project.admin.notice.Admin_notice_service;
import com.app.project.util.AuthorityPropertyEditor;

@Controller
public class Admin_notice_mvc_controller {
	
	@Autowired
	private Admin_notice_service svc;
	
	@InitBinder
	public void init(WebDataBinder wdb) {
		wdb.registerCustomEditor(List.class, "authorities",new AuthorityPropertyEditor());
	}
	
	// 공지사항 작성
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/notice_write")
	public String notice_write() {
		return "admin/notice_write";
	}
	
	// 공지사항 등록
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/notice_write")
	public String notice_write(Notice_bean board, Principal principal) {
		board.setAdmin_id(principal.getName());
		return "redirect:/notice_read?no=" + svc.notice_insert(board);
	}
	
	// 공지사항 수정 페이지
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/notice_update")
	public ModelAndView notice_update(Integer no, String admin_id, Principal pcp) {
		if(admin_id.equals(pcp.getName())) {
			Notice_bean board = svc.notice_read(no,admin_id);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("trip/trip_update");
			mav.addObject("board",board);
			return mav;
		}
		return null;
	}
	
	// 공지사항 수정 등록
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/notice_update")
	public ModelAndView notice_update(Notice_bean board, Principal pcp) {
		if(board.getAdmin_id().equals(pcp.getName())) {
			svc.notice_update(board);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("service_center/notice_read?no="+board.getNo());
			mav.addObject("board",board);
			return mav;
		}
		return null;
	}
	
	// 공지사항 삭제
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/notice_delete")
	public String notice_delete(Integer no, String user_id, Principal pcp) {
		if(user_id.equals(pcp.getName())) {
			svc.notice_delete(no);
			return "service_center/notice_list";
		}
			return null;
	}
}