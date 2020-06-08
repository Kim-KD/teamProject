<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
$(function() {
	$("#check").on("click", function() {
		$("#checkForm").submit();
	});
})

// function ajaxPwdCheck() {
// 	$.ajax({
// 		url: "/project/pwd_chk",
// 		data: "user_pwd=" + $("#user_pwd").val(),
// 		method: "post",
// 		success:function(result){
// 			if(result==0){
// 				$("#email_msg").text("비밀번호를 확인해주세요.").css({"color":"red", "font-size":"0.75em"});
// 				return true;
// 			}else if(result==1){
// 				$("#email_msg").text("비밀번호가 확인되었습니다.").css({"color":"green", "font-size":"0.75em"});
// 				return false;
// 			}
// 		}
// 	})
// }
</script>
</head>
<body>
	<p class="flow-text">비밀번호 확인</p>
	<form action="/project/check_pwd" method="post" id="checkForm">
		<div class="form-group">
			<input type="password" name="user_pwd" id="user_pwd" class="form-control">
			<input type="hidden" name="_csrf" value="${_csrf.token}">
		</div>
		<button type="button" class="btn btn-success" id="check">확인</button>
	</form>
</body>
</html>