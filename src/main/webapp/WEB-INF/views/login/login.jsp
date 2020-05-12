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
		var user_id = $("#user_id").val();
		var user_pwd = $("#user_pwd").val();
		
		$.ajax({
			url : "login",
			data : {"user_id" : user_id, "user_pwd" : user_pwd},
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
</script>

</head>
<body>
	<div class="container">
		<div class="form-group">
			<label for="user_id">아이디:</label>
			<input type="text" class="form-control" id="user_id" name="user_id">
			<span id="username_msg"></span>
		</div>
		<div class="form-group">
			<label for="user_pwd">비밀번호:</label>
			<input type="password" class="form-control" id="user_pwd" name="user_pwd">
			<span id="password_msg"></span>
		</div>
		<button class="btn btn-info" onclick="login()">로그인</button>
	</div>
</body>
</html>