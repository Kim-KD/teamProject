<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>
<script>
$(function() {

	var pathname = document.location.pathname,
		url = pathname.substr(9)

	$('.main-menu').find('a[href="' + url + '"]').addClass('active');
	
	var msg = "${errorMsg}"
		if(msg != ""){
			$('#loginBox').modal('show');
			$('#user_id').val("${id}");
			alert(msg);
		}

	$("#pwdCheck").on("click", function() {
		$.ajax({
			url:"/project/check_pwd",
			data: $('#checkFrm').serialize(),
			method:"post",
			success:function(result) {
				location.href="/profile_read";
			}, error() {
				alert("비밀번호 확인에 실패했습니다.");
			}
		})
	})
	
	$("#logoutBtn").on("click", function() {
		var param = {
			_csrf:"${_csrf.token}"
		}
		$.ajax({
			url: "/project/logout",
			method: "post",
			data: param,
			success: function() {
				location.href = "/project";
			}
		})
	})
	
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
			}
		})
	
	/* 로그인 창 보여주기 */
	$('#login').on('click', function(){
		$('#loginBox').modal('show');
	})
	/* 비밀번호 확인 창 보여주기 */
	$('#profile_read').on('click', function(){
		$('#pwdCheckBox').modal('show');
	})
	/* 회원가입 일반,기업 창 보여주기 */
	$('#sign_up').on('click', function(){
		$('#selectBox').modal('show');
	})

	$("#user_id").focusout(function(){
		$("#userid_msg").empty();
	})
	
	$("#user_pwd").focusout(function(){
		$("#password_msg").empty();
	})

	$("#findInfoBtn").on("click",function(){
		location.href = "find_info"
	})
	
})
</script>
<head>
	<title>게하모 | 게스트 하우스의 모든 것</title>
	<meta charset="UTF-8">
	<meta name="description" content="Real estate HTML Template">
	<meta name="keywords" content="real estate, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- Favicon -->
	<link href="assets/img/favicon.ico" rel="shortcut icon"/>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Lato:400,400i,700,700i,900%7cRoboto:400,400i,500,500i,700,700i&display=swap" rel="stylesheet">
	<!-- 폰트어썸 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

 
	<!-- Stylesheets -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
	<link rel="stylesheet" href="assets/css/slicknav.min.css" />

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="assets/css/style.css"/>


	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
	<script>
		$(function() {
			$("#logoutBtn").on("click", function() {
				var param = {
					_csrf:"${_csrf.token}"
				}
				$.ajax({
					url: "/project/logout",
					method: "post",
					data: param,
					success: function() {
						location.href = "/project";
					}
				})
			})
		})
	</script>

</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section -->
	<header class="header-section header-bg-2">
		<a href="index" class="site-logo">
			<img src="assets/img/logo.png" alt="">
		</a>
		<nav class="header-nav">
			<ul class="main-menu">
				<li><a href="index">Home</a></li>
				<li><a href="about_us">스탭 구인</a></li>
				<li><a href="page1">게스트 하우스</a></li>
				<li><a href="trip">관광 명소</a></li>
				<li><a href="page2">메뉴3</a>	</li>
				<li><a href="write_page">글작성</a></li>
				<li><a href="page3">고객센터</a>
					<ul class="sub-menu">
						<li><a href="#">QnA</a></li>
						<li><a href="#">1:1 문의</a></li>
						<li><a href="#">신고하기</a></li>
					</ul>
				</li>
			</ul>
			<sec:authorize access="isAuthenticated()">
		<div class="header-right">
				<ul class="main-menu">
					<c:set var="loginId" 
value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"></c:set>
					<li><a href="#" id="profile_read" data-toggle="modal">${loginId}님 환영합니다.</a>
					<ul class="sub-menu">
						<li><a href="#">내정보 보기</a></li>
					</ul>
					</li>
