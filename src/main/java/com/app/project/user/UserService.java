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
	
	// 유저 정보 읽기
	public UserBean userInfoRead(String user_id) {
		UserBean user = udao.user_Read(user_id);
		if(user.getUser_status().equals("d")) {
			return user;
		}
		else if(user.getUser_status().equals("c")) {
			UserBean cpn = udao.cpn_Read(user_id);
			user.setCpn_service_num(cpn.getCpn_service_num());
			user.setCpn_bank(cpn.getCpn_bank());
			user.setCpn_account(cpn.getCpn_account());
			return user;
		}
		else {
			return null;
		}
	}
	
	// 유저 정보 수정
	public Integer userInfoUpdate(UserBean user) {
		if(user.getUser_status().equals("d")) {
			return udao.user_info_update(user);
		}
		else if(user.getUser_status().equals("c")) {
			return udao.cpn_info_update(user);
		}
		else {
			return null;
		}
	}	
}