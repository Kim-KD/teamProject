package com.app.project.board.trip;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
public class Trip_BoardService {
	
	@Autowired
	private Trip_BoardDao bdao;

	public void write(Trip_BoardBean boardBean) {
		bdao.trip_Insert(boardBean);
		bdao.trip_more_Insert(boardBean);
		bdao.trip_Room_Insert(boardBean);
	}
	
}