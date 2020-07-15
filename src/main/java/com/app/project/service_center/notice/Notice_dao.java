package com.app.project.service_center.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.project.admin.notice.Notice_bean;

@Repository
public class Notice_dao {
	
	@Autowired
	private SqlSessionTemplate sql;

	public Integer notice_count(String title) {
//		Map<String,Object> map = new HashMap<>();
//		map.put("title", title);
		return sql.selectOne("notice_mapper.notice_count",title);
	}
	
	public List<Notice_bean> notice_find_all(Integer startRowNum, Integer endRowNum, String title) {
		Map<String,Object> map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("title", title);
		return sql.selectList("notice_mapper.notice_find_all", map);
	}
	
	public Notice_bean notice_read(Integer no) {
		return sql.selectOne("notice_mapper.notice_read", no);
	}
}