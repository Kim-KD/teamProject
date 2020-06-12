package com.app.project.board.trip;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Trip_BoardDao {
	
	@Autowired
	private SqlSessionTemplate sql;

	public int trip_count(String user_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("user_id", user_id);
		return sql.selectOne("trip_Mapper.trip_count",map);
	}
	
	public List<Trip_BoardBean> trip_find_all(int startRowNum, int endRowNum) {
		Map<String,Integer> map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return sql.selectList("trip_Mapper.trip_find_all", map);
	}
	
	public Trip_BoardBean trip_read(int no) {
		return sql.selectOne("trip_Mapper.trip_read", no);
	}
	
	public List<Trip_ViewBean> trip_view_read(int no) {
		return sql.selectList("trip_Mapper.trip_view_read", no);
	}
	
	public int trip_insert(Trip_BoardBean board) {
		return sql.insert("trip_Mapper.trip_insert", board);
	}
	
	public int trip_view_insert(Trip_BoardBean board) {
		return sql.insert("trip_Mapper.trip_view_insert", board);
	}
	
	public int trip_update(Trip_BoardBean board) {
		return sql.update("trip_Mapper.trip_update", board);
	}
	
	public int trip_delete(int no) {
		return sql.delete("trip_Mapper.trip_delete", no);
	}

}