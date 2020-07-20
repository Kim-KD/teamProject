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

	// 문의 관리 start
	// 문의 총 갯수
	public Integer inquiry_count(String inquiry_status, String user_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("inquiry_status", inquiry_status);
		return sql.selectOne("inquiry_mapper.inquiry_count",map);
	}
	
	// 전체 문의 정보
	public List<Inquiry_bean> inquiry_find_all(Integer startRowNum, Integer endRowNum, String inquiry_status, String user_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("user_id", user_id);
		map.put("inquiry_status", inquiry_status);
		return sql.selectList("inquiry_mapper.inquiry_find_all", map);
	}
	
	// 문의 읽기
	public Inquiry_bean inquiry_read(Integer no) {
		return sql.selectOne("inquiry_mapper.inquiry_read", no);
	}
	
	// 문의 작성
	public Integer inquiry_insert(Inquiry_bean board) {
		return sql.insert("inquiry_mapper.inquiry_insert", board);
	}
	
	// 문의 수정
	public Integer inquiry_update(Inquiry_bean board) {
		return sql.update("inquiry_mapper.inquiry_update", board);
	}
	
	// 문의 삭제
	public Integer inquiry_delete(Integer no) {
		return sql.delete("inquiry_mapper.inquiry_delete", no);
	}

}