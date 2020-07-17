<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<script src="resources/data-components/service_center/notice_read.js"></script>

<style>
	#btn_area{position:relative; left:38%;}
</style>
<!-- Single Property Section end -->
<section class="blog-section spad">
	<div class="container">
		<div class="section-title">
			<h2>공지사항</h2>
		</div>
		
		<input type="hidden" id="no" value="${board.no}">
		<input type="hidden" id="user_id2" value="${board.admin_id}">
		
			<div class="row" id="basic_info">
				<div class="col-lg-12">
					<div class="property-header" >
						<h4>작성자 : <span id="user_id">${board.admin_id}</span></h4>
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
			</div>
			
			<hr>
			
	
		<div id="btn_area">
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href="notice_update?no=${board.no}" type="button" class="btn btn-success" id="update_btn">공지 수정</a>
				<button type="button" class="btn btn-danger" id="delete_box_open">공지 삭제</button>
			</sec:authorize>
			<a href="notice_list" type="button" class="btn btn-primary" id="list_btn">목록으로</a>
		</div>
		<div>
   </div>
</div>
			
<!-- 공지 삭제 Modal -->
<div id="delete_box" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">공지사항 삭제</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
			</div>

			<div class="modal-body">
				<div class="container">
					<div class="form-group">
						<div id="select">
							<h6>정말 공지사항을 삭제하시겠습니까?</h6>
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
<!-- 공지 삭제 Modal End -->
</section>

<!--  Section end -->

