package com.app.project.board.trip;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.app.project.board.gh.GH_BoardBean;

@Service
public class Trip_BoardService {
	
	@Autowired
	private Trip_BoardDao bdao;

	// 게시글 작성
	public void write(Trip_BoardBean boardBean) {
		bdao.trip_Insert(boardBean);
	}
	
	// 게시글 읽기
	public Map tripRead(int no) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("info", bdao.trip_Read(no));
		map.put("view", bdao.trip_View_Read(no));
		return map;
	}
	
	// 게시글 수정
	public int tripUpdate(Trip_BoardBean boardBean) {
		return bdao.trip_Update(boardBean);
	}
	
	// 게시글 삭제
	public int tripDelete(int no) {
		return bdao.trip_Delete(no);
	}
}