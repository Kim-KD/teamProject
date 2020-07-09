<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="resources/data-components/user/sign_up.js"></script>

<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100 p-t-10 p-b-0">
			<form class="login100-form validate-form flex-sb flex-w" action="join" method="post">
				<a href="index" class="login100-form-title p-b-1"><img src="assets/main/img/import/img/logo.png"></a>
				<span class="login100-form-minititle p-b-21"></span>
				
				<!-- 중복체크 확인 -->
				<input type="hidden" id="id_validation" value="0"/>
				<input type="hidden" id="email_validation" value="0"/>
				<input type="hidden" id="user_status" name="user_status" value="0">
				<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}"><br>
				
				<!-- id -->
				<span class="txt1"><i class="fa fa-asterisk"></i>&nbsp;&nbsp; 아이디
				<span class="txt2" id="warning_id"></span></span>
				<div class="wrap-input100 validate-input m-b-14">
				<div class="input-group">
					<input class="input50" type="text" id="user_id" name="user_id" placeholder="6~20자 영어 또는 숫자로 입력하세요.">
					<span class="focus-input50"></span>
					<a class="login50-form-btn" onclick="return idcheckbtn()" style="color:#fff;" id="idcheckbtn">
					<i class="fa fa-cog fa-spin" id="idcheckicon"></i></a>
				</div>
				</div>
				
				<!-- pw -->
				<span class="txt1"><i class="fa fa-lock"></i>&nbsp;&nbsp; 비밀번호
				<i id="result"></i>
				<span class="txt2" id="warning_pw"></span></span>
				<div class="wrap-input100 validate-input m-b-16">
					<input class="input50" type="password" id="user_pwd" name="user_pwd" placeholder="특수문자 포함 8자이상 16자 이하로 입력하세요.">
					<span class="focus-input50"></span>
				</div>
				
				<div class="wrap-input100 validate-input m-b-16">
					<input class="input50" type="password" id="pwd_chk" name="pwd_chk" placeholder="비밀번호를 한번 더 입력하세요.">
					<span class="focus-input50"></span>
				</div>

				<!-- email -->
				<span class="txt1"><i class="fa fa-envelope"></i>&nbsp;&nbsp; 이메일 (인증 시 필요)
				<span class="txt2" id="warning_email"></span></span>
				<div class="wrap-input100 validate-input m-b-14">
				<div class="input-group">
					<input class="input50" type="text" id="user_email" name="user_email" placeholder="ex)example@gmail.com">
					<span class="focus-input50"></span>
					<a class="email50-form-btn" onclick="return emailcheckbtn()" style="color:#fff;" id="emailcheckbtn">
					<i class="fa fa-cog fa-spin" id="emailcheckicon"></i></a>
				</div>
				</div>
				
				<!-- name -->
				<span class="txt1"><i class="fa fa-user"></i>&nbsp;&nbsp; 이름
				<span class="txt2" id="warning_name"></span></span>
				<div class="wrap-input100 validate-input m-b-16">
					<input class="input50" type="text" id="user_name" name="user_name" placeholder="이름을 입력하세요.">
					<span class="focus-input50"></span>
				</div>
				
				<!-- 연락처(무선) -->
				<span class="txt1"><i class="fas fa-mobile"></i>&nbsp;&nbsp; 휴대전화
				<span class="txt2" id="warning_radio"></span></span>
				<div class="wrap-input100 validate-input m-b-16">
					<input class="input50" type="text" id="user_radio" name="user_radio" placeholder="'-'를 제외한 무선 연락처 입력">
					<span class="focus-input50"></span>
				</div>
				
				<!-- 연락처(유선) -->
				<span class="txt1"><i class="fas fa-phone"></i>&nbsp;&nbsp; 게스트 하우스 전화번호
				<span class="txt2" id="warning_cable"></span></span>
				<div class="wrap-input100 validate-input m-b-16">
					<input class="input50" type="text" id="user_cable" name="user_cable" placeholder="'-'를 제외한 유선 연락처 입력">
					<span class="focus-input50"></span>
				</div>
				
				<!-- 성별 -->
				<span class="txt1"><i class="fas fa-venus-mars"></i>&nbsp;&nbsp; 성별
				<span class="txt2" id="warning_gender"></span></span>
				<div class="wrap-input100 validate-input m-b-16" style="background-color:transparent">
				<select class="form-control" id="user_gender" name="user_gender">
					<option value="">성별</option>
					<option value="m">남자</option>
					<option value="g">여자</option>
				</select>
					<span class="focus-input50"></span>
				</div>
				
				<!-- 직업 -->
				<span class="txt1"><i class="fa fa-user"></i>&nbsp;&nbsp; 직업
				<span class="txt2" id="warning_job"></span></span>
				<div class="wrap-input100 validate-input m-b-16">
					<input class="input50" type="text" id="user_job" name="user_job" placeholder="개발자, 기획자, 서버 관리자 등등">
					<span class="focus-input50"></span>
				</div>
				
				<!-- 권한 -->
				<span class="txt1"><i class="fas fa-user"></i>&nbsp;&nbsp; 권한
				<span class="txt2" id="warning_authorities"></span></span>
				<div class="wrap-input100 validate-input m-b-16" style="background-color:transparent">
				<select class="form-control" name="authorities">
					<option value="ROLE_USER">사용자</option>
					<option value="ROLE_MANAGER">매니저</option>
					<option value="ROLE_ADMIN">관리자</option>
				</select>
					<span class="focus-input50"></span>
				</div>
				
				<div class="container-login100-form-btn m-t-17">
					<button class="login100-form-btn" onclick = "return F_validation();">
					회원가입
					</button>
				</div>
				<div class="flex-sb-m w-full p-t-3 p-b-24">
					<div class="contact100-form-checkbox">
					</div>
					<span class="txt3">이미 회원이신가요? <a href="login" class="txt2">로그인하러가기</a></span>
				</div>
			</form>
		</div>
	</div>
</div>