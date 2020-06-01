package com.app.project.board.gh;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String write(GH_BoardBean boardBean, GH_TestBean testBean, HttpServletRequest request) {
		
		/*
		 * int i=0; String room=""; do { room +=(String)
		 * 
		 * request.getParameter("room"+(i+1));
		 * 
		 * room +=":";
		 * 
		 * i++;
		 * 
		 * }while(request.getParameter("room"+(i+1))!=null);
		 */
		for(int i=0; i<testBean.getList().size(); i++) {
			System.out.print(testBean.getList().get(i).getRoom() + "/ ");
			System.out.print(testBean.getList().get(i).getRoom_status() + "/ ");
			System.out.print(testBean.getList().get(i).getPrice() + "/ ");
			System.out.print(testBean.getList().get(i).getPhoto() + "/ ");
			System.out.print(testBean.getList().get(i).getRoom_people() + "/ ");
			System.out.println(testBean.getList().get(i).getGender() + "/ ");
		}
		bsvc.write(boardBean, testBean);
		return "index";
	}
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public ModelAndView home() {
//		mav = bsvc.testlist();
//		return mav;
//	}
	
}