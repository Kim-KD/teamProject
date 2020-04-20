<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<title>Mondy | Real Estate HTML Template</title>
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
				<li><a href="index" class="active">Home</a></li>
				<li><a href="about_us">스탭 구인</a></li>
				<li><a href="page1">게스트 하우스</a></li>
				<li><a href="page2">메뉴3</a>	</li>
				<li><a href="page3">고객센터</a>
					<ul class="sub-menu">
						<li><a href="#">QnA</a></li>
						<li><a href="#">1:1 문의</a></li>
						<li><a href="#">신고하기</a></li>
					</ul>
				</li>
			</ul>
			<div class="header-right">
				<div class="user-panel">
					<a href="#" class="login">로그인</a>
					<a href="normal_or_cpn" class="register">회원가입</a>
				</div>
			</div>
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
	</section>
	<!-- Page top Section end -->