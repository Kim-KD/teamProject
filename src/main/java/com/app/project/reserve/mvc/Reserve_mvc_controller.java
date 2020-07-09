package com.app.project.reserve.mvc;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.app.project.reserve.Reserve_bean;
import com.app.project.reserve.Reserve_service;
import com.app.project.user.User_bean;
import com.app.project.user.User_service;

@Controller
public class Reserve_mvc_controller {

	@Autowired
	private Reserve_service rsvc;
	@Autowired
	private User_service usvc;

	// 게스트 하우스 예약 내역
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/reserve_list")
	public ModelAndView reserve_list(@RequestParam(defaultValue = "1") int pageno, Principal pcp) {
		return new ModelAndView("reserve/reserve_list").addObject("page", rsvc.reserve_list(pageno, pcp.getName()));
	}
	
	// 게스트 하우스 예약
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/reserve_insert")
	public String write(Reserve_bean board, Principal principal) {
		board.setUser_id(principal.getName());
		return "redirect:/reserve_read?no=" + rsvc.reserve_insert(board);
	}
	
	// 게스트 하우스 예약 상세 정보
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/reserve_read")
	public ModelAndView trip_read(Integer rno, HttpServletRequest req, HttpServletResponse res, Principal pcp) {
		String username = pcp != null ? pcp.getName() : null;
		Reserve_bean board = rsvc.reserve_read(rno, username);
		User_bean user = usvc.userInfoRead(username);
		ModelAndView mav = new ModelAndView("reserve/reserve_read").addObject("board", board).addObject("user", user);
		return mav;
	}

	// 예약 취소
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/reserve_cancel")
	public String update(Integer rno, String user_id, Principal pcp) {
		if(user_id.equals(pcp.getName())) {
			Reserve_bean board = rsvc.reserve_read(rno, user_id);
			board.setReserve_status("0");
			rsvc.reserve_update(board);
			return "redirect:/reserve_list";
		}
		return null;
	}
}