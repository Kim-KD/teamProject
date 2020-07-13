package com.app.project.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.project.service_center.inquiry.Inquiry_bean;
import com.app.project.user.User_bean;

@Repository
public class Admin_dao {
	
	@Autowired
	private SqlSessionTemplate sql;

	// 회원 관리 start
	// 유저 총 갯수
	public int user_count(String user_status, String user_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("user_status", user_status);
		map.put("user_id", user_id);
		return sql.selectOne("admin_mapper.user_count",map);
	}
	
	// 전체 유저 정보
	public List<User_bean> user_find_all(Integer startRowNum, Integer endRowNum, String user_status, String user_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("user_status", user_status);
		map.put("user_id", user_id);
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return sql.selectList("admin_mapper.user_find_all", map);
	}
	
	// 유저 정보 읽기
	public User_bean user_read(String user_id) {
		return sql.selectOne("admin_mapper.user_read", user_id);
	}
	
	// 기업 유저 상세 정보 읽기
	public User_bean cpn_read(String user_id) {
		return sql.selectOne("admin_mapper.cpn_read", user_id);
	}
	
	// 회원 계정 상태 수정
	public int enabled_update(User_bean userBean) {
		return sql.update("admin_mapper.enabled_update", userBean);
	}
	
	// 회원 관리 end
	
	// 문의 관리 start
	// 문의 총 갯수
	public Integer inquiry_count(String inquiry_status, String user_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("inquiry_status", inquiry_status);
		return sql.selectOne("admin_mapper.inquiry_count",map);
	}
	
	// 전체 문의 정보
	public List<Inquiry_bean> inquiry_find_all(Integer startRowNum, Integer endRowNum, String inquiry_status, String user_id) {
		Map<String,Object> map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("user_id", user_id);
		map.put("inquiry_status", inquiry_status);
		return sql.selectList("admin_mapper.inquiry_find_all", map);
	}
	
	// 문의 읽기
	public Inquiry_bean inquiry_read(Integer no) {
		return sql.selectOne("admin_mapper.inquiry_read", no);
	}
	
	// 문의 답변
	public Integer inquiry_update(Inquiry_bean board) {
		return sql.update("admin_mapper.inquiry_update", board);
	}
	
	// 문의 삭제
	public Integer inquiry_delete(Integer no) {
		return sql.delete("admin_mapper.inquiry_delete", no);
	}
	// 문의 관리 end
}