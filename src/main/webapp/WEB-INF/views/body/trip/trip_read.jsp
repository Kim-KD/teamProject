<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
<script src="resources/ckeditor/ckeditor.js"></script>
<script>
$(function() {
	
	   // 자바객체 -> json -> 자바스크립트 객체
	   board = JSON.parse('${board}');
	   $("#update_btn").attr('href',"/guehamo/trip_update?no="+board.no+"&user_id="+board.user_id);
	   
	   $("#title").text(board.title);
	   $("#user_id").text(board.user_id);
	   $("#no").text(board.no);
	   $("#w_time").text(board.w_time);
	   $("#likes").text(board.likes);
	   $("#views").text(board.views);
	   
	   if(board.admission==null){
		   board.admission="";
		}
	   if(board.opentime==null){
		   board.opentime="";
		}
	   $("#admission").text(board.admission);
	   $("#opentime").text(board.opentime);
	   $("#content").html(board.content);
	   
	   // 초기화 - 버튼영역 감추기
	   $("#btn_area").hide();

	   if(isLogin===true && board.user_id===loginId) {
	      $("#title").prop("disabled", false);
	      $("#btn_area").show();
	      
	   } else if(isLogin===true && board.user_id!==loginId) {
	      $("#like_btn").prop("disabled", false);
	   }
	   
		// 게시글 삭제 확인 창 보여주기
		$('#delete_box_open').on('click', function(){
			$('#delete_box').modal('show');
		})

	// 게시글 삭제
	$("#delete_btn").on("click", function() {
		var param = {
			no : board.no,
			user_id : board.user_id,
			_csrf:"${_csrf.token}"
		}
		$.ajax({
			url: "/project/trip_delete",
			method: "post",
			data: param,
			success: function() {
				alert("게시글이 삭제되었습니다.");
				location.href = "/project/trip_list"
			},error(){
				alert("게시글을 삭제하는데 실패했습니다.");
			}
		})
	})

	// 게시글 추천
	$("#like_btn").on("click", function() {
		var param = {
			no : board.no,
			user_id : board.user_id,
			_csrf:"${_csrf.token}"
		}
		$.ajax({
			url: "/project/trip_like",
			method: "post",
			data: param,
			success: function(e) {
				if(e==true){
					$("#likes").text(board.likes+1);
					alert("게시글이 추천되었습니다.");
				}else if(e==null){
					alert("자신의 게시글에 추천할 수 없습니다.");
				}else{
					alert("이미 추천한 게시글 입니다.");
				}
			},error(){
				alert("게시글을 추천하는데 실패했습니다.");
			}
		})
	})
})
</script>
<style>
	#btn_area2{position:relative; left:38%;}
</style>
<!-- Single Property Section end -->
<section class="single-property-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="single-property">
				
					<div class="sp-image">
						<img src="assets/img/property/big.jpg" alt="">
						<div class="sp-badge new">New</div>
					</div>

					<div class="row" id="basic_info">
						<div class="col-lg-6">
							<div class="property-header" >
								<h4 id="create_input1"><span>입장료 : </span><span id="admission"></span></h4>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="property-header">
								<h4 id="create_input2"><span>운영 시간 : </span><span id="opentime"></span></h4>
							</div>
						</div>
					</div>
				<hr>
				<div class="property-text">
					<div id="create_input3">
						<h4 id="title"></h4>
						<p id="content"></p>
					</div>
				<div id="btn_area">
					<a href="javascript:void(0);" id="update_btn" type="button" class="btn btn-success">수정하기</a>
					<button id="delete_box_open" class="btn btn-danger">삭제하기</button>
				</div>
				<div id="btn_area2">
                  <button type="button" class="btn btn-primary" id="like_btn" disabled="disabled">
                     추천 <span class="badge" id="likes"></span>
                  </button>
                  <button type="button" class="btn btn-success" disabled="disabled">
                     조회 <span class="badge" id="views"></span>
                  </button>
                  </div> 
				</div>
			</div>
			<hr>
			<div class="loan-calculator">
				<h4>후기</h4>
				<div class="row">
					<div class="col-md-12">
						<div class="loan-cal-result">후기 내용</div>
					</div>
					<div class="col-md-12">
						<!-- <input type="text" placeholder="후기를 작성해주세요~" id="lc-price"> -->
						<textarea placeholder="후기를 작성해주세요~"></textarea>
					</div>						
					<div class="col-md-12">
						<div class="text-left text-sm-center">
							<button class="site-btn1 sb-big1" id="lc-submit">등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-8 sidebar">
			<div class="agent-widget">
				<img src="assets/gh_img/unnamed.png" alt="">
				<div class="aw-text">
					<h6 id="user_id"></h6>
					<a href="#" class="readmore-btn">블로그 or 카페 or SNS 링크</a>
				</div>
			</div>
			<div class="map-widget">
				<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d14376.077865872314!2d-73.879277264103!3d40.757667781624285!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sbd!4v1546528920522" style="border:0" allowfullscreen></iframe>
				</div>
			</div>
		</div>
	</div>
	
<!-- 게시글 삭제 Modal -->
<div id="delete_box" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">게시글 삭제</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
			</div>

			<div class="modal-body">
				<div class="container">
					<div class="form-group">
						<div id="select">
							<h6>정말 게시글을 삭제하시겠습니까?</h6>
						</div>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button id="delete_btn" class="btn btn-danger">삭제하기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
			</div>
		</div>
	</div>
</div>
<!-- 게시글 삭제 Modal End -->
</section>

<!--  Section end -->

