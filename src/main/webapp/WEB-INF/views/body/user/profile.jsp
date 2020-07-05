<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/other_header.jsp"%>
<meta charset="UTF-8">

<style>
#main-content{padding: 100px}
#passwordArea > span{margin-right: auto; margin-left: auto; display: block}
</style>
<script src="resources/data-components/user/profile.js"></script>
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
<div class="container">
	<div class="row">
		<div class="col-sm-10 col-sm-offset-1 profiel-container">
		<div class="profiel-header">
			<h3>
				<b>회원 정보</b><br> <small>내 정보를 보고 수정할 수 있습니다.</small>
			</h3>
			<br>
			<br>
		</div>
	<form id="updateFrm">
	<table class="table table-hover" id="user">
		<tr>
			<td class="first">이름</td><td colspan="2"><span id="user_name"></span></td>
		</tr>
		<tr>
			<td class="first">성별</td><td colspan="2"><span id="user_gender"></span></td>
		</tr>
		<tr>
			<td class="first">직업</td><td colspan="2"><span id="user_job"></span></td>
		</tr>
		<tr>
			<td class="first">회원 구분</td><td colspan="2"><span id="user_status2"></span>
			<input type="hidden" id="user_status" name="user_status"></td>
		</tr>
		<tr><td class="first">연락처</td>
			<td colspan="2">
				<span>무선 전화 : </span><input type="text" id="user_radio" name="user_radio" placeholder="'-'를 빼고 입력해주세요">
				<small id="radio_msg"></small><br><br>
				<span>유선 전화 : </span><input type="text" id="user_cable" name="user_cable" placeholder="'-'를 빼고 입력해주세요">
				<small id="cable_msg"></small>
		</td></tr>
		<tr>
			<td class="first">아이디</td><td colspan="2"><span id="user_id"></span></td>
		</tr>
		<tr><td class="first">E-mail</td>
		<td colspan="2">
			<input type="text" name="email1" id="email1">&nbsp;@&nbsp;<input type="text" name="email2" id="email2">&nbsp;&nbsp;
			<select id="selectEmail">
				<option selected="selected">직접 입력</option>
				<option>naver.com</option>
				<option>daum.net</option>
				<option>gmail.com</option>
			</select><br>
			<small id="email_msg"></small>
		</td></tr>
		<tr><td class="first">비밀번호</td>
		<td colspan="2">
			<div id="passwordArea">
				<span>새 비밀번호</span><input type="password" id="user_pwd" name="user_pwd">
				<small id="pwd_msg"></small><br><br>
				<span>새 비밀번호 확인 </span><input type="password" id="pwd_check" name="pwd_check">
				<small id="pwd_check_msg"></small>
			</div>
		</td></tr>
		<tr>
			<td class="first">가입일</td><td colspan="2"><span id="user_create_day"></span></td>
		</tr>
		<tr>
			<td class="first">계정 상태</td><td colspan="2"><span id="enabled2"></span>
			<input type="hidden" id="enabled" name="enabled"></td>
		</tr>
		<tbody id="cpn_info">
		<tr>
			<td class="first">사업자 번호 </td>
			<td colspan="2">
			<input type="text" id="cpn_service_num" name="cpn_service_num">
			<small id="svc_msg"></small>
			</td>
		</tr>
		<tr><td class="first">계좌 정보</td>
		<td colspan="2">
			<select id="selectBank">
				<option selected="selected">직접 입력</option>
				<option>우리은행</option>
				<option>국민은행</option>
				<option>농협은행</option>
				<option>기업은행</option>
			</select>&nbsp;&nbsp;<input type="text" name="cpn_bank" id="cpn_bank">&nbsp;&nbsp;<input type="text" name="cpn_account" id="cpn_account">
			<small id="bank_msg"></small>
		</td></tr>
		</tbody>
	</table>
	<hr>
	<div class="col-sm-5 col-sm-offset-1">
	<input type="hidden" name="_csrf" value="${_csrf.token}">
		<br> <button type="button" class="btn btn-success" id = "update">수정하기</button>
			<a href="index" type="button" class="btn btn-finish btn-primary" id = "cansel">취소하기</a>
	</div>
	</form>
	</div>
	</div>
	</div>
</section>
</section>
<%@include file="/WEB-INF/include/footer.jsp"%>