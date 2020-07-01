package com.app.project.board.gh.mvc;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.app.project.board.gh.GH_BoardBean;
import com.app.project.board.gh.GH_BoardService;
import com.app.project.board.gh.GH_RoomBean;

@Controller
@SessionAttributes("login_data")
public class GH_Board_mvc_Controller {
	
	@Autowired
	private GH_BoardService bsvc;
	private ModelAndView mav;
	
	@GetMapping("/guest_house_write")
	public String write_page() {
		return "guest_house/guest_house_write";
	}
	
	// 게스트하우스 리스트
	@GetMapping("/guest_house_list")
	public ModelAndView guest_house_list() {
		mav = bsvc.guest_house_list();
		return mav;
	}
	
	// 게스트하우스 게시글 수정페이지 이동
	@GetMapping("/guest_house_modify")
	public ModelAndView modify_page(int no) {
		mav = bsvc.modify_page(no);
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
		
		String path = "C:\\Users\\rmseh\\Desktop\\workspace\\teamProject\\src\\main\\webapp\\resources\\assets\\main\\img\\guest_house_img\\";
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
	
	// 게시글 수정
	@PostMapping("/modify")
	public String modify(GH_BoardBean boardBean, GH_RoomBean roomBean, @RequestParam MultipartFile file) {
		String path = "C:\\Users\\rmseh\\Desktop\\workspace\\teamProject\\src\\main\\webapp\\resources\\assets\\main\\img\\guest_house_img\\";
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
		bsvc.modify(boardBean, roomBean);
		return "redirect:/";
	}
	
	// 상세보기 페이지
	@GetMapping("/guest_house_read")
	public ModelAndView guest_house_read(@RequestParam("no") int no) {
		mav = bsvc.guest_house_read(no);
		return mav;
	}
}