<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<script>
function id_check() {
	// ID 유효성 검사
	var idRegExp = /^[a-z]+[a-z0-9]{4,12}$/g;
	var user_id = $("#user_id").val();
	
	if(user_id == '') {
		$("#userid_msg").empty();
		$("#userid_msg").text("아이디를 입력해주세요.").css("color", "red");
		$("#user_id").focus();
		return false;
	} else if(!idRegExp.test(user_id)) {
		$("#userid_msg").empty();
		$("#userid_msg").text("4~12자 영어 또는 숫자로 입력하세요.").css("color", "red");
		$("#user_id").focus();
		return false;
	} else {
		$.ajax({
			url : "id_chk",
			data : {"user_id" : user_id},
			type : "POST",
			dataType : "json",
			success : function(result) {
				if(result == 0) {
					alert("사용가능한 아이디입니다.");
					$("#user_id").attr("readonly", "readonly");
					$("#btn_id_chk").css("background-color", "#66D37E");
					$("#id_chk_icon").removeClass();
					$("#id_chk_icon").addClass("fas fa-check");
					$("#btn_id_chk").removeAttr("onclick");
					$("#id_chk_validation").val("1");
				} else {
					alert("중복된 아이디입니다.");
					$("#user_id").val('');
					$("#user_id").focus();
				}
			}
		});
	}
}

function email_check() {
	// Email 유효성 검사
	var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var user_email = $("#user_email").val();
	
	if(user_email == '') {
		$("#email_msg").empty();
		$("#email_msg").text("이메일을 입력해주세요.").css("color", "red");
		$("#user_email").focus();
		return false;
	} else if(!emailRegExp.test(user_email)) {
		$("#email_msg").empty();
		$("#email_msg").text("이메일 형식이 올바르지 않습니다.").css("color", "red");
		$("#user_email").focus();
		return false;
	} else {
		$.ajax({
			url : "email_chk",
			data : {"user_email" : user_email},
			type : "POST",
			dataType : "json",
			success : function(result) {
				if(result == 0) {
					alert("사용가능한 이메일입니다.");
					$("#user_email").attr("readonly", "readonly");
					$("#btn_email_chk").css("background-color", "#66D37E");
					$("#email_chk_icon").removeClass();
					$("#email_chk_icon").addClass("fas fa-check");
					$("#btn_email_chk").removeAttr("onclick");
					$("#email_chk_validation").val("1");
				} else {
					alert("중복된 이메일입니다.");
					$("#user_email").focus();
				}
			}
		});
	}
}

$(function(){
	$("#user_pwd").keyup(function(){
		$("#password_msg").text("비밀번호 확인란을 입력해주세요").css("color", "orange");
	});
	
	$("#pwd_chk").keyup(function(){
		if($("#user_pwd").val() != $("#pwd_chk").val()) {
			$("#password_msg").empty();
			$("#password_msg").text("비밀번호가 일치하지 않습니다.").css("color", "red");
		} else {
			$("#password_msg").empty();
			$("#password_msg").text("비밀번호가 일치!").css("color", "green");
		}
	});
});

function join_chk() {
	// ID 유효성 검사
	var idRegExp = /^[a-z]+[a-z0-9]{4,12}$/g;
	// Email 유효성 검사
	var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// Password 유효성 검사
	var pwRegExp = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;
	// Name 유효성 검사
    var nameRegExp = /^[가-힣]{2,4}$/;
    var radio_chk = $("input[name=user_gender]:checked").val();
    
    if(!idRegExp.test($("#user_id").val())) {
    	$("#userid_msg").empty();
    	$("#userid_msg").text("4~12자 영어 또는 숫자로 입력하세요.").css("color", "red");
    	$("#user_id").focus();
    	return false;
    } else if(!emailRegExp.test($("#user_email").val())) {
    	$("#email_msg").empty();
    	$("#email_msg").text("이메일형식이 올바르지 않습니다.").css("color", "red");
    	$("#user_email").focus();
    	return false;
    }  else if(!nameRegExp.test($("#user_name").val())) {
    	$("#name_msg").empty();
    	$("#name_msg").text("이름을 입력해주세요.").css("color", "red");
    	$("#user_name").focus();
    	return false;
    } else if(!pwRegExp.test($("#user_pwd").val())) {
    	$("#password_msg").empty();
    	$("#password_msg").text("비밀번호는 8~16자 이내 영문,숫자,특수문자가 포함되어야합니다.").css("color", "red");
    	$("#user_pwd").focus();
    	return false;
    } else if(!pwRegExp.test($("#pwd_chk").val())) {
    	$("#password_chk_msg").empty();
    	$("#password_chk_msg").text("비밀번호는 8~16자 이내 영문,숫자,특수문자가 포함되어야합니다.").css("color", "red");
    	$("#pwd_chk").focus();
    	return false;
    } else if($("#user_pwd").val() != $("#pwd_chk").val()) {
    	$("#password_msg").empty();
    	$("#password_msg").text("비밀번호가 일치하지 않습니다.").css("color", "red");
    	$("#user_pwd").focus();
    	return false;
    } else if($("#user_radio").val() == "") {
    	$("#radio_msg").empty();
    	$("#radio_msg").text("휴대폰 번호를 입력해주세요.").css("color", "red");
    	$("#user_radio").focus();
    	return false;
    } else if(radio_chk == null) {
    	$("#gender_msg").empty();
    	$("#gender_msg").text("성별을 선택해주세요.").css("color", "red");
    	$("#user_gender").focus();
    	return false;
    } else if($("#user_job").val() == "") {
    	$("#job_msg").empty();
    	$("#job_msg").text("직업을 입력해주세요.").css("color", "red");
    	$("#user_job").focus();
    	return false;
    } else if($("#id_chk_validation").val() == "0") {
    	alert("아이디 중복확인을 진행해주세요.");
    	$("#user_id").focus();
    	return false;
    } else if($("#email_chk_validation").val() == "0") {
    	alert("이메일 중복확인을 진행해주세요.");
    	$("#user_email").focus();
    	return false;
    }
}

