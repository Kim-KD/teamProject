package com.app.project.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	
	@Autowired
	private UserDao udao;

	public void join(UserBean userBean) {
		udao.join(userBean);
	}
	
}
