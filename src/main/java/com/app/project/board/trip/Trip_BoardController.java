package com.app.project.board.trip;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
public class Trip_BoardController {
	
	@Autowired
	private Trip_BoardService svc;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/board/write")
	public String write(Trip_BoardBean board, Principal principal, HttpServletRequest request) {
		board.setUser_id(principal.getName());
		try {
			return "redirect:/trip/trip_read?bno=" + svc.tripWrite(board);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/trip";
	}
}