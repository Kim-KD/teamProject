package com.app.project.board.trip;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Repository
public class Trip_BoardDao {
	
	@Autowired
	private SqlSessionTemplate sql;

	public void trip_Insert(Trip_BoardBean boardBean) {
		sql.insert("Trip_BoardMapper.trip_Insert", boardBean);
	}
	
	public void trip_more_Insert(Trip_BoardBean boardBean) {
		sql.insert("Trip_BoardMapper.trip_more_Insert", boardBean);
	}

	
	public void trip_Room_Insert(Trip_BoardBean boardBean) {
		sql.insert("Trip_BoardMapper.trip_Room_Insert", boardBean);
	}
	
}