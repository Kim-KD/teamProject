package com.app.project.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate sql;

	public void join(UserBean userBean) {
		sql.insert("UserBean.userinsert", userBean);
	}
	
}
