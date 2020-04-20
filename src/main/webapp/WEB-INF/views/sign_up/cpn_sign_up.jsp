<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<form action="join" method="post">
<div class = "container">
	<div class="form-group">
      <label for="username">아이디:</label>
      <input type="text" class="form-control" id="username">
      <span id="username_msg"></span>
   </div>
   <div class="form-group">
      <label for="email">이메일:</label>
      <input type="text" class="form-control" id="email">
      <span id="email_msg"></span>
   </div>
   <div class="form-group">
      <label for="irum">이름:</label>
      <input type="text" class="form-control" id="irum">
      <span id="irum_msg"></span>
   </div>
   <div class="form-group">
      <label for="password">비밀번호:</label>
      <input type="password" class="form-control" id="password">
      <span id="password_msg"></span>
   </div>
   <div class="form-group">
      <label for="password2">비밀번호 확인:</label>
      <input type="password" class="form-control" id="password2">
      <span id="password2_msg"></span>
   </div>
   <div class="form-group">
      <label for="radio">연락처(무선)</label>
      <input type="text" class="form-control" id="radio">
      <span id="radio_msg"></span>
   </div>
   <div class="form-group">
      <label for="cable">연락처(유선)</label>
      <input type="text" class="form-control" id="cable">
      <span id="cable_msg"></span>
   </div>
   
<div class="form-group">
   <label for="gender">성별</label>
   <div class="btn-group" data-toggle="buttons">
    	<label class="btn btn-primary">
      <input type="radio" id="man" autocomplete="off" value="m">남자
      </label>
      
      <label class="btn btn-danger">
      <input type="radio" id="girl" autocomplete="off" value="g">여자
      </label>
      
      <span id="gender_msg"></span>
   </div>
</div>   
   <div class="form-group">
      <label for="job">직업</label>
      <input type="text" class="form-control" id="job">
      <span id="job_msg"></span>
   </div>
   <div class="form-group">
      <label for="service_num">사업자 번호</label>
      <input type="text" class="form-control" id="service_num">
      <span id="service_num_msg"></span>
   </div>
   <div class="form-group">
      <label for="bank">은행</label>
      <input type="text" class="form-control" id="bank">
      <span id="bank_msg"></span>
   </div>
   <div class="form-group">
      <label for="job">계좌번호</label>
      <input type="text" class="form-control" id="account">
      <span id="account_msg"></span>
   </div>
   
   
	<button class="btn btn-info">가입</button>
</div>
</form>
</body>
</html>