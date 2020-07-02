<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<script>

$(function() {
	
	/* 초기 화면 셋팅 start */
// 	//자바객체 -> json -> 자바스크립트 객체
// 	board = JSON.parse('${board}');
// 	$("#update_btn").attr('href',"/guehamo/trip_update?no="+board.no+"&user_id="+board.user_id);
	   
// 	$("#title").text(board.title);
// 	$("#name").text(board.name);
// 	$("#user_id").text(board.user_id);
// 	$("#no").text(board.no);
// 	$("#w_time").text(board.w_time);
// 	$("#likes").text(board.likes);
// 	$("#views").text(board.views);
	   
	if(${board.reserve_status}==0){
		$("#reserve_status").text("예약 취소");
	}
	else if(${board.reserve_status}==1){
		$("#reserve_status").text("예약 대기");
	}
	else if(${board.reserve_status}==2){
		$("#reserve_status").text("예약 완료");
	}
		
// 	$("#admission").text(board.admission);
// 	$("#opentime").text(board.opentime);
	   
// 	if(isLogin===true && board.user_id===loginId) {
// 		$("#title").prop("disabled", false);
// 	    $("#btn_area").show();
	      
// 	} else if(isLogin===true && board.user_id!==loginId) {
// 		$("#like_btn").prop("disabled", false);
// 	}
	/* 초기 화면 셋팅 end */
	
	// 예약 취소 확인 창 보여주기
	$('#cancel_box_open').on('click', function(){
		$('#cancel_box').modal('show');
	})

	// 예약 취소
	$("#cancel_btn").on("click", function() {
		var param = {
			rno : ${board.rno},
			user_id : "${board.user_id}",
			_csrf:"${_csrf.token}"
		}
		$.ajax({
			url: "reserve_cancel",
			method: "post",
			data: param,
			success: function() {
				alert("예약이 취소되었습니다.");
				location.href = "reserve_list"
			},error(){
				alert("예약을 취소하는데 실패했습니다.");
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
			<h2>예약 상세 정보</h2>
		</div>
			<div class="row" id="basic_info">
				<div class="col-lg-12">
					<div class="property-header" >
						<h4><span id="rno">예약 번호 : ${board.rno}</span>&nbsp;&nbsp;&nbsp;<span id="reserve_status"></span></h4>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="property-header" >
						<h4><span id="name">게스트 하우스 : ${board.name}</span>
						&nbsp;&nbsp;&nbsp;<a href="guest_house_read?no=${board.no}">게스트 하우스 정보 보기</a></h4>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="property-header" >
						<h4><span id="room">방 : ${board.room}</span></h4>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="property-header" >
						<h4><span id="check_in">체크인 : ${board.check_in}</span></h4>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="property-header">
						<h4><span id="check_out">체크아웃 : ${board.check_out}</span></h4>
					</div>
				</div>
			</div>
			<hr>
			<div class="row">
				<h2>예약자 정보</h2>
				<div class="col-lg-12">
					<div class="property-header" >
						<h4><span id="rno">이름 : ${user.user_name}</span></h4>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="property-header" >
						<h4><span id="name">이메일 : ${user.user_email}</span></h4>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="property-header" >
						<h4><span id="room">연락처 : ${user.user_radio}</span></h4>
					</div>
				</div>
			</div>
			<hr>
			<div class="loan-calculator">
				<h2>결제 정보</h2>
				<br>
				<div class="row" >
				<table class="table table-hover">
         <colgroup>
            <col width="30%">
            <col width="20%">
            <col width="20%">
            <col width="10%">
            <col width="20%">
         </colgroup>
         <thead>
            <tr>
               <th>게스트 하우스 이름</th>
               <th>예약한 방</th>
               <th>총 예약일</th>
               <th>인원</th>
               <th>결제 금액</th>
            </tr>
         </thead>
         <tbody>
            <tr>
           	   <td><a href="guest_house_read?no=${board.no}">${board.name}</a></td>
               <td>${board.room}</td>
               <td>${board.reserve_total}</td>
               <td>${board.personel}</td>
               <td>${board.pay}원</td>
            </tr>
         </tbody>
      </table>
		<div id="btn_area">
			<button type="button" class="btn btn-danger" id="cancel_box_open">예약 취소</button>
			<a href="reserve_list" type="button" class="btn btn-primary" id="list_btn">목록으로</a>
		</div>
				</div>
			</div>
		<div>
   </div>
</div>
			
<!-- 예약 취소 Modal -->
<div id="cancel_box" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">예약 취소</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
			</div>

			<div class="modal-body">
				<div class="container">
					<div class="form-group">
						<div id="select">
							<h6>정말 예약을 취소하시겠습니까?</h6>
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

