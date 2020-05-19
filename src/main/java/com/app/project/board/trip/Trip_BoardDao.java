package com.app.project.board.trip;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Trip_BoardDao {
	
	@Autowired
	private SqlSessionTemplate sql;

	public Trip_BoardBean trip_Read(int no) {
		return sql.selectOne("trip_Mapper.trip_Read", no);
	}
	
	public List<Trip_ViewBean> trip_View_Read(int no) {
		return sql.selectList("trip_Mapper.trip_View_Read", no);
	}
	
	public int trip_Insert(Trip_BoardBean boardBean) {
		return sql.insert("trip_Mapper.trip_Insert", boardBean);
	}
	
	public int trip_View_Insert(Trip_BoardBean boardBean) {
		return sql.insert("trip_Mapper.trip_View_Insert", boardBean);
	}
	
	public int trip_Update(Trip_BoardBean boardBean) {
		return sql.update("trip_Mapper.trip_Update", boardBean);
	}
	
	public int trip_Delete(int no) {
		return sql.delete("trip_Mapper.trip_Delete", no);
	}

}