package com.app.project.board.gh;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GH_BoardDao {
	
	@Autowired
	private SqlSessionTemplate sql;

	public int gh_Insert(GH_BoardBean boardBean) {
		return sql.insert("GH_Mapper.gh_Insert", boardBean);
	}
	
	public int gh_More_Insert(GH_BoardBean boardBean) {
		return sql.insert("GH_Mapper.gh_More_Insert", boardBean);
	}
	
	public int gh_Room_Insert(GH_BoardBean boardBean) {
		return sql.insert("GH_Mapper.gh_Room_Insert", boardBean);
	}
	
	public int gh_View_Insert(GH_BoardBean boardBean) {
		return sql.insert("GH_Mapper.gh_View_Insert", boardBean);
	}
	
	public int gh_Update(GH_BoardBean boardBean) {
		return sql.update("GH_Mapper.gh_Update", boardBean);
	}
	
	public int gh_Delete(int no) {
		return sql.delete("GH_Mapper.gh_Delete", no);
	}
}