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
$(function login() {

	$("#loginbtn").on("click",function(){
	
	
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
			$("#loginFrm").submit();
			location.href="/index";
		}
	})
})

$(function(){
	$("#user_id").focusout(function(){
		$("#userid_msg").empty();
	});
	$("#user_pwd").focusout(function(){
		$("#password_msg").empty();
	});

	$("#findInfoBtn").on("click",function(){
		location.href = "find_info"
	})
});

$(function() {
	var msg = "${msg}";
	console.log(msg);
	if(msg!="") {
		$("#alert").text(msg);
		$("#msg").show();
	}
});
</script>

</head>
<body>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">X</button>
    <h3 class="smaller lighter blue no-margin modal-title">로그인</h3>
</div>
 
<div class="modal-body">
<div class="alert alert-success alert-dismissible" id="msg" 
		style="display:none;">
    	<a href="#" class="close" data-dismiss="alert" 
    		aria-label="close">&times;</a>
    	<strong>서버 메시지 </strong><span id="alert"></span>
</div>
    <form id = "loginFrm" action="/project/login" method="post">
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
		<input type="hidden" name="_csrf" value="${_csrf.token}">
		<button class="btn btn-info" id="loginbtn" type="button">로그인</button>
		<button class="btn btn-success" type="button" id="findInfoBtn">아이디 / 비밀번호 찾기</button>
	</div>
	</form>
</div>
 
<div class="modal-footer">
    <button class="btn btn-sm btn-danger pull-right" data-dismiss="modal" id="btnClose">
        <i class="ace-icon fa fa-times"></i>닫기
    </button>
</div>
	
</body>
</html>