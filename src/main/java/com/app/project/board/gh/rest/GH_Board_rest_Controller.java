package com.app.project.board.gh.rest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.project.board.gh.GH_BoardService;
import com.app.project.board.gh.GH_RoomBean;
import com.app.project.board.gh.GH_ViewBean;

@RestController
@SessionAttributes("login_data")
public class GH_Board_rest_Controller {
	
	@Autowired
	private GH_BoardService bsvc;
	
	// 방 정보
	@PostMapping("/room_info_data")
	@ResponseBody
	public List<Map<String,Object>> room_info_data(GH_RoomBean roomBean) {
		List<Map<String,Object>> roomList = bsvc.room_info_data(roomBean);
		return roomList;
	}
	
	// 게스트하우스 후기 작성
	@PostMapping("/gh_view_insert")
	@ResponseBody
	public int gh_View_Insert(GH_ViewBean viewBean) {
		int result = bsvc.gh_View_Insert(viewBean);
		return result;
	}
	
	// 게스트하우스 후기 읽기
	@PostMapping("/gh_view_list")
	@ResponseBody
	public List<GH_ViewBean> gh_View_Read(int no) {
		List<GH_ViewBean> viewList = bsvc.gh_View_Read(no);
		return viewList;
	}
	
	// 게스트하우스 후기 삭제
	@PostMapping("/gh_view_delete")
	@ResponseBody
	public int gh_View_delete(GH_ViewBean viewBean) {
		int result = bsvc.gh_View_delete(viewBean); 
		return result;
	}
	
	// 게스트하우스 후기 수정
	@PostMapping("/gh_view_modify")
	@ResponseBody
	public int gh_view_modify(GH_ViewBean viewBean) {
		int result = bsvc.gh_view_modify(viewBean);
		return result;
	}
}