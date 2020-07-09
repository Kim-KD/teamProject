<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="resources/data-components/user/login.js"></script>

<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100 p-t-50 p-b-90">
			<form class="login100-form validate-form flex-sb flex-w" action="login" method="post">
                   <a href="index" class="login100-form-title p-b-1"><img src="assets/main/img/import/img/logo.png"></a>
                   <span class="login100-form-minititle p-b-21"></span>
				<input type="hidden" name="_csrf" value="${_csrf.token}">
				
				<!-- id -->
				<span class="txt1"><i class="fa fa-asterisk"></i>&nbsp;&nbsp; 아이디
				<span class="txt2" id="warning_id"></span></span>
				<div class="wrap-input100 validate-input m-b-14">
					<input class="input50" type="text" id="user_id" name="user_id" placeholder="6~20자 영어 또는 숫자로 입력하세요.">
					<span class="focus-input50"></span>
				</div>
				
				<!-- pw -->
				<span class="txt1"><i class="fa fa-lock"></i>&nbsp;&nbsp; 비밀번호
				<span class="txt2" id="warning_pw"></span></span>
				<div class="wrap-input100 validate-input m-b-16">
					<input class="input50" type="password" id="user_pwd" name="user_pwd" placeholder="특수문자 포함 8자이상 16자 이하로 입력하세요.">
					<span class="focus-input50"></span>
				</div>
				
				<div class="flex-sb-m w-full p-t-3 p-b-3">
					<div class="contact100-form-checkbox">
					</div>
					<div>
						<a href="find_info" class="txt1-1">비밀번호 찾기</a>&nbsp;|&nbsp;
						<a href="sign_up" class="txt1-1">개인 회원가입</a>&nbsp;|&nbsp;
						<a href="cpn_sign_up" class="txt1-1">기업 회원가입</a>
					</div>
				</div>
				<div class="container-login100-form-btn m-t-17">
					<button type="submit" class="login100-form-btn" onclick="return L_validation();">
						로그인
					</button>
				</div>
			</form>
		</div>
	</div>
</div>
<div id="dropDownSelect1"></div>