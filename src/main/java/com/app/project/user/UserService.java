package com.app.project.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	
	@Autowired
	private UserDao udao;

	public void join(UserBean userBean) {
		if(userBean.getUser_status().equals("0")) {
			udao.user_join(userBean);
		} else {
			udao.user_join(userBean);
			udao.cpn_join(userBean);
		}
	}
	
}
