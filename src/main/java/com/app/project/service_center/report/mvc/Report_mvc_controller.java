package com.app.project.service_center.report.mvc;

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

import com.app.project.service_center.report.Report_bean;
import com.app.project.service_center.report.Report_service;
import com.app.project.util.AuthorityPropertyEditor;

@Controller
public class Report_mvc_controller {

	@Autowired
	private Report_service svc;

	@InitBinder
	public void init(WebDataBinder wdb) {
		wdb.registerCustomEditor(List.class, "authorities",new AuthorityPropertyEditor());
	}
	
	// 관리자 권한 start
	// 답변 대기 목록
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/report_wait_list")
	public ModelAndView report_wait_list(@RequestParam(defaultValue = "1") Integer pageno, @RequestParam(defaultValue="0") String report_status, @Nullable String user_id) {
		return new ModelAndView("admin/report_list").addObject("page", svc.report_list(pageno, report_status, user_id));
	}
	
	// 답변 완료 목록
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/report_success_list")
	public ModelAndView report_success_list(@RequestParam(defaultValue = "1") Integer pageno, @RequestParam(defaultValue="1") String report_status, @Nullable String user_id) {
		return new ModelAndView("admin/report_list").addObject("page", svc.report_list(pageno, report_status, user_id));
	}
	
	// 관리자 신고 글 읽기
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/admin_report_read")
	public ModelAndView admin_report_read(Integer no, Principal pcp) {
		String user_id = pcp != null ? pcp.getName() : null;
		Report_bean board = svc.report_read(no, user_id);
		ModelAndView mav = new ModelAndView("admin/report_read").addObject("board", board);
		return mav;
	}
	
	// 신고 답변
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/admin_report_update")
	public ModelAndView update(Report_bean board) {
		svc.report_update(board);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/report_read?no="+board.getNo());
		mav.addObject("board",board);
		return mav;
	}
	// 관리자 권한 end
	
	
	// 신고 내역
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/report_list")
	public ModelAndView report_list(@RequestParam(defaultValue = "1") Integer pageno,@Nullable String report_status, Principal pcp) {
		return new ModelAndView("service_center/report_list").addObject("page", svc.report_list(pageno,report_status, pcp.getName()));
	}
	
	// 신고 작성 페이지
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/report_write")
	public String report_write() {
		return "service_center/report_write";
	}

	// 신고 등록
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/report_write")
	public String report_write(Report_bean board, Principal pcp) {
		if(board.getUser_id().equals(pcp.getName())) {
			return "redirect:/report_read?no=" + svc.report_write(board);
		}
		return null;
	}
	
	// 신고 글 읽기
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/report_read")
	public ModelAndView report_read(Integer no, Principal pcp) {
		String user_id = pcp != null ? pcp.getName() : null;
		Report_bean board = svc.report_read(no, user_id);
		ModelAndView mav = new ModelAndView("service_center/report_read").addObject("board", board);
		return mav;
	}
	

	// 신고 글 수정 페이지
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/report_update")
	public ModelAndView report_update(Integer no, String user_id, Principal pcp) {
		if(user_id.equals(pcp.getName())) {
			Report_bean board = svc.report_read(no,user_id);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("service_center/report_update");
			mav.addObject("board",board);
			return mav;
		}
		return null;
	}

	// 신고 글 수정
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/report_update")
	public ModelAndView report_update(Report_bean board, Principal pcp) {
		if(board.getUser_id().equals(pcp.getName())) {
			svc.report_update(board);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("service_center/report_read?no="+board.getNo());
			mav.addObject("board",board);
			return mav;
		}
		return null;
	}
	
	// 신고 글 삭제
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/report_delete")
	public String report_delete(Integer no, String user_id, Principal pcp) {
		if(user_id.equals(pcp.getName())) {
			svc.report_delete(no);
			return "service_center/report_list";
		}
			return null;
	}
}