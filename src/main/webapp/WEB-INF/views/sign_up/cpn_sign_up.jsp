<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<form action="join" method="post">
	<input type="hidden" name="user_status" value="1">
	<input type="hidden" name="user_job" value="게스트 하우스 사장님">
		<div class="container">
			<div class="form-group">
				<label for="user_id">아이디:</label>
				<input type="text" class="form-control" id="user_id" name="user_id">
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
				<label for="cpn_service_num">사업자 번호</label>
				<input type="text" class="form-control" id="cpn_service_num" name="cpn_service_num">
				<span id="service_num_msg"></span>
			</div>
			<div class="form-group">
				<label for="cpn_bank">은행</label>
				<input type="text" class="form-control" id="cpn_bank" name="cpn_bank">
				<span id="bank_msg"></span>
			</div>
			<div class="form-group">
				<label for="cpn_account">계좌번호</label>
				<input type="text" class="form-control" id="cpn_account" name="cpn_account">
				<span id="account_msg"></span>
			</div>
			
			<button class="btn btn-info">가입</button>
		</div>
	</form>
</body>
</html>