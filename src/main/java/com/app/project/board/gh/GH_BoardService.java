package com.app.project.board.gh;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.app.project.util.Page;
import com.app.project.util.PagingUtil;

@Service
public class GH_BoardService {
	
	@Autowired
	private GH_BoardDao bdao;
	private ModelAndView mav;
	
	//=========================관리자==============================
	// 관리자 게스트 하우스 게시글 수정(공개여부,파워링크,상단노출)
	// 관리자 게시글 공개여부 수정
		public Integer admin_guest_update(String board) {
			if(board.equals("[]")==false) {
				GH_BoardBean guest = new GH_BoardBean();
				String board_str1 = board.replace("[","");
				String board_str2 = board_str1.replace("]","");
				String board_str3 = board_str2.replace("\"","");
				String board_str4 = board_str3.replace("{","");
				String board_str5 = board_str4.replace("}","");
				String[] board_list = board_str5.split(",");
				String[] board_list2 = null;
				
				for (int i = 0; i < board_list.length; i++) {
					board_list2 = board_list[i].split(":");
					for (int j = 0; j < board_list2.length; j++) {
						if(board_list2[j].equals("no")) {
							guest.setNo(Integer.parseInt(board_list2[j+1]));
						}else if(board_list2[j].equals("on_off")) {
							guest.setOn_off(board_list2[j+1]);
							bdao.gh_update(guest);
						}
					}
				}
				return 1;
			}
			return 0;
		}
		
		// 관리자 게시글 삭제
		public Integer admin_guest_delete(String no) {
			String no_str1 = no.replace("[","");
			String no_str2 = no_str1.replace("]","");
			String no_str3 = no_str2.replace("\"","");
			String[] no_list = no_str3.split(",");
			if(no_list!=null) {
				for (String number : no_list) {
					bdao.gh_delete(Integer.parseInt(number));
				}
				return 1;
			}
			return 0;
		}
		
		public Page admin_guest_list(Integer pageno, String user_id, String on_off) {
			Integer countOfBoard = bdao.gh_count(user_id,on_off);
			Page page = PagingUtil.getPage(pageno, countOfBoard);
			Integer srn = page.getStartRowNum();
			Integer ern = page.getEndRowNum();
			List<GH_BoardBean> boardList = bdao.gh_find_all(srn, ern,user_id,on_off);
			page.setGh_list(boardList);
			return page;
		}
	//===========================================================
	
	
	// 게스트하우스 목록
	public ModelAndView guest_house_list(String user_id, String on_off) {
		List<GH_BoardBean> boardList = bdao.guest_house_list(user_id,on_off);
		
		mav = new ModelAndView();
		mav.addObject("boardList", boardList);
		mav.setViewName("guest_house/guest_house_list");
		return mav;
	}
	
	// 게스트하우스 게시글 작성
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
	
	// 게스트하우스 게시글 수정
	public void modify(GH_BoardBean boardBean, GH_RoomBean roomBean) {
		bdao.gh_Modify(boardBean);
		bdao.gh_More_Modify(boardBean);
		
		List<GH_RoomBean> roomList = new ArrayList<GH_RoomBean>();
		String[] Room = roomBean.getRoom().split(",");
		String[] Price = roomBean.getPrice().split(",");
		String[] Gender = roomBean.getGender().split(",");
		String[] Room_people = roomBean.getRoom_people().split(",");

		for(int i = 0; i < Room.length; i++) {
			roomList.add(new GH_RoomBean(
						roomBean.getNo(), Room[i], roomBean.getRoom_status(), 
						Price[i], roomBean.getPhoto(), Room_people[i], Gender[i]));
		}
		
		bdao.gh_Room_Modify(roomList);
	}
	
	// 게스트하우스 게시글 + 후기 삭제
	public int gh_delete(int no) {
		int result = bdao.gh_delete(no);
		return result;
	}
	
	// 게스트하우스 게시글 수정페이지 이동
	public ModelAndView modify_page(int no) {
		Map<String, Object> modify_page_data = bdao.guest_house_read(no);
		mav = new ModelAndView();
		mav.addObject("modify_page_data", modify_page_data);
		mav.setViewName("guest_house/guest_house_modify");
		return mav;
	}
	
	// 게스트하우스 조회수
	public int views_update(GH_BoardBean boardBean) {
		return bdao.views_update(boardBean);
	}
	
	// 게스트하우스 추천
	public int likes_update(GH_BoardBean boardBean) {
		return bdao.likes_update(boardBean);
	}
	
	// 게스트하우스 상세보기 페이지
	public ModelAndView guest_house_read(int no) {
		Map<String, Object> gh_details = bdao.guest_house_read(no);
		
		mav = new ModelAndView();
		mav.addObject("gh_details", gh_details);
		mav.setViewName("guest_house/guest_house_read");
		return mav;
	}
	
	// 게스트하우스 방정보
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

	public int count_views(int no) {
		int result = bdao.count_views(no);
		return result;
	}
	
	public int count_like(int no) {
		int result = bdao.count_like(no);
		return result;
	}
}