<!-- 						<a href="write_page">글 작성</a> -->
					<li><a href="#" id="logoutBtn" class="register">로그아웃</a></li>
				</ul>
			</div>
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<div class="header-right">
				<div class="user-panel">
					<a href="#" class="login" id="login" data-toggle="modal">로그인</a>
					<a href="#" class="register" id="sign_up" data-toggle="modal">회원가입</a>
				</div>
			</div>
	</sec:authorize>
		</nav>
	</header>
	<!-- Header Section end -->

	<!-- Page top Section end -->
	<section class="page-top-section set-bg" data-setbg="assets/img/page-top-bg.jpg">
		<div class="page-top-warp">
			<form class="main-search-form">
			<!-- 검색 타입 -->
			<!-- <div class="search-type">
				<div class="st-item">
						<input type="radio" name="st" id="buy" checked>
						<label for="buy">검색1</label>
					</div>
					<div class="st-item">
						<input type="radio" name="st" id="rent">
						<label for="rent">검색2</label>
					</div>
					<div class="st-item">
						<input type="radio" name="st" id="sell">
						<label for="sell">검색3</label>
					</div>
					<div class="st-item">
						<input type="radio" name="st" id="property">
						<label for="property">검색4</label>
					</div>
					<div class="st-item">
						<input type="radio" name="st" id="agents">
						<label for="agents">검색5</label>
					</div>
				</div> -->
				<div class="search-input si-v-2">
					<input type="text" placeholder="게이루 게스트 하우스 검색">
					<button class="site-btn" type="submit">검색</button>
					<button class="site-btn sb-light">상세 검색</button>
				</div>
				<!-- <p>게이루 게스트 하우스 검색 설명 </p> -->
			</form>
		</div>
		
<!-- 로그인 Modal -->
<div id="loginBox" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<h4 class="modal-title" id="myModalLabel">로그인</h4>
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">X</span></button>
</div>

<div class="modal-body">
<form id = "loginFrm" action="/project/login" method="post">
	<div class="container">
		<div class="form-group">
			<label for="user_id">아이디</label>&nbsp;
			<span id="userid_msg"></span>
			<input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디를 입력하세요.">
		</div>
		<div class="form-group">
			<label for="user_pwd">비밀번호</label>&nbsp;
			<span id="password_msg"></span>
			<input type="password" class="form-control" id="user_pwd" name="user_pwd" placeholder="비밀번호를 입력하세요.">
		</div>
		<input type="hidden" name="_csrf" value="${_csrf.token}">
		<button class="btn btn-info" id="loginbtn" type="button">로그인</button>
		<button class="btn btn-success" type="button" id="findInfoBtn">아이디 / 비밀번호 찾기</button>
	</div>
</form>
</div>

<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
</div>
</div>
</div>
</div>
<!-- 로그인 Modal end -->

<!-- 비밀번호 Modal -->
<div id="pwdCheckBox" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<h4 class="modal-title" id="myModalLabel">비밀번호 확인</h4>
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">X</span></button>
</div>

<div class="modal-body">
<form id="checkFrm">
	<div class="container">
		<div class="form-group">
			<label for="user_pwd">비밀번호</label>
			<input type="password" name="user_pwd" id="user_pwd" class="form-control" placeholder="비밀번호를 입력하세요.">
			<input type="hidden" name="_csrf" value="${_csrf.token}">
		</div>
		<button type="button" class="btn btn-success" id="pwdCheck">확인</button>
	</div>
</form>
</div>

<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
</div>
</div>
</div>
</div>
<!-- 비밀번호 Modal end -->

<!-- 일반,기업회원 선택 Modal -->
<div id="selectBox" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<h4 class="modal-title" id="myModalLabel">비밀번호 확인</h4>
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">X</span></button>
</div>

<div class="modal-body">
	<div class="container">
		<div class="form-group">
			<div id = "select">
			<a href ="sign_up"><button class="btn btn-info">일반 회원</button></a>
			<a href ="cpn_sign_up"><button class="btn btn-success">기업 회원</button></a>
			</div>
		</div>
	</div>
</div>

<div class="modal-footer">
<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
</div>
</div>
</div>
</div>
<!-- 일반,기업회원 선택 Modal end -->		
</section>
<!-- Page top Section end -->