package com.app.project.user;

import java.util.List;
import java.util.Random;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.app.project.util.MailUtil;
import com.app.project.user.AuthorityDao;

@Service
public class UserService {
	
	@Autowired
	private UserDao dao;
	@Autowired
	private AuthorityDao authorityDao;
	@Autowired
	private PasswordEncoder pwdEncoder;
	
	// 회원가입
	public void join(UserBean user) {
		if(user.getUser_status().equals("0")) {
			
			String[] str = user.getUser_radio().split("-");
			String newRadio = str[0]+str[1]+str[2];
			String userNum = RandomStringUtils.randomAlphanumeric(10);
			String encodedPwd = pwdEncoder.encode(user.getUser_pwd());
			user.setUser_pwd(encodedPwd);
			user.setChange_pwd(encodedPwd);
			user.setUser_num(userNum);
			user.setUser_radio(newRadio);
			
			String link= "<a href='http://localhost:8084/project/join_check?user_num="+userNum+"'>";
			String msg = "<p>회원 가입 확인</p>";
			msg += "<p>가입을 위해 아래 링크를 클릭하세요</p>";
			msg += "<p>가입 확인 :" + link + "클릭하세요</a></p>";
			MailUtil.sendMail("wkdql789@gmail.com", user.getUser_email(), "회원 가입 확인", msg);
			
			dao.user_join(user);
			List<String> authorities = user.getAuthorities();
			for(String authority:authorities) {
				authorityDao.insert(user.getUser_id(),authority);
			}
		} else {
			
			String[] str = user.getUser_radio().split("-");
			String newRadio = str[0]+str[1]+str[2];
			String userNum = RandomStringUtils.randomAlphanumeric(10);
			String encodedPwd = pwdEncoder.encode(user.getUser_pwd());
			user.setUser_pwd(encodedPwd);
			user.setChange_pwd(encodedPwd);
			user.setUser_num(userNum);
			user.setUser_radio(newRadio);
			
			String link= "<a href='http://localhost:8084/project/join_check?user_num="+userNum+"'>";
			String msg = "<p>회원 가입 확인</p>";
			msg += "<p>가입을 위해 아래 링크를 클릭하세요</p>";
			msg += "<p>가입 확인 :" + link + "클릭하세요</a></p>";
			MailUtil.sendMail("wkdql789@gmail.com", user.getUser_email(), "회원 가입 확인", msg);
			
			dao.user_join(user);
			dao.cpn_join(user);
			List<String> authorities = user.getAuthorities();
			for(String authority:authorities) {
				authorityDao.insert(user.getUser_id(),authority);
			}
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
	
	// 로그인 (스프링 시큐리티가 해줌)
//	public int login(UserBean user, HttpServletRequest request) {
//		UserBean loginData = dao.login(user);
//		
//		HttpSession session = request.getSession();
//		
//		if(loginData == null) {
//			return 0;
//		} else {
//			session.setAttribute("login_data", loginData);
//			return 1;
//		}
//	}
	
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
		if(user.getUser_status().equals("0")) {
			if(user.getUser_pwd() != null) {
				String encodedPwd = pwdEncoder.encode(user.getUser_pwd());
				user.setUser_pwd(encodedPwd);
				user.setChange_pwd(encodedPwd);
			}
			return dao.user_info_update(user);
		}
		else if(user.getUser_status().equals("1")) {
			if(user.getUser_pwd() != null) {
				String encodedPwd = pwdEncoder.encode(user.getUser_pwd());
				user.setUser_pwd(encodedPwd);
				user.setChange_pwd(encodedPwd);
			}
			return dao.cpn_info_update(user);
		}
		else {
			return null;
		}
	}
	
	// 아이디 찾기
	public void findById(UserBean user) {
		if(user != null) {
			
			String id = dao.find_by_id(user);
			
			String link= "<a href='http://localhost:8084/project/login'>";
			String msg = "<p>게하모 아이디 찾기</p>";
			msg += "<p>아이디 찾기 결과 고객님의 아이디는 " + id + " 입니다</p>";
			msg += "<p>로그인 하시려면 아래 링크를 클릭하세요</p>";
			msg += "<p>로그인하기 :" + link + "클릭하세요</a></p>";
			MailUtil.sendMail("wkdql789@gmail.com", user.getUser_email(), "게하모 아이디 찾기 이메일입니다.", msg);
			
		}
		else {
			System.out.println("유저 정보가 없습니다");
		}
	}
	// 비밀번호 찾기
	public void findByPwd(UserBean user) {
		if(user != null) {
			if(dao.find_by_pwd(user) != null) {
				String pwd = RandomStringUtils.randomAlphanumeric(8);
				String encodedPwd = pwdEncoder.encode(pwd);
				user.setUser_pwd(encodedPwd);
				user.setFind_num(null);
				
				dao.user_info_update(user);
				
				String link= "<a href='http://localhost:8084/project/login'>";
				String msg = "<p>게하모 비밀번호 찾기</p>";
				msg += "<p>고객님의 임시비밀번호는 " + pwd + " 입니다</p>";
				msg += "<p>로그인 하신 뒤 비밀번호 변경하시고 이용 부탁드립니다.</p>";
				msg += "<p>로그인 하시려면 아래 링크를 클릭하세요</p>";
				msg += "<p>로그인하기 :" + link + "클릭하세요</a></p>";
				MailUtil.sendMail("wkdql789@gmail.com", user.getUser_email(), "게하모 비밀번호 찾기 이메일입니다.", msg);
			}
			else {
				System.out.println("비밀번호를 받아오지 못했습니다");
			}
		}
		else {
			System.out.println("유저 정보가 없습니다");
		}
	}

	// 인증번호
	public UserBean findByNum(UserBean user) {
		if(user != null) {
			String key = RandomStringUtils.randomNumeric(4);
			user.setFind_num(key);
			dao.user_info_update(user);
			return dao.user_read(user.getUser_id());
		}
		else {
			return null;
		}
	}

	// 이메일 인증
	public boolean joinCheck(String user_num) {
		UserBean user = dao.findByUserNum(user_num);
		if(user==null) {
			return false;
		}
		user.setEnabled(true);
		dao.user_info_update(user);
		return true;
	}
}