package com.app.project.user;

public class UserBean {
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
	private String login_fail_cnt;	// 로그인 실패 횟수
	private String user_block;		// 계정 차단
	private String cpn_service_num;	// 사업자 번호
	private String cpn_bank;		// 은행
	private String cpn_account;		// 계좌번호

	public UserBean(String user_id, String user_pwd) {
		this.user_id = user_id;
		this.user_pwd = user_pwd;
	}
	
	public UserBean() {
		super();
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_status() {
		return user_status;
	}
	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}
	public String getUser_num() {
		return user_num;
	}
	public void setUser_num(String user_num) {
		this.user_num = user_num;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_radio() {
		return user_radio;
	}
	public void setUser_radio(String user_radio) {
		this.user_radio = user_radio;
	}
	public String getUser_cable() {
		return user_cable;
	}
	public void setUser_cable(String user_cable) {
		this.user_cable = user_cable;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_job() {
		return user_job;
	}
	public void setUser_job(String user_job) {
		this.user_job = user_job;
	}
	public String getUser_create_day() {
		return user_create_day;
	}
	public void setUser_create_day(String user_create_day) {
		this.user_create_day = user_create_day;
	}
	public String getUser_certify() {
		return user_certify;
	}
	public void setUser_certify(String user_certify) {
		this.user_certify = user_certify;
	}
	public String getChange_pwd() {
		return change_pwd;
	}
	public void setChange_pwd(String change_pwd) {
		this.change_pwd = change_pwd;
	}
	public String getChange_pwd_day() {
		return change_pwd_day;
	}
	public void setChange_pwd_day(String change_pwd_day) {
		this.change_pwd_day = change_pwd_day;
	}
	public String getLogin_fail_cnt() {
		return login_fail_cnt;
	}
	public void setLogin_fail_cnt(String login_fail_cnt) {
		this.login_fail_cnt = login_fail_cnt;
	}
	public String getUser_block() {
		return user_block;
	}
	public void setUser_block(String user_block) {
		this.user_block = user_block;
	}
	public String getCpn_service_num() {
		return cpn_service_num;
	}
	public void setCpn_service_num(String cpn_service_num) {
		this.cpn_service_num = cpn_service_num;
	}
	public String getCpn_bank() {
		return cpn_bank;
	}
	public void setCpn_bank(String cpn_bank) {
		this.cpn_bank = cpn_bank;
	}
	public String getCpn_account() {
		return cpn_account;
	}
	public void setCpn_account(String cpn_account) {
		this.cpn_account = cpn_account;
	}
	
}