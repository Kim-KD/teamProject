<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
function login() {
	// ID 유효성 검사
	var idRegExp = /^[a-z]+[a-z0-9]{4,12}$/g;
	var user_id = $("#user_id").val();
	var user_pwd = $("#user_pwd").val();
	
	if(user_id == "") {
		$("#userid_msg").empty();
		$("#userid_msg").text("아이디를 입력해주세요.").css("color", "red");
		$("#user_id").focus();
		return false;
	} else if(!idRegExp.test($("#user_id").val())) {
		$("#userid_msg").empty();
		$("#userid_msg").text("4~12자 영어 또는 숫자로 입력하세요.").css("color", "red");
		$("#user_id").focus();
		return false;
	} else if(user_pwd == "") {
		$("#password_msg").empty();
		$("#password_msg").text("비밀번호를 입력해주세요.").css("color", "red");
		$("#user_pwd").focus();
		return false;
	} else {
		$.ajax({
			url : "login",
			data : {"user_id" : user_id, "user_pwd" : user_pwd, "${_csrf.parameterName}" : "${_csrf.token}"},
			type : "POST",
			dataType : "json",
			success : function(result) {
				if(result == 0) {
					alert("아이디 또는 비밀번호를 확인해주세요");
				} else {
					location.href = "index";
				}
			}
		});
	}
}

$(function(){
	$("#user_id").focusout(function(){
		$("#userid_msg").empty();
	});
	$("#user_pwd").focusout(function(){
		$("#password_msg").empty();
	});
});
</script>

</head>
<body>
	<div class="container">
		<div class="form-group">
			<label for="user_id">아이디</label>&nbsp;
			<span id="userid_msg"></span>
			<input type="text" class="form-control" id="user_id" name="user_id">
		</div>
		<div class="form-group">
			<label for="user_pwd">비밀번호</label>&nbsp;
			<span id="password_msg"></span>
			<input type="password" class="form-control" id="user_pwd" name="user_pwd">
		</div>
		<button class="btn btn-info" onclick="return login()">로그인</button>
	</div>
</body>
</html>