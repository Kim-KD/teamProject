package com.app.project.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class User_dao {
	
	@Autowired
	private SqlSessionTemplate sql;

	// 일반 회원가입
	public int user_join(User_bean userBean) {
		return sql.insert("User_Mapper.user_sign_up", userBean);
	}
	
	// 기업 회원가입
	public int cpn_join(User_bean userBean) {
		return sql.insert("User_Mapper.cpn_sign_up", userBean);
	}
	
	// 유저 정보 읽기
	public User_bean user_read(String user_id) {
		return sql.selectOne("User_Mapper.user_Read", user_id);
	}
	
	// 기업 유저 상세 정보 읽기
	public User_bean cpn_read(String user_id) {
		return sql.selectOne("User_Mapper.cpn_Read", user_id);
	}
	
	// 일반 회원 정보 수정
	public int user_info_update(User_bean userBean) {
		return sql.update("User_Mapper.user_info_update", userBean);
	}
	
	// 기업 회원 정보 수정
	public int cpn_info_update(User_bean userBean) {
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
	
	// 이메일 수정체크
	public int email_update_chk(User_bean user) {
		return sql.selectOne("User_Mapper.updateByEmail", user);
	}
	
	// 비밀번호 확인
	public int pwd_chk(User_bean user) {
		return sql.selectOne("User_Mapper.pwdCheck", user);
	}
	
	// 아이디 찾기
	public String find_by_id(User_bean user) {
		return sql.selectOne("User_Mapper.findById",user); 
	}
	
	// 비밀번호 찾기
	public String find_by_pwd(User_bean user) {
		return sql.selectOne("User_Mapper.findByPwd",user); 
	}
		
	// 인증번호
	public User_bean find_by_num(User_bean userBean) {
		return sql.selectOne("User_Mapper.findByNum",userBean); 
	}
	
	// 이메일 인증
	public User_bean findByUserNum(String user_num) {
		return (User_bean)sql.selectOne("User_Mapper.findByUserNum", user_num);
	}
	
}