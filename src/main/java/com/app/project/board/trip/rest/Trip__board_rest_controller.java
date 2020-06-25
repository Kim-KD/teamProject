package com.app.project.board.trip.rest;

import java.security.Principal;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.project.board.trip.Trip_board_service;
import com.app.project.board.trip.Trip_board_bean;

@RestController
public class Trip__board_rest_controller {
	
	@Autowired
	private Trip_board_service svc;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/trip_delete")
	public String delete(Integer no, String user_id, Principal pcp) {
		if(user_id.equals(pcp.getName())) {
			svc.tripDelete(no);
			return "trip/trip_list";
		}
			return null;
	}
	
	@PostMapping("/trip_like")
	public ResponseEntity<Boolean> like(Integer no, String user_id, HttpServletRequest req, HttpServletResponse res, Principal pcp) {
		if(user_id.equals(pcp.getName())==false) {
			String check = null;
			Cookie[] cookies = req.getCookies();
			Trip_board_bean board = svc.tripRead(no, user_id);
			if(cookies != null) {
				for(Cookie c : cookies) {
					if(c.getName().equals("like"+ no)) {
						check = c.getValue();
					}
				}
			}
			if(check == null) {
				Cookie hits = new Cookie("like"+no,no.toString());
				hits.setMaxAge(1*60*60);
				res.addCookie(hits);
				board.setLikes(board.getLikes()+1);
				svc.tripUpdate(board);
				return ResponseEntity.ok(true);
			}else {
				return ResponseEntity.ok(false);
			}
		}
		return null;
	}
}