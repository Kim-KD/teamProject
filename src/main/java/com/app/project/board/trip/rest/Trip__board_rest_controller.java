package com.app.project.board.trip.rest;

import java.security.Principal;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.project.board.trip.Trip_board_bean;
import com.app.project.board.trip.Trip_board_service;
import com.app.project.board.trip.Trip_view_bean;

@RestController
public class Trip__board_rest_controller {
	
	@Autowired
	private Trip_board_service svc;
	
	// 관리자 관광 명소 관리 start
	// 게시글 공개 여부 수정
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/admin_trip_update")
	public ResponseEntity<?> admin_update(String board) {
		return ResponseEntity.ok(svc.admin_trip_update(board));
	}

	// 게시글 선택 삭제
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/admin_trip_delete")
	public ResponseEntity<?> admin_delete(String no) {
		return ResponseEntity.ok(svc.admin_trip_delete(no));
	}
	// 관리자 관광 명소 관리 end
	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/trip_delete")
	public String delete(Integer no, String user_id, Principal pcp) {
		if(user_id.equals(pcp.getName())) {
			svc.trip_delete(no);
			return "trip/trip_list";
		}
			return null;
	}
	
	@PostMapping("/trip_like")
	public ResponseEntity<Boolean> like(Integer no, String user_id, HttpServletRequest req, HttpServletResponse res, Principal pcp) {
		if(user_id.equals(pcp.getName())==false) {
			String check = null;
			Cookie[] cookies = req.getCookies();
			Trip_board_bean board = svc.trip_read(no, user_id);
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
				svc.trip_update(board);
				return ResponseEntity.ok(true);
			}else {
				return ResponseEntity.ok(false);
			}
		}
		return null;
	}
	
	// 후기 start
	// 후기 작성
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/view_write")
	public ResponseEntity<?> view_write(Trip_view_bean view, Principal pcp) {
		view.setUser_id(pcp.getName());
		return ResponseEntity.ok(svc.trip_view_insert(view));
	}

	// 후기 수정
	@PreAuthorize("isAuthenticated()")
	@PutMapping("/view_update")
	public ResponseEntity<?> view_update(Integer no,Integer vno, String user_id, String content, Principal pcp) {
		Trip_view_bean view = Trip_view_bean.builder().no(no).vno(vno).user_id(user_id).content(content).build();
		if(user_id.equals(pcp.getName())) {
			return ResponseEntity.ok(svc.trip_view_update(view));
		}
		return ResponseEntity.ok(null);
	}

	// 후기 삭제
	@PreAuthorize("isAuthenticated()")
	@DeleteMapping("/view_delete")
	public ResponseEntity<?> view_delete(Integer vno, Principal pcp) {
		Trip_view_bean view = svc.trip_view_read(vno);
		if(view.getUser_id().equals(pcp.getName())) {
			return ResponseEntity.ok(svc.trip_view_delete(view.getNo(),view.getVno()));
		}
		return null;
	}
}