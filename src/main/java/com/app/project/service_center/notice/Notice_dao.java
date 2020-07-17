package com.app.project.service_center.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	// 공지사항 작성
	public Integer notice_insert(Notice_bean board) {
		return sql.insert("notice_mapper.notice_insert", board);
	}
	
	// 공지사항 읽기
	public Notice_bean notice_read(Integer no) {
		return sql.selectOne("notice_mapper.notice_read", no);
	}
	
	// 공지사항 수정
	public Integer notice_update(Notice_bean board) {
		return sql.update("notice_mapper.notice_update", board);
	}
	
	// 공지사항 삭제
	public Integer notice_delete(Integer no) {
		return sql.delete("notice_mapper.notice_delete", no);
	}
}