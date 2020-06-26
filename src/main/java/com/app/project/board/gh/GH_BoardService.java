package com.app.project.board.gh;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class GH_BoardService {
	
	@Autowired
	private GH_BoardDao bdao;
	private ModelAndView mav;

	// 게시글 읽기
//	public Map ghRead(int no) {
//		Map<String,Object> map = new HashMap<String, Object>();
//		map.put("info", bdao.gh_Read(no));
//		map.put("view", bdao.gh_View_Read(no));
//		return map;
//	}
	
	// 게시글 방 정보 읽기
	public List<Map> ghRoomRead(int bno) {
		return bdao.gh_Room_Read(bno);
	}
	
	// 게시글 수정
	public int ghUpdate(GH_BoardBean boardBean) {
		return bdao.gh_Update(boardBean);
	}
	
// ==============================================================
	
	// 게스트하우스 리스트
	public ModelAndView guest_house_list() {
		List<GH_BoardBean> boardList = bdao.guest_house_list();
		
		mav = new ModelAndView();
		mav.addObject("boardList", boardList);
		mav.setViewName("guest_house/guest_house_list");
		return mav;
	}
	
	// 게시글 작성
	public void write(GH_BoardBean boardBean, GH_RoomBean roomBean) {
		bdao.gh_Insert(boardBean);
		bdao.gh_More_Insert(boardBean);
		
		List<GH_RoomBean> roomList = new ArrayList<GH_RoomBean>();
		String[] Room = roomBean.getRoom().split(",");
		String[] Price = roomBean.getPrice().split(",");
		String[] Gender = roomBean.getGender().split(",");
		String[] Room_people = roomBean.getRoom_people().split(",");
		
		int result = boardBean.getNo();
		roomBean.setNo(result);
		
		for(int i = 0; i < Room.length; i++) {
			roomList.add(new GH_RoomBean(
						roomBean.getNo(), Room[i], roomBean.getRoom_status(), 
						Price[i], roomBean.getPhoto(), Room_people[i], Gender[i]));
		}
		
		bdao.gh_Room_Insert(roomList);
	}
	
	// index Slider 부분 출력
	public ModelAndView index_Page_Slider() {	
		// index_New_Slider
		List<GH_BoardBean> index_New = bdao.index_New_Slider();
		
		// index_Views_Slider
		List<GH_BoardBean> index_Views = bdao.index_Views_Slider();
		
		// index_Likes_Slider
		List<GH_BoardBean> index_Likes = bdao.index_Likes_Slider();
		
		mav = new ModelAndView();
		mav.addObject("new_list", index_New);
		mav.addObject("views_list", index_Views);
		mav.addObject("likes_list", index_Likes);
		mav.setViewName("index/index");
		return mav;
	}
	
	// 상세보기 페이지
	public ModelAndView guest_house_read(int no) {
		Map<String, Object> gh_details = bdao.guest_house_read(no);
		
		mav = new ModelAndView();
		mav.addObject("gh_details", gh_details);
		mav.setViewName("guest_house/guest_house_read");
		return mav;
	}
	
	// 방정보
	public List<Map<String, Object>> room_info_data(GH_RoomBean roomBean) {
		List<Map<String, Object>> roomList = bdao.room_info_data(roomBean);
		return roomList;
	}
	
	// 게스트하우스 후기 작성
	public int gh_View_Insert(GH_ViewBean viewBean) {
		int result = bdao.gh_View_Insert(viewBean);
		return result;
	}
	
	// 게스트하우스 후기 읽기
	public List<GH_ViewBean> gh_View_Read(int no) {
		List<GH_ViewBean> viewList = bdao.gh_View_Read(no);
		return viewList;
	}
	
	// 게스트하우스 후기 삭제
	public int gh_View_delete(GH_ViewBean viewBean) {
		int result = bdao.gh_View_delete(viewBean); 
		return result;
	}
	
	// 게스트하우스 후기 수정
	public int gh_view_modify(GH_ViewBean viewBean) {
		int result = bdao.gh_view_modify(viewBean);
		return result;
	}
}