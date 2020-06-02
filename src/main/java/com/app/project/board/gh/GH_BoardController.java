package com.app.project.board.gh;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("login_data")
public class GH_BoardController {
	
	@Autowired
	private GH_BoardService bsvc;
	private ModelAndView mav;
	
	// 게시글 작성
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String write(GH_BoardBean boardBean, GH_RoomBean roomBean, HttpServletRequest request) {
		
		/*
		 * int i=0; 
		 * String room=""; 
		 * do { room +=(String)
		 * 
		 * request.getParameter("room"+(i+1));
		 * 
		 * room +=":";
		 * 
		 * i++;
		 * 
		 * }while(request.getParameter("room"+(i+1))!=null);
		 */
		
		List<GH_RoomBean> roomList = new ArrayList<GH_RoomBean>();
		String[] Room = roomBean.getRoom().split(",");
		String[] Price = roomBean.getPrice().split(",");
		String[] Gender = roomBean.getGender().split(",");
		String[] Room_people = roomBean.getRoom_people().split(",");
		
		for(int i = 0; i < Room.length; i++) {
			System.out.print(Room[i] + ", ");
			System.out.print(Price[i] + ", ");
			System.out.print(Gender[i] + ", ");
			System.out.println(Room_people[i]);
			System.out.println("no : " + roomBean.getNo());
			System.out.println("room_status : " + roomBean.getRoom_status());
			System.out.println("===============================");
			
			roomList.add(new GH_RoomBean(
						roomBean.getNo(), Room[i], 
						roomBean.getRoom_status(), 
						Price[i], roomBean.getPhoto(), 
						Room_people[i], Gender[i]
					));
		}
		
		bsvc.write(boardBean, roomList);
		return "index";
	}
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public ModelAndView home() {
//		mav = bsvc.testlist();
//		return mav;
//	}
	
}