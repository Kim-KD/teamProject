package com.app.project.board.gh;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GH_BoardService {
	
	@Autowired
	private GH_BoardDao bdao;

	public void write(GH_BoardBean boardBean) {
		bdao.gh_Insert(boardBean);
		bdao.gh_more_Insert(boardBean);
		bdao.gh_Room_Insert(boardBean);
	}
	
}