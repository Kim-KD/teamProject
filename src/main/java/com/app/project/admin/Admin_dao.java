package com.app.project.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.project.user.User_bean;

@Repository
public class Admin_dao {
	
	@Autowired
	private SqlSessionTemplate sql;

	// 유저 총 갯수
	public int user_count(String user_status) {
		return sql.selectOne("admin_mapper.user_count",user_status);
	}
	
	// 전체 유저 정보
	public List<User_bean> user_find_all(Integer startRowNum, Integer endRowNum, String user_status) {
		Map<String,Object> map = new HashMap<>();
		map.put("user_status", user_status);
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return sql.selectList("admin_mapper.user_find_all", map);
	}
	
	// 유저 정보 읽기
	public User_bean user_read(String user_id) {
		return sql.selectOne("admin_mapper.user_Read", user_id);
	}
	
	// 기업 유저 상세 정보 읽기
	public User_bean cpn_read(String user_id) {
		return sql.selectOne("admin_mapper.cpn_Read", user_id);
	}
	
	// 회원 계정 상태 수정
	public int enabled_update(User_bean userBean) {
		return sql.update("admin_mapper.enabled_update", userBean);
	}
	
	// 기업 회원 정보 수정
	public int cpn_info_update(User_bean userBean) {
		return sql.update("admin_mapper.cpn_info_update", userBean);
	}
	
}