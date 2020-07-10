<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="UTF-8">

<style>
#main-content{padding: 100px}
#passwordArea > span{margin-right: auto; margin-left: auto; display: block}
</style>
<script src="resources/data-components/admin/user_read.js"></script>
<!--main content start-->
<section id="main-content">
	<section class="wrapper site-min-height">
<div class="container">
	<div class="row">
		<div class="col-sm-10 col-sm-offset-1 profiel-container">
		<div class="profile-header">
			<h3>
				<b>회원 정보</b><br> <small>회원 정보 관리</small>
			</h3>
			<br>
			<br>
		</div>
	<table class="table table-hover" id="user">
		<tr>
			<td class="first">이름</td><td colspan="2"><span id="user_name">${user.user_name}</span></td>
		</tr>
		<tr>
			<td class="first">성별</td><td colspan="2">
			<span id="user_gender">
			<c:if test="${user.user_gender=='m'}">남자</c:if>
			<c:if test="${user.user_gender=='g'}">여자</c:if>
			</span></td>
		</tr>
		<tr>
			<td class="first">직업</td><td colspan="2"><span id="user_job">${user.user_job}</span></td>
		</tr>
		<tr>
			<td class="first">회원 구분</td><td colspan="2">
			<span id="user_status">
			<c:if test="${user.user_status=='0'}">일반회원</c:if>
			<c:if test="${user.user_status=='1'}">기업회원</c:if>
			</span>
			</td>
		</tr>
		<tr><td class="first">연락처</td>
			<td colspan="2">
				<span>무선 전화 : </span><span id="user_radio">${user.user_radio}</span>
				<small id="radio_msg"></small><br><br>
				<span>유선 전화 : </span><span id="user_cable">${user.user_cable}</span>
				<small id="cable_msg"></small>
		</td></tr>
		<tr>
			<td class="first">아이디</td><td colspan="2">
			<span id="user_id">${user.user_id}</span></td>
		</tr>
		<tr><td class="first">E-mail</td>
		<td colspan="2">
			<span id="user_email">${user.user_email}</span>
		</td></tr>
		<tr>
			<td class="first">가입일</td><td colspan="2">
			<span id="user_create_day">${user.user_create_day}</span></td>
		</tr>
		<tr>
			<td class="first">계정 상태</td><td colspan="2">
			<select id="selectEnabled">
				<option selected="selected">상태 변경</option>
				<option value="0">비활성화</option>
				<option value="1">활성화</option>
			</select>
			</td>
		</tr>
		<tbody id="cpn_info">
		<tr>
			<td class="first">사업자 번호 </td>
			<td colspan="2">
			<span id="cpn_service_num">${user.cpn_service_num}</span>
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
		<br> <button type="button" class="btn btn-success" id="update">수정하기</button>
			<a href="javascript:void(0);" type="button" class="btn btn-finish btn-primary" id="back">목록으로</a>
	</div>
	</div>
	</div>
	</div>
</section>
</section>
