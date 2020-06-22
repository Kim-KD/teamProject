<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>게하모 | 게스트 하우스의 모든 것</title>
    
    <!-- Favicon -->
	<link href="assets/img/icon.png" rel="shortcut icon"/>
	
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" />
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<link rel="stylesheet" type="text/css" href="/project/resources/login_vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/project/resources/login_vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="/project/resources/login_vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="/project/resources/login_vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="/project/resources/login_vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="/project/resources/login_vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="/project/resources/login_css/util.css">
	<link rel="stylesheet" type="text/css" href="/project/resources/login_css/main.css">
	<script src="/project/resources/login_vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="/project/resources/login_vendor/animsition/js/animsition.min.js"></script>
	<script src="/project/resources/login_vendor/bootstrap/js/popper.js"></script>
	<script src="/project/resources/login_vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/project/resources/login_vendor/select2/select2.min.js"></script>
	<script src="/project/resources/login_vendor/daterangepicker/moment.min.js"></script>
	<script src="/project/resources/login_vendor/daterangepicker/daterangepicker.js"></script>
</head>

<script>
//로그인 폼 검증[s]
function L_validation(){
	 var user_id = $("#user_id").val();
	 // 정규식
	 var regExp_id = /^[a-z]+[a-z0-9]{5,19}$/g;

	 if(!regExp_id.test(user_id)) {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_id").css('color','red').text('6~20자 영어 또는 숫자로 입력하세요.');
	    $('#result').removeClass();
		$("#user_id").val('');
		$("#user_id").focus();
		return false;
	 }
}
// 로그인 폼 검증[e]
</script>

<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w" action="login" method="post">
                    <a href="index" class="login100-form-title p-b-1"><img src="assets/img/title.png"></a>
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
</body>
</html>