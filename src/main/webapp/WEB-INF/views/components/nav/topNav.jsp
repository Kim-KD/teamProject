<%@ page import="org.springframework.util.ObjectUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

	<div id="preloder">
		<div class="loader"></div>
	</div>

	<header class="header-section">
		<a href="index" class="site-logo"> <img src="assets/img/title2.png" alt="">
		</a>
		<nav class="header-nav">
			<ul id="main_menu" class="main-menu">
				<li><a href="/index" class="active">Home</a></li>
				<li><a href="about_us">스탭 구인</a></li>
				<li><a href="page1">게스트 하우스</a></li>
				<li><a href="trip_list">관광 명소</a></li>
				<li><a href="page2">메뉴3</a></li>
				<li><a href="page3">고객센터</a>
					<ul class="sub-menu">
						<li><a href="#">QnA</a></li>
						<li><a href="#">1:1 문의</a></li>
						<li><a href="#">신고하기</a></li>
					</ul></li>
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
						<li>
							<a href="#" id="logoutBtn" class="register">로그아웃</a>
						</li>
					</ul>
				</div>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
				<div class="header-right">
					<div class="user-panel">
						<a href="login" class="login" id="login">로그인</a> 
						<a href="#" class="register" id="sign_up" data-toggle="modal">회원가입</a>
					</div>
				</div>
			</sec:authorize>
		</nav>
	</header>
	<section class="hero-section set-bg" data-setbg="assets/img/1.jpg">
		<div class="container">
			<div class="hero-warp">
				<form class="main-search-form">
					<div class="search-input">
						<input type="text" placeholder="게하모 검색">
						<button class="site-btn">검색</button>
						<button class="site-btn sb-light">상세 검색</button>
					</div>
				</form>
			</div>
		</div>

		<!-- 비밀번호 Modal -->
		<div id="pwdCheckBox" class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">비밀번호 확인</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">X</span>
						</button>
					</div>

					<div class="modal-body">
						<form id="checkFrm">
							<div class="container">
								<div class="form-group">
									<label for="user_pwd">비밀번호</label> <input type="password"
										name="user_pwd" id="user_pwd" class="form-control"
										placeholder="비밀번호를 입력하세요."> <input type="hidden"
										name="_csrf" value="${_csrf.token}">
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
		<div id="selectBox" class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">회원가입</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">X</span>
						</button>
					</div>

					<div class="modal-body">
						<div class="container">
							<div class="form-group">
								<div id="select">
									<a href="sign_up">
										<button class="btn btn-info">일반회원</button>
									</a> 
									<a href="cpn_sign_up">
										<button class="btn btn-success">기업회원</button>
									</a>
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
	</section>