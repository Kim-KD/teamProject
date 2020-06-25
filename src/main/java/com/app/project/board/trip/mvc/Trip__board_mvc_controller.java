package com.app.project.board.trip.mvc;

import java.security.Principal;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.app.project.board.trip.Trip_board_service;
import com.app.project.board.trip.Trip_board_bean;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class Trip__board_mvc_controller {
	
	@Autowired
	private Trip_board_service svc;
	@Autowired
	private ObjectMapper objectMapper;
	
	@GetMapping("/trip_list")
	public ModelAndView trip(@RequestParam(defaultValue="1") int pageno, @Nullable String user_id) {
		return new ModelAndView("trip/trip_list").addObject("page",svc.tripList(pageno, user_id));
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/trip_write")
	public String trip_write() {
		return "trip/trip_write";
	}
	
	@GetMapping("/trip_read")
	public ModelAndView trip_read(Integer no, HttpServletRequest req, HttpServletResponse res, Principal pcp) throws JsonProcessingException {
		String check = null;
		Cookie[] cookies = req.getCookies();
		String username = pcp!=null? pcp.getName():null;
		Trip_board_bean board = svc.tripRead(no, username);
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("post"+ no)) {
					check = c.getValue();
				}
			}
		}
		if(check == null) {
			Cookie hits = new Cookie("post"+no,no.toString());
			hits.setMaxAge(1*60*60);
			res.addCookie(hits);
			board.setViews(board.getViews()+1);
			svc.tripUpdate(board);
		}
		ModelAndView mav = new ModelAndView("trip/trip_read").addObject("board", board);
		String json = objectMapper.writeValueAsString(board);
		mav.addObject("board",json);
		return mav;
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/trip_update")
	public ModelAndView update1(Integer no, String user_id, Principal pcp) {
		if(user_id.equals(pcp.getName())) {
			Trip_board_bean board = svc.tripRead(no,user_id);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("trip/trip_update");
			mav.addObject("board",board);
			return mav;
		}
		return null;
	}
}