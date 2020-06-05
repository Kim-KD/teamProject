package com.app.project.board.gh;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("login_data")
public class GH_BoardController {
	
	@Autowired
	private GH_BoardService bsvc;
	private ModelAndView mav;
	
	// 게시글 작성
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String write(GH_BoardBean boardBean, GH_RoomBean roomBean, @RequestParam MultipartFile file) {
		System.out.println("======================================");
		System.out.println("빈에 있는 이름 : " + boardBean.getThumbnail());
		System.out.println("파일 이릅 : " + file.getName());
		System.out.println("파일 원본 이름 : " + file.getOriginalFilename());
		System.out.println("파일 크기 : " + file.getSize());
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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		mav = bsvc.index_Page_Slider();
		return mav;
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index() {
		mav = bsvc.index_Page_Slider();
		return mav;
	}
	
}