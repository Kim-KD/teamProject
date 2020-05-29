package com.app.project.board.gh;

import java.util.HashMap;
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

	// 게시글 작성
	public void write(GH_BoardBean boardBean, GH_TestBean testBean) {
		bdao.gh_Insert(boardBean);
		bdao.gh_More_Insert(boardBean);
		bdao.gh_Room_Insert(testBean);
	}
	
	public ModelAndView testlist() {
		mav = new ModelAndView();
		List<GH_BoardBean> boardlist = bdao.testlist();
		
		mav.addObject("boardlist", boardlist);
		mav.setViewName("index");
		return mav;
	}
	
	// 게시글 읽기
	public Map ghRead(int no) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("info", bdao.gh_Read(no));
		map.put("view", bdao.gh_View_Read(no));
		return map;
	}
	
	// 게시글 방 정보 읽기
	public List<Map> ghRoomRead(int bno) {
		return bdao.gh_Room_Read(bno);
	}
	
	// 게시글 수정
	public int ghUpdate(GH_BoardBean boardBean) {
		return bdao.gh_Update(boardBean);
	}
	
	// 게시글 삭제
	public int ghDelete(int no) {
		return bdao.gh_Delete(no);
	}
}