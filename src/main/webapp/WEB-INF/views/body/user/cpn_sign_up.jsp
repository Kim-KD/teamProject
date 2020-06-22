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
/* //아이디, 비번, 이메일, 전화 등에 대한 정규식을 검증해서 오류가 있을 경우 메시지를 출력
//function check(입력값, 패턴, 에러메시지출력할 곳, 에러메시지)
function check(value, pattern, area, fail_msg) {
	area.text("");
	if(value.length==0) { 
		area.text("필수입력 입니다").css({"color":"red", "font-size":"0.75em"});
		return false;
	} else if(pattern.test(value)==false) { 
		area.text(fail_msg).css({"color":"red", "font-size":"0.75em"});
		return false;
	}
	return true
}

//ajax로 아이디 사용여부 확인
function ajaxCheckId() {
	$.ajax({
		url: "id_chk",
		method: "get",
		data : "user_id=" + $("#user_id").val(),
		success: function(result) {
			if (result == 1){
				$("#id_msg").text("사용중인 아이디입니다").css({"color":"red", "font-size":"0.75em"});
			}else{
				$("#id_msg").text("좋은 아이디네요").css({"color":"green", "font-size":"0.75em"});
			}
			
		},
		error: function() {
			alert("아이디 중복확인 실패");
		}
	});
}

// ajax : 비동기(지멋대로 병렬 실행) -> 동기화(jQuery then, done, fail)
function ajaxCheckEmail() {
	$.ajax({
		url: "email_chk",
		method: "get",
		data : "user_email=" + $("#user_email").val(),
		success: function(result) {
			if (result == 1){
				$("#email_msg").text("사용중인 이메일입니다").css({"color":"red", "font-size":"0.75em"});
			}else{
				$("#email_msg").text("사용가능한 이메일입니다").css({"color":"green", "font-size":"0.75em"});
			}
		},
		error: function() {
			alert("이메일 중복확인 실패");
		}
	})
}

//아이디 확인
function checkUserid() {
	var pattern = /^[A-Za-z][A-Za-z0-9]{7,13}$/;
	return check($("#user_id").val(), pattern, $("#id_msg"), "아이디는 영숫자 8~12자입니다")
}

// 이메일 확인
function checkEmail() {
	// \의 역할 : 원래 의미를 빠져나온다(escape)
	// .은 정규식에서 임의의 글자. 점의 의미로 사용하려면 \.
	var pattern =  /^[A-Za-z][A-Za-z0-9]+@[A-Za-z\.]+$/;
	return check($("#user_email").val(), pattern, $("#email_msg"), "잘못된 이메일입니다");
}

// 이름 확인
function checkIrum() {
	var pattern = /^[가-힣]{2,5}$/;
	return check($("#user_name").val(), pattern, $("#name_msg"), "이름은 한글 2~10자입니다");
}

// 비밀번호 확인
function checkPassword() {
	// 전방탐색 ()는 하나의 조건
	var pattern = /(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{7,13}$/;
	return check($("#user_pwd").val(), pattern, $("#password_msg"), "비밀번호는 영숫자와 특수문자 8~12자입니다")
}

// 비밀번호 일치
function checkPassword2() {
	$("#password_chk_msg").text("");
	var pwd1 = $("#user_pwd").val();
	var pwd2 = $("#pwd_chk").val();
	if(pwd1!==pwd2) {
		$("#password_chk_msg").text("비밀번호가 알치하지 않습니다").css({"color":"red", "font-size":"0.75em"});
		return false;
	}
	return true;
}

// 전화번호 확인
function checkRadio() {
	// 전화번호에 -가 있을 수도 없을 수도 있다
	var inputTel = $("#user_radio").val();
	// -를 찾아서 빈문자열로 변경(삭제)
	// 010-1111-2222 -> 01011112222
	// 옵션 g: 정규식은 찾으면 종료. 끝까지 찾아라
	var tel = inputTel.replace(/\-/g,'');
	$("#user_radio").val(tel);
	var pattern =  /^[0-9]{9,11}$/;
	return check(tel, pattern, $("#radio_msg"), "무선 연락처는 -제외한 숫자 9~11자 입니다.")
}

//전화번호 확인
function checkCable() {
	// 전화번호에 -가 있을 수도 없을 수도 있다
	var inputTel = $("#user_cable").val();
	// -를 찾아서 빈문자열로 변경(삭제)
	// 010-1111-2222 -> 01011112222
	// 옵션 g: 정규식은 찾으면 종료. 끝까지 찾아라
	var tel = inputTel.replace(/\-/g,'');
	$("#user_cable").val(tel);
	var pattern =  /^[0-9]{9,12}$/;
	if ($("#user_cable").val(tel)===""){
		return check(tel, pattern, $("#cable_msg"), "유선 연락처는 -제외한 숫자 9~12자 입니다.");
	}else
		return true;
}

$(function(){
	$("#user_id").on("blur", function() {
		var result = checkUserid();
		if(result==true)
			ajaxCheckId();
	});
	$("#user_email").on("blur", function() {
		var result = checkEmail();
		if(result==true)
			ajaxCheckEmail();
	});
	$("#user_name").on("blur", checkIrum);
	$("#user_pwd").on("blur", checkPassword);
	$("#pwd_chk").on("blur", checkPassword2);
	$("#user_radio").on("blur", checkRadio);
	$("#user_cable").on("blur", checkCable);
	
	$("#join").on("click", function() {
		var r1 = checkUserid();
		var r2 = checkEmail();
		var r3 = checkIrum();
		var r4 = checkPassword();
		var r5 = checkPassword2();
		var r6 = checkRadio();
		var r7 = checkCable();
		var result = r1 && r2 && r3 && r4 && r5 && r6 && r7;
		if(result===true) {
			$.when($.ajax("id_chk?user_id=" + $("#user_id").val()),
				$.ajax("email_chk?user_email=" + $("#user_email").val())
			).done(()=>{
				alert("가입하신 이메일로 가입확인 메일을 보냈습니다.\n보내드린 메일에 링크를 클릭하시고 로그인해주세요.");
				$("#join_form").submit();
			})
		}
	})	
}); */

