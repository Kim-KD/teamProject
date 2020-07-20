package com.app.project.service_center.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Report_dao {
	
	@Autowired
	private SqlSessionTemplate sql;

	public Integer report_count(String report_status, String user_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("report_status", report_status);
		return sql.selectOne("report_mapper.report_count",map);
	}
	
	public List<Report_bean> report_find_all(Integer startRowNum, Integer endRowNum,String report_status , String user_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("user_id", user_id);
		map.put("report_status", report_status);
		return sql.selectList("report_mapper.report_find_all", map);
	}
	
	public Report_bean report_read(Integer no) {
		return sql.selectOne("report_mapper.report_read", no);
	}
	
	public Integer report_insert(Report_bean board) {
		return sql.insert("report_mapper.report_insert", board);
	}
	
	public Integer report_update(Report_bean board) {
		return sql.update("report_mapper.report_update", board);
	}
	
	public Integer report_delete(Integer no) {
		return sql.delete("report_mapper.report_delete", no);
	}

}