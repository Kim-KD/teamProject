package com.app.project.board.gh.rest;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.project.board.gh.GH_BoardBean;
import com.app.project.board.gh.GH_BoardService;
import com.app.project.board.gh.GH_RoomBean;
import com.app.project.board.gh.GH_ViewBean;

@RestController
@SessionAttributes("login_data")
public class GH_Board_rest_Controller {
	
	@Autowired
	private GH_BoardService bsvc;
	
	// 관리자 관광 명소 관리 start
	// 게시글 공개 여부 수정
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/admin_guest_update")
	public ResponseEntity<?> admin_update(String board) {
		return ResponseEntity.ok(bsvc.admin_guest_update(board));
	}

	// 게시글 선택 삭제
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/admin_guest_delete")
	public ResponseEntity<?> admin_delete(String no) {
		return ResponseEntity.ok(bsvc.admin_guest_delete(no));
	}
	// 관리자 관광 명소 관리 end
	
	
	// 게스트하우스 게시글 + 후기 삭제
	@PostMapping("/gh_delete")
	public int gh_delete(int no) {
		int result = bsvc.gh_delete(no);
		return result;
	}
	
	// 방 정보
	@PostMapping("/room_info_data")
	public List<Map<String,Object>> room_info_data(GH_RoomBean roomBean) {
		List<Map<String,Object>> roomList = bsvc.room_info_data(roomBean);
		return roomList;
	}
	
	// 게스트하우스 후기 작성
	@PostMapping("/gh_view_insert")
	public int gh_View_Insert(GH_ViewBean viewBean) {
		int result = bsvc.gh_View_Insert(viewBean);
		return result;
	}
	
	// 게스트하우스 후기 읽기
	@PostMapping("/gh_view_list")
	public List<GH_ViewBean> gh_View_Read(int no) {
		List<GH_ViewBean> viewList = bsvc.gh_View_Read(no);
		return viewList;
	}
	
	// 게스트하우스 후기 삭제
	@PostMapping("/gh_view_delete")
	public int gh_View_delete(GH_ViewBean viewBean) {
		int result = bsvc.gh_View_delete(viewBean); 
		return result;
	}
	
	// 게스트하우스 후기 수정
	@PostMapping("/gh_view_modify")
	public int gh_view_modify(GH_ViewBean viewBean) {
		int result = bsvc.gh_view_modify(viewBean);
		return result;
	}
	
	// 게스트하우스 추천
	@PostMapping("/gh_like")
	public int gh_like(int no, String user_id,HttpServletRequest req, HttpServletResponse res) {
		String check = null;
		Cookie[] cookies = req.getCookies();
		
		GH_BoardBean boardBean = new GH_BoardBean();
		boardBean.setNo(no);
		
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals("like" + no)) {
					check = c.getValue();
				}
			}
		}
		
		if(check == null) {
			Cookie likes = new Cookie("like" + no, Integer.toString(no));
			likes.setMaxAge(1 * 60 * 60);
			res.addCookie(likes);
			boardBean.setLikes(bsvc.count_like(no) + +1);
			bsvc.likes_update(boardBean);
			return 1;
		} else {
			Cookie likes = new Cookie("like" + no, Integer.toString(no));
			likes.setMaxAge(0);
			res.addCookie(likes);
			boardBean.setLikes(bsvc.count_like(no) + -1);
			bsvc.likes_update(boardBean);
			return 0;
		}
	}
}