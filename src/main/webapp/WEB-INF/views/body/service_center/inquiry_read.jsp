<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<script>

$(function() {
	
	// 문의 취소 확인 창 보여주기
	$('#cancel_box_open').on('click', function(){
		$('#cancel_box').modal('show');
	})

	// 예약 취소
	$("#cancel_btn").on("click", function() {
		var param = {
			no : ${board.no},
			user_id : "${board.user_id}",
			_csrf:"${_csrf.token}"
		}
		$.ajax({
			url: "inquiry_cancel",
			method: "post",
			data: param,
			success: function() {
				alert("문의가 취소되었습니다.");
				location.href = "inquiry_list"
			},error(){
				alert("문의 취소하는데 실패했습니다.");
			}
		})
	})
})
</script>
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
						<h4><span id="inquiry_status">진행 상태 : ${board.inquiry_status}</span></h4>
					</div>
				</div>
			</div>
			<hr>
		<div id="btn_area">
			<button type="button" class="btn btn-danger" id="cancel_box_open">문의 취소</button>
			<a href="inquiry_list" type="button" class="btn btn-primary" id="list_btn">목록으로</a>
		</div>
		<div>
   </div>
</div>
			
<!-- 예약 취소 Modal -->
<div id="cancel_box" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">문의 취소</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
			</div>

			<div class="modal-body">
				<div class="container">
					<div class="form-group">
						<div id="select">
							<h6>정말 문의를 취소하시겠습니까?</h6>
						</div>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button id="cancel_btn" class="btn btn-danger">취소하기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 게시글 삭제 Modal End -->
</section>

<!--  Section end -->