$(function(){
	$("#user_id").focusout(function(){
		$("#userid_msg").empty();
	});
	$("#user_email").focusout(function(){
		$("#email_msg").empty();
	});
	$("#user_pwd").focusout(function(){
		$("#password_msg").empty();
	});
	$("#pwd_chk").focusout(function(){
		$("#password_msg").empty();
		$("#password_chk_msg").empty();
	});
	$("#user_name").focusout(function(){
		$("#name_msg").empty();
	});
	$("#user_radio").focusout(function(){
		$("#radio_msg").empty();
	});
	$("#user_gender").focusout(function(){
		$("#gender_msg").empty();
	});
	$("#user_job").focusout(function(){
		$("#job_msg").empty();
	});
});

</script>

</head>
<body>
	<form action="join" method="post">
	<input type="hidden" id="id_chk_validation" value="0">
	<input type="hidden" id="email_chk_validation" value="0">
	<input type="hidden" id="user_status" name="user_status" value="0">
		<div class="container">		
			<div class="form-group">
				<label for="user_id">아이디</label>&nbsp;
				<span id="userid_msg"></span>
				<div class="input-group">
					<input type="text" class="form-control" id="user_id" name="user_id" placeholder="6~20자 영어 또는 숫자로 입력하세요.">
					<a class="input-group-addon" onclick="return id_check()" id="btn_id_chk" style="color:#fff; background-color:#f03246">
						<i class="fas fa-times" id="id_chk_icon"></i>
					</a>
				</div>
				<!-- <input type="text" class="form-control" id="user_id" name="user_id">
				<input type="button" value="중복확인" onclick="id_check()"> -->
			</div>
			<div class="form-group">
				<label for="user_email">이메일</label>&nbsp;
				<span id="email_msg"></span>
				<div class="input-group">
					<input type="text" class="form-control" id="user_email" name="user_email" placeholder="ex)example@gmail.com">
					<a class="input-group-addon" onclick="return email_check()" id="btn_email_chk" style="color:#fff; background-color:#f03246">
						<i class="fas fa-times" id="email_chk_icon"></i>
					</a>
				</div>
			</div>
			<div class="form-group">
				<label for="user_name">이름</label>&nbsp;
				<span id="name_msg"></span>
				<input type="text" class="form-control" id="user_name" name="user_name" placeholder="홍길동">
			</div>
			<div class="form-group">
				<label for="user_pwd">비밀번호</label>&nbsp;
				<span id="password_msg"></span>
				<input type="password" class="form-control" id="user_pwd" name="user_pwd" placeholder="특수문자 포함 8자이상 16자 이하로 입력하세요.">
			</div>
			<div class="form-group">
				<label for="password2">비밀번호 확인</label>&nbsp;
				<span id="password_chk_msg"></span>
				<input type="password" class="form-control" id="pwd_chk" placeholder="특수문자 포함 8자이상 16자 이하로 입력하세요.">
			</div>
			<div class="form-group">
				<label for="user_radio">연락처(무선)</label>&nbsp;
				<span id="radio_msg"></span>
				<input type="text" class="form-control" id="user_radio" name="user_radio" placeholder="010-0000-0000">
			</div>
			<div class="form-group">
				<label for="user_cable">연락처(유선)</label>&nbsp;
				<span id="cable_msg"></span>
				<input type="text" class="form-control" id="user_cable" name="user_cable" placeholder="02-000-0000">
			</div>

			<div class="form-group">
				<label for="user_gender">성별</label>&nbsp;
				<span id="gender_msg"></span>
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-primary">
						<input type="radio" id="man" autocomplete="off" value="m" name="user_gender">남자
					</label>
					<label class="btn btn-danger">
						<input type="radio" id="woman" autocomplete="off" value="g" name="user_gender">여자
					</label>
				</div>
			</div>
			<div class="form-group">
				<label for="user_job">직업</label>&nbsp;
				<span id="job_msg"></span>
				<input type="text" class="form-control" id="user_job" name="user_job" placeholder="개발자, 기획자, 서버 관리자 등등">
			</div>
			<button type="submit" class="btn btn-info" onclick="return join_chk()">회원가입</button>
		</div>
	</form>
</body>
</html>