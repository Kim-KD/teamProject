<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<script src="resources/data-components/admin/inquiry_read.js"></script>

<style>
	#btn_area{position:relative; left:38%;}
</style>

<!-- Single Property Section end -->
<section class="blog-section spad">
	<div class="container">
		<div class="section-title">
			<h2>문의 정보</h2>
		</div>
			<div class="row" id="basic_info">
				<div class="col-lg-12">
					<div class="property-header" >
						<h4><span id="user_id">작성자 : ${board.user_id}</span></h4>
						<input type="hidden" id="no" value="${board.no}">
					</div>
				</div>
				<div class="col-lg-12">
					<div class="property-header" >
						<h4><span id="name">제목 : ${board.title}</span></h4>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="property-header" >
						<h4><span id="room">내용 : ${board.content}</span></h4>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="property-header" >
						<h4><span id="inquiry_status">
						<c:if test="${board.inquiry_status==0}">진행 상태 : 답변대기</c:if>
						<c:if test="${board.inquiry_status==1}">진행 상태 : 답변완료</c:if>
						</span></h4>
					</div>
				</div>
			</div>
			
			<hr>
			
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<c:if test="${board.inquiry_status==0}">
				<h2>답변하기</h2>
				<div class="row" id="basic_info">
					<div class="col-lg-12">
						<textarea id="answer"></textarea>
					</div>
				</div>
				
				<div id="btn_area">
					<a href="#" type="button" class="btn btn-success" id="answer_btn">답변하기</a>
					<a href="wait_list" type="button" class="btn btn-primary" id="list_btn">목록으로</a>
				</div>
			</c:if>
			<c:if test="${board.inquiry_status==1}">
				<h2>답변</h2>
				<div class="row" id="basic_info">
					<div class="col-lg-12">
						<p>${board.answer}</p>
					</div>
				</div>
				
				<div id="btn_area">
					<a href="#" type="button" class="btn btn-success" id="answer_update_btn">답변 수정</a>
					<a href="success_list" type="button" class="btn btn-primary" id="list_btn">목록으로</a>
				</div>
			</c:if>
        </sec:authorize>
		<div>
   </div>
</div>
</section>
<!--  Section end -->

