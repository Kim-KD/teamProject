package com.app.project.board.gh;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("login_data")
public class GH_BoardController {
	
	@Autowired
	private GH_BoardService bsvc;
	private ModelAndView mav;
	
	// 처음 시작 화면
	@GetMapping({"/index","/"})
	public ModelAndView home() {
		mav = bsvc.index_Page_Slider();
		return mav;
	}
	
	// 게시글 작성
	@PostMapping("/write")
	public String write(GH_BoardBean boardBean, GH_RoomBean roomBean, @RequestParam MultipartFile file) {
		System.out.println("======================================");
		System.out.println("빈에 있는 이름 : " + boardBean.getThumbnail());
		System.out.println("파일 이릅 : " + file.getName());
		System.out.println("파일 원본 이름 : " + file.getOriginalFilename());
		System.out.println("파일 크기 : " + file.getSize());
		System.out.println(roomBean.getRoom_status());
		System.out.println("======================================");
		
		String path = "C:\\Users\\rmseh\\Desktop\\workspace\\teamProject\\src\\main\\webapp\\resources\\assets\\gh_img\\";
		String originalFileName = file.getOriginalFilename();
		boardBean.setThumbnail(originalFileName);

		File upload_file = new File(path + originalFileName);
		
		try {
			file.transferTo(upload_file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		bsvc.write(boardBean, roomBean);
		return "redirect:/";
	}
	
	// 상세보기 페이지
	@GetMapping("/gh_details")
	public ModelAndView gh_details(@RequestParam("no") int no) {
		mav = bsvc.gh_details(no);
		return mav;
	}
	
	// 방 정보
	@GetMapping("/room_info_data")
	@ResponseBody
	public List<Map<String,Object>> room_info_data(GH_RoomBean roomBean) {
		List<Map<String,Object>> roomList = bsvc.room_info_data(roomBean);
		return roomList;
	}
	
}