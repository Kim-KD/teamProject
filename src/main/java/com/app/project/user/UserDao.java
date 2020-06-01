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
		return sql.insert("User_Mapper.user_sign_up", userBean);
	}
	
	// 기업 회원가입
	public int cpn_join(UserBean userBean) {
		return sql.insert("User_Mapper.cpn_sign_up", userBean);
	}
	
	// 유저 정보 읽기
	public UserBean user_read(String user_id) {
		return sql.selectOne("User_Mapper.user_Read", user_id);
	}
	
	// 기업 유저 상세 정보 읽기
	public UserBean cpn_read(String user_id) {
		return sql.selectOne("User_Mapper.cpn_Read", user_id);
	}
	
	// 일반 회원 정보 수정
	public int user_info_update(UserBean userBean) {
		return sql.update("User_Mapper.user_info_update", userBean);
	}
	
	// 기업 회원 정보 수정
	public int cpn_info_update(UserBean userBean) {
		return sql.update("User_Mapper.cpn_info_update", userBean);
	}
	
	// 아이디 중복체크
	public int id_chk(String user_id) {
		return sql.selectOne("User_Mapper.existsById", user_id);
	}
	
	// 이메일 중복체크
	public int email_chk(String user_email) {
		return sql.selectOne("User_Mapper.existsByEmail", user_email);
	}
	
	// 아이디 찾기
	public String find_by_id(UserBean userBean) {
		return sql.selectOne("User_Mapper.findById",userBean); 
	}
	
	// 비밀번호 찾기
	public String find_by_pwd(UserBean userBean) {
		return sql.selectOne("User_Mapper.findByPwd",userBean); 
	}
		
	// 인증번호
	public String find_by_num(UserBean userBean) {
		return sql.selectOne("User_Mapper.findByNum",userBean); 
	}
	
	// 로그인
	public UserBean login(UserBean userBean) {
		return sql.selectOne("User_Mapper.login", userBean);
	}
	
	// 이메일 인증
	public UserBean findByUserNum(String user_num) {
		return (UserBean)sql.selectOne("User_Mapper.findByUserNum", user_num);
	}
	
}