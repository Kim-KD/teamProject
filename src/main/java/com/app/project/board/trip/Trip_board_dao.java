package com.app.project.board.trip;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Trip_board_dao {
	
	@Autowired
	private SqlSessionTemplate sql;

	public Integer trip_count(String user_id, String on_off) {
		Map<String,Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("on_off", on_off);
		return sql.selectOne("trip_mapper.trip_count",map);
	}
	
	public List<Trip_board_bean> trip_find_all(Integer startRowNum, Integer endRowNum, String user_id, String on_off) {
		Map<String,Object> map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("user_id", user_id);
		map.put("on_off", on_off);
		return sql.selectList("trip_mapper.trip_find_all", map);
	}
	
	public Trip_board_bean trip_read(Integer no) {
		return sql.selectOne("trip_mapper.trip_read", no);
	}
	
	public Integer trip_insert(Trip_board_bean board) {
		return sql.insert("trip_mapper.trip_insert", board);
	}
	
	public Integer trip_update(Trip_board_bean board) {
		return sql.update("trip_mapper.trip_update", board);
	}
	
	public Integer trip_delete(Integer no) {
		return sql.delete("trip_mapper.trip_delete", no);
	}

	// 후기 start
	// 관광명소 후기 작성
	public Integer trip_view_insert(Trip_view_bean view) {
		return sql.insert("trip_mapper.trip_view_insert", view);
	}

	// 관광명소 후기 총 갯수
	public List<Trip_view_bean> trip_view_find_all(Integer no) {
		return sql.selectList("trip_mapper.trip_view_find_all", no);
	}

	// 관광명소 후기 읽기
	public Trip_view_bean trip_view_read(Integer vno) {
		return sql.selectOne("trip_mapper.trip_view_read", vno);
	}

	// 관광명소 후기 삭제
	public Integer trip_view_delete(Integer vno) {
		return sql.delete("trip_mapper.trip_view_delete", vno);
	}

	// 관광명소 후기 수정
	public Integer trip_view_update(Trip_view_bean view) {
		return sql.update("trip_mapper.trip_view_update", view);
	}
}