// -------------------------------------------------------------

// ID 중복체크 [s]
function idcheckbtn() {
	var user_id = $("#user_id").val();
	var regExp_id = /^[a-z]+[a-z0-9]{5,19}$/g;
	var _csrf = $("#_csrf").val();
	
	if(!regExp_id.test(user_id)) {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_id").css('color','red').text('6~20자 영어 또는 숫자로 다시 입력해주세요.');
		$('.login50-form-btn').css('background-color','red');
		$("#user_id").val('');
		$("#user_id").focus();
		return false;
	} else {
		$.ajax({
			url : "id_chk",
			type : 'POST',
			dataType : "json",
			data : {"user_id" : user_id, "_csrf" : _csrf},
			success : function(result) {
				if(result == 1) {
					alert('중복된 아이디입니다.');
					$("#user_id").val('');
					$("#user_id").focus();
				} else {
					alert('사용가능한 아이디입니다.');
					$('#user_id').attr('readonly','readonly');
					$('.login50-form-btn').css('background-color','#66D37E');
					$('#idcheckicon').removeClass();
					$('#idcheckicon').addClass('fa fa-check');
					$('#idcheckbtn').removeAttr("onclick");
					$('#id_validation').val('1');
				}
			}
		});
	}
}
//ID 중복체크 [e]

