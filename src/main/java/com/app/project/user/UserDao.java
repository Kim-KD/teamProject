package com.app.project.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate sql;

	public void user_join(UserBean userBean) {
		sql.insert("UserBean.user_sign_up", userBean);
	}
	
	public void cpn_join(UserBean userBean) {
		sql.insert("UserBean.cpn_sign_up", userBean);
	}
}
