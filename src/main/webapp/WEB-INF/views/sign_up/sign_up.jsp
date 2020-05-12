<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
	function id_check() {
		var user_id = $("#user_id").val();
		if(user_id == null) {
			alert("아이디를 입력해주세요");
		} else {
			$.ajax({
				url : "id_chk",
				data : {"user_id" : user_id},
				type : "POST",
				dataType : "json",
				success : function(result) {
					if(result == 0) {
						alert("사용가능한 아이디입니다.");
					} else {
						alert("중복된 아이디입니다.");
					}
				}
			});
		}
	}
</script>

</head>
<body>
	<form action="join" method="post">
	<input type="hidden" name="user_status" value="0">
		<div class="container">
			<div class="form-group">
				<label for="user_id">아이디:</label>
				<input type="text" class="form-control" id="user_id" name="user_id">
				<input type="button" value="중복확인" onclick="id_check()">
				<span id="username_msg"></span>
			</div>
			<div class="form-group">
				<label for="user_email">이메일:</label>
				<input type="text" class="form-control" id="user_email" name="user_email">
				<span id="email_msg"></span>
			</div>
			<div class="form-group">
				<label for="user_name">이름:</label>
				<input type="text" class="form-control" id="user_name" name="user_name">
				<span id="irum_msg"></span>
			</div>
			<div class="form-group">
				<label for="user_pwd">비밀번호:</label>
				<input type="password" class="form-control" id="user_pwd" name="user_pwd">
				<span id="password_msg"></span>
			</div>
			<div class="form-group">
				<label for="password2">비밀번호 확인:</label>
				<input type="password" class="form-control" id="password2">
				<span id="password2_msg"></span>
			</div>
			<div class="form-group">
				<label for="user_radio">연락처(무선)</label>
				<input type="text" class="form-control" id="user_radio" name="user_radio">
				<span id="radio_msg"></span>
			</div>
			<div class="form-group">
				<label for="user_cable">연락처(유선)</label>
				<input type="text" class="form-control" id="user_cable" name="user_cable">
				<span id="cable_msg"></span>
			</div>

			<div class="form-group">
				<label for="user_gender">성별</label>
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-primary">
						<input type="radio" id="man" autocomplete="off" value="m" name="user_gender">남자
					</label>
					<label class="btn btn-danger">
						<input type="radio" id="girl" autocomplete="off" value="g" name="user_gender">여자
					</label> <span id="gender_msg"></span>
				</div>
			</div>
			<div class="form-group">
				<label for="user_job">직업</label>
				<input type="text" class="form-control" id="user_job" name="user_job">
				<span id="job_msg"></span>
			</div>

			<button class="btn btn-info">가입</button>
		</div>
	</form>
</body>
</html>