// Email 중복체크 [s]
function emailcheckbtn() {
	var user_email = $("#user_email").val();
	var regExp_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var _csrf = $("#_csrf").val();
	
	if(!regExp_email.test(user_email)) {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_email").css('color','red').text('이메일 형식으로 입력하세요.');
		$('.email-form-btn').css('background-color','red');
		$("#user_email").val('');
		$("#user_email").focus();
		return false;
	} else {
		$.ajax({
			url: "email_chk",
			type : 'POST',
			dataType : "json",
			data : {"user_email" : user_email, "_csrf" : _csrf},
			success: function(result) {
				if(result == 1) {
					alert("중복된 이메일입니다.");
					$("#user_email").val('');
					$("#user_email").focus();
				} else {
					alert('사용가능한 이메일입니다.');
					$('#user_email').attr('readonly','readonly');
					$('.email50-form-btn').css('background-color','#66D37E');
					$('#emailcheckicon').removeClass();
					$('#emailcheckicon').addClass('fa fa-check');
					$('#emailcheckbtn').removeAttr("onclick");
					$('#email_validation').val('1');
				}
			}
		});
	}
}
// Email 중복체크 [e]

// 비밀번호 체크 font-awesome
$(function(){
	$('#user_pwd').keyup(function() {
		$('#result').addClass('fa fa-cog fa-spin').css("color","#337ab7");
	});
	
	$('#pwd_chk').keyup(function() {
		if($('#user_pwd').val()!=$('#pwd_chk').val()) {
			$('#result').removeClass();
			$('#result').addClass('fa fa-close').css("color","#d9534f");
		} else {
			$('#result').removeClass();
			$('#result').addClass('fa fa-check').css("color","#66D37E");
		}
	});
}); 
// 비밀번호 체크 font-awesome end

// 회원등록 폼 검증[s]
function F_validation(){
	var user_id = $("#user_id").val();
	var user_pwd = $("#user_pwd").val();
	var pwd_chk = $("#pwd_chk").val();
	var user_name = $("#user_name").val();
	var user_email = $("#user_email").val();
	var user_radio = $("#user_radio").val();
	var user_gender = $("#user_gender option:selected").val();
	var user_job = $("#user_job").val();
	var id_validation = $("#id_validation").val();
	var email_validation = $("#email_validation").val();
	var cpn_service_num = $("#cpn_service_num").val();
	var cpn_bank = $("#cpn_bank").val();
	var cpn_account = $("#cpn_account").val();
	
	// 정규식
	var regExp_id = /^[a-z]+[a-z0-9]{5,19}$/g;
	var regExp_pw = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;
	var regExp_name = /^[가-힣]{2,4}$/;
	var regExp_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(!regExp_id.test(user_id)) {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_id").css('color','red').text('6~20자 영어 또는 숫자로 입력하세요.');
		$('#result').removeClass();
		$("#user_id").val('');
		$("#user_id").focus();
		return false;
	} else if(!regExp_pw.test(user_pwd)) {
		$('.focus-input50').css('border','1px solid red');
		$("#user_pwd").val('');
		$("#pwd_chk").val('');
		$("#user_pwd").focus();
		return false;
	} else if(pwd_chk.length == 0) {
		$('.focus-input50').css('border','1px solid red');
		$("#pwd_chk").focus();
		return false;
	} else if(user_pwd != pwd_chk) {
		$('.focus-input50').css('border','1px solid red');
		$("#user_pwd").val('');
		$("#pwd_chk").val('');
		$("#user_pwd").focus();
		return false;
	} else if(!regExp_email.test(user_email)) {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_email").css('color','red').text('이메일 형식으로 입력하세요.');
		$("#user_email").val('');
		$("#user_email").focus();
		return false;
	} else if(!regExp_name.test(user_name)) {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_name").css('color','red').text('2-4자 한글만 입력하세요.');
		$("#user_name").val('');
		$("#user_name").focus();
		return false;
	} else if(user_radio == '') {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_radio").css('color','red').text('핸드폰 번호를 입력해주세요.');
		$("#user_radio").val('');
		$("#user_radio").focus();
		return false;
	} else if(user_gender == '') {
		$('.focus-gender').css('border','1px solid red');
		$("#warning_gender").css('color','red').text('성별을 선택해주세요.');
		$("#user_gender").focus();
		return false;
	} else if(user_job == '') {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_job").css('color','red').text('직업을 적어주세요.');
		$("#user_job").val('');
		$("#user_job").focus();
		return false;
	} else if(cpn_service_num == '') {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_service_num").css('color','red').text('사업자번호를 입력해주세요.');
		$("#cpn_service_num").val('');
		$("#cpn_service_num").focus();
		return false;
	} else if(cpn_bank == '') {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_bank").css('color','red').text('은행을 입력해주세요');
		$("#cpn_bank").val('');
		$("#cpn_bank").focus();
		return false;
	} else if(cpn_account == '') {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_account").css('color','red').text('계좌번호를 입력해주세요.');
		$("#cpn_account").val('');
		$("#cpn_account").focus();
		return false;
	} else if(id_validation == "0") {
		alert("아이디 중복확인은 필수입니다.");
		$("#uid").focus();
		return false;
	} else if(email_validation == "0") {
		alert("이메일 중복확인은 필수입니다.");
		$("#uid").focus();
		return false;
	}
}
// 회원등록 폼 검증[e]

