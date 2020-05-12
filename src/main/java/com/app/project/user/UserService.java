package com.app.project.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	
	@Autowired
	private UserDao udao;
	
	// 회원가입
	public void join(UserBean userBean) {
		if(userBean.getUser_status().equals("0")) {
			udao.user_join(userBean);
		} else {
			udao.user_join(userBean);
			udao.cpn_join(userBean);
		}
	}
	
	// 아이디 중복체크
	public int id_chk(String user_id) {
		int result = udao.id_chk(user_id);
		return result;
	}
	
	// 로그인
	public int login(UserBean userBean, HttpServletRequest request) {
		UserBean loginData = udao.login(userBean);
		
		HttpSession session = request.getSession();
		
		if(loginData == null) {
			return 0;
		} else {
			session.setAttribute("login_data", loginData);
			return 1;
		}
	}
	
}