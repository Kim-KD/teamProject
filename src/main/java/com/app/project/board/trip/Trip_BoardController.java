package com.app.project.board.trip;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jdk.internal.org.objectweb.asm.tree.IntInsnNode;

@Controller
public class Trip_BoardController {
	
	@Autowired
	private Trip_BoardService svc;
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
	public ModelAndView trip_read(Integer no,Principal pcp) throws JsonProcessingException {
		String username = pcp!=null? pcp.getName():null;
		ModelAndView mav = new ModelAndView("trip/trip_read").addObject("board",svc.tripRead(no,username));
		Trip_BoardBean board = svc.tripRead(no, username);
		String json = objectMapper.writeValueAsString(board);
		mav.addObject("board",json);
		return mav;
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/trip_write")
	public String write(Trip_BoardBean board, Principal principal, HttpServletRequest request) {
		board.setUser_id(principal.getName());
		try {
			return "trip/trip_read?no=" + svc.tripWrite(board);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "trip/trip_list";
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/trip_delete")
	@ResponseBody
	public String delete(Integer no, String user_id, Principal pcp) {
		if(user_id.equals(pcp.getName())) {
			System.out.println("게시글 아이디 ======="+user_id);
			System.out.println("접속 아이디 ======="+pcp.getName());
			svc.tripDelete(no);
			return "trip/trip_list";
		}
			return null;
	}
}