// out focus 처리[s]
$(function(){	
	$('#user_id').blur(function(){
		if($("#id_validation").val() == 1) {
			$('.login50-form-btn').css('background-color','#66d37e');
		} else {
			$('.focus-input50').css('border','1px solid #827ffe');
			$('.login50-form-btn').css('background-color','#7300fb');
			$("#warning_id").empty();
		}
	});
	$('#user_email').blur(function(){
		if($("#email_validation").val() == 1) {
			$('.email50-form-btn').css('background-color','#66d37e');
		} else {
			$('.focus-input50').css('border','1px solid #827ffe');
			$('.email50-form-btn').css('background-color','#7300fb');
			$("#warning_email").empty();
		}
	});
	$('#user_pwd').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
		$("#warning_pw").empty();
		$('#result').removeClass();
	});
	$('#pwd_chk').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
		$("#warning_pw").empty();
		$('#result').removeClass();
	});
	$('#user_name').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
		$("#warning_name").empty();
	});
	$('#user_radio').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
		$("#warning_radio").empty();
	});
	$('#user_gender').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
		$("#warning_gender").empty();
	});
	$('#user_job').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
		$("#warning_job").empty();
	});
	$('#cpn_service_num').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
		$("#warning_service_num").empty();
	});
	$('#cpn_bank').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
		$("#warning_bank").empty();
	});
	$('#cpn_account').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
		$("#warning_account").empty();
	});
});
// out focus 처리 [e]
</script>

<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-10 p-b-0">
				<form class="login100-form validate-form flex-sb flex-w" action="join" method="post">
					<a href="index" class="login100-form-title p-b-1"><img src="assets/img/title.png"></a>
					<span class="login100-form-minititle p-b-21"></span>
					
					<!-- 중복체크 확인 -->
					<input type="hidden" id="id_validation" value="0"/>
					<input type="hidden" id="email_validation" value="0"/>
					<input type="hidden" id="user_status" name="user_status" value="1">
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
					<i id="result"></i></span>
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
					
					<!-- 사업자 번호 -->
					<span class="txt1"><i class="fa fa-user"></i>&nbsp;&nbsp; 사업자 번호
					<span class="txt2" id="warning_service_num"></span></span>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input50" type="text" id="cpn_service_num" name="cpn_service_num">
						<span class="focus-input50"></span>
					</div>
					
					<!-- 은행 -->
					<span class="txt1"><i class="fa fa-user"></i>&nbsp;&nbsp; 은행
					<span class="txt2" id="warning_bank"></span></span>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input50" type="text" id="cpn_bank" name="cpn_bank">
						<span class="focus-input50"></span>
					</div>
					
					<!-- 계좌번호 -->
					<span class="txt1"><i class="fa fa-user"></i>&nbsp;&nbsp; 계좌번호
					<span class="txt2" id="warning_account"></span></span>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input50" type="text" id="cpn_account" name="cpn_account">
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
</body>
</html>