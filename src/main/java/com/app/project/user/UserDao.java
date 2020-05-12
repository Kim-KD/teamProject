package com.app.project.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate sql;

	// 일반 회원가입
	public void user_join(UserBean userBean) {
		sql.insert("UserBean.user_sign_up", userBean);
	}
	
	// 기업 회원가입
	public void cpn_join(UserBean userBean) {
		sql.insert("UserBean.cpn_sign_up", userBean);
	}
	
	// 아이디 중복체크
	public int id_chk(String user_id) {
		return sql.selectOne("UserBean.existsById", user_id);
	}
	
	// 로그인
	public UserBean login(UserBean userBean) {
		return sql.selectOne("UserBean.login", userBean);
	}
	
}