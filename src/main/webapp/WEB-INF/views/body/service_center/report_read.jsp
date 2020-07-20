<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<sec:authorize access="isAuthenticated()">
   <script>
      var isLogin = true;
      var loginId = "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"
   </script>
</sec:authorize>
<sec:authorize access="isAnonymous()">
   <script>
      var isLogin = false;
      var loginId = undefined;
   </script>
</sec:authorize>

<script src="resources/data-components/service_center/report_read.js"></script>

<style>
	#btn_area{position:relative; left:38%;}
</style>
<!-- Single Property Section end -->
<section class="blog-section spad">
	<div class="container">
		<div class="section-title">
			<h2>신고 정보</h2>
		</div>
		
		<input type="hidden" id="no" value="${board.no}">
		<input type="hidden" id="user_id2" value="${board.user_id}">
		<input type="hidden" id="report_status2" value="${board.report_status}">
		
			<div class="row" id="basic_info">
				<div class="col-lg-12">
					<div class="property-header" >
						<h4>작성자 : <span id="user_id">${board.user_id}</span></h4>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="property-header" >
						<h4>제목 : <span id="name">${board.title}</span></h4>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="property-header" >
						<h4>내용 : <span id="room">${board.content}</span></h4>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="property-header" >
						<h4>진행 상태 : <span id="report_status">
						<c:if test="${board.report_status==0}">답변대기</c:if>
						<c:if test="${board.report_status==1}">답변완료</c:if>
						</span></h4>
					</div>
				</div>
			</div>
			
			<hr>
			
			<c:if test="${board.report_status==1}">
				<h2>답변</h2>
				<div class="row" id="basic_info">
					<div class="col-lg-12">
						<p>${board.answer}</p>
					</div>
				</div>
			</c:if>
			
		<div id="btn_area">
			<a href="report_update?no=${board.no}&user_id=${board.user_id}" type="button" class="btn btn-success" id="update_btn">글 수정</a>
			<button type="button" class="btn btn-danger" id="delete_box_open">글 삭제</button>
			<a href="report_list" type="button" class="btn btn-primary" id="list_btn">목록으로</a>
		</div>
		<div>
   </div>
</div>
			
<!-- 신고 취소 Modal -->
<div id="delete_box" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">신고 글 삭제</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
			</div>

			<div class="modal-body">
				<div class="container">
					<div class="form-group">
						<div id="select">
							<h6>정말 신고 글을 삭제하시겠습니까?</h6>
						</div>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button id="delete_btn" class="btn btn-danger">삭제하기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 신고 삭제 Modal End -->
</section>

<!--  Section end -->

