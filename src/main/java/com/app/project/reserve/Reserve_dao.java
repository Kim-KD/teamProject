package com.app.project.reserve;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Reserve_dao {
	
	@Autowired
	private SqlSessionTemplate sql;

	public Integer reserve_count(String user_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("user_id", user_id);
		return sql.selectOne("reserve_mapper.reserve_count",map);
	}
	
	public List<Reserve_bean> reserve_find_all(Integer startRowNum, Integer endRowNum, String user_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("user_id", user_id);
		return sql.selectList("reserve_mapper.reserve_find_all", map);
	}
	
	public Reserve_bean reserve_read(Integer rno) {
		return sql.selectOne("reserve_mapper.reserve_read", rno);
	}
	
	public Integer reserve_insert(Reserve_bean board) {
		return sql.insert("reserve_mapper.reserve_insert", board);
	}
	
	public Integer reserve_update(Reserve_bean board) {
		return sql.update("reserve_mapper.reserve_update", board);
	}
}