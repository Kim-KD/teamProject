package com.app.project.user;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {
	
	@Autowired
	private UserDao dao;
	@Autowired
	private PasswordEncoder pwdEncoder;
	
	// 회원가입
	public void join(UserBean user) {
		if(user.getUser_status().equals("0")) {
			String encodedPwd = pwdEncoder.encode(user.getUser_pwd());
			user.setUser_pwd(encodedPwd);
			dao.user_join(user);
		} else {
			String encodedPwd = pwdEncoder.encode(user.getUser_pwd());
			user.setUser_pwd(encodedPwd);
			dao.user_join(user);
			dao.cpn_join(user);
		}
	}
	
	// 아이디 중복체크
	public int id_chk(String user_id) {
		int result = dao.id_chk(user_id);
		return result;
	}
	
	// 이메일 중복체크
	public int email_chk(String user_email) {
		int result = dao.email_chk(user_email);
		return result;
	}
	
	// 로그인
	public int login(UserBean userBean, HttpServletRequest request) {
		UserBean loginData = dao.login(userBean);
		
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
		UserBean user = dao.user_read(user_id);
		if(user.getUser_status().equals("d")) {
			return user;
		}
		else if(user.getUser_status().equals("c")) {
			UserBean cpn = dao.cpn_read(user_id);
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
			return dao.user_info_update(user);
		}
		else if(user.getUser_status().equals("c")) {
			return dao.cpn_info_update(user);
		}
		else {
			return null;
		}
	}
	
	// 아이디 찾기
	public String findById(UserBean user) {
		if(user != null) {
			return dao.find_by_id(user);
		}
		else {
			return null;
		}
	}
	// 비밀번호 찾기
	public String findByPwd(UserBean user) {
		if(user != null) {
			return dao.find_by_pwd(user);
		}
		else {
			return null;
		}
	}

	// 인증번호
	public String findByNum(UserBean user) {
		if(user != null) {
			int num = new Random().nextInt(9999);
			String key = "" + num;
			user.setFind_num(key);
			dao.user_info_update(user);
			return dao.find_by_num(user);
		}
		else {
			return null;
		}
	}
}