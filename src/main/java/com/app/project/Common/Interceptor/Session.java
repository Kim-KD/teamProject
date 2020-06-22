package com.app.project.Common.Interceptor;

import lombok.Data;
import java.util.List;

/**
 * <javadoc>
 * Session Data Transfer Object
 * @author      김재일
 * @version     1.0
 * @since       2020-06-22
 * <pre>
 * 세션에 담을 데이터 변수만 생성할 것.
 * </pre>
 **/
@Data
public class Session {
	private String user_id;			// 아이디
	private String user_status;		// 유저 구분
	private String user_num;		// 유저 고유번호
	private String user_pwd;		// 비밀번호
	private String user_name;		// 이름
	private String user_radio;		// 연락처(무선)
	private String user_cable;		// 연락처(유선)
	private String user_email;		// 이메일
	private String user_gender;		// 성별
	private String user_job;		// 직업
	private String user_create_day;	// 가입일
	private String user_certify;	// 이메일 인증
	private String change_pwd;		// 변경된 비밀번호
	private String change_pwd_day;	// 비밀번호 변경일
	private Integer login_fail_cnt;	// 로그인 실패 횟수
	private Boolean enabled;		// 계정 차단
	private String find_num;		// 인증 번호
	private String cpn_service_num;	// 사업자 번호
	private String cpn_bank;		// 은행
	private String cpn_account;		// 계좌번호
	private List<String> authorities;	// 유저 권한
}