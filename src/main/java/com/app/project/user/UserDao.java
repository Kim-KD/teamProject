package com.app.project.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate sql;

	// 일반 회원가입
	public int user_join(UserBean userBean) {
		return sql.insert("UserMapper.user_sign_up", userBean);
	}
	
	// 기업 회원가입
	public int cpn_join(UserBean userBean) {
		return sql.insert("UserMapper.cpn_sign_up", userBean);
	}
	
	// 일반 회원 정보 수정
	public int user_info_update(UserBean userBean) {
		return sql.update("UserMapper.user_info_update", userBean);
	}
	
	// 일반 회원 정보 수정
	public int cpn_info_update(UserBean userBean) {
		return sql.update("UserMapper.cpn_info_update", userBean);
	}
	
	// 아이디 중복체크
	public int id_chk(String user_id) {
		return sql.selectOne("UserMapper.existsById", user_id);
	}
	
	// 로그인
	public UserBean login(UserBean userBean) {
		return sql.selectOne("UserMapper.login", userBean);
	}
	
}