package com.app.project.board.gh;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GH_BoardDao {
	
	@Autowired
	private SqlSessionTemplate sql;

	public void gh_Insert(GH_BoardBean boardBean) {
		sql.insert("GH_BoardBean.gh_Insert", boardBean);
	}
	
	public void gh_more_Insert(GH_BoardBean boardBean) {
		sql.insert("GH_BoardBean.gh_more_Insert", boardBean);
	}

	
	public void gh_Room_Insert(GH_BoardBean boardBean) {
		sql.insert("GH_BoardBean.gh_Room_Insert", boardBean);
	}
	
}