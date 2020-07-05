package com.app.project.service_center.inquiry;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Inquiry_dao {
	
	@Autowired
	private SqlSessionTemplate sql;

	public Integer inquiry_count(String user_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("user_id", user_id);
		return sql.selectOne("service_mapper.inquiry_count",map);
	}
	
	public List<Inquiry_bean> inquiry_find_all(Integer startRowNum, Integer endRowNum, String user_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("user_id", user_id);
		return sql.selectList("service_mapper.inquiry_find_all", map);
	}
	
	public Inquiry_bean inquiry_read(Integer no) {
		return sql.selectOne("service_mapper.inquiry_read", no);
	}
	
	public Integer inquiry_insert(Inquiry_bean board) {
		return sql.insert("service_mapper.inquiry_insert", board);
	}
	
	public Integer inquiry_update(Inquiry_bean board) {
		return sql.update("service_mapper.inquiry_update", board);
	}
	
	public Integer inquiry_delete(Integer no) {
		return sql.delete("service_mapper.inquiry_delete", no);
	}

}