<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<script src="resources/ckeditor/ckeditor.js"></script>
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
		
		<input type="hidden" id="no" value="${board.no}">
		<input type="hidden" id="inquiry_status_val" value="${board.inquiry_status}">
		
			<div class="row" id="basic_info">
				<div class="col-lg-12">
					<div class="property-header" >
						<h4><span id="user_id">작성자 : ${board.user_id}</span></h4>
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
						<textarea id="answer" name="answer" style="width:100%;height:100;border:1;overflow:visible;text-overflow:ellipsis;"></textarea>
					</div>
				</div>
			</c:if>
			<c:if test="${board.inquiry_status==1}">
				<h2>답변</h2>
				<div class="row" id="basic_info">
					<div id="answer_area" class="col-lg-12">
						${board.answer}
					</div>
				</div>
			</c:if>
        </sec:authorize>
        <hr>
        
        	<div id="btn_area">
				<button class="btn btn-success" id="answer_update_btn">답변 수정</button>
				<a href="wait_list" type="button" class="btn btn-primary">대기 목록</a>
				<a href="success_list" type="button" class="btn btn-primary">완료 목록</a>
			</div>
		<div>
   </div>
</div>
</section>
<!--  Section end -->

