<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="resources/data-components/trip/trip_read.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7096ea5f9666571cfb87c2ec2957f892&libraries=services,clusterer,drawing"></script>

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
						<!-- <img src="assets/img/property/big.jpg" alt=""> -->
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
						<div id="content">
							${content}
						</div>
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
						<textarea placeholder="후기를 작성해주세요~"></textarea>
						<button class="site-btn1 sb-big1" id="comment_write">등록</button>
					</div>
					<div id="comments_list">
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-8 sidebar">
			<div class="agent-widget">
				<!-- <img src="assets/gh_img/unnamed.png" alt=""> -->
				<div class="aw-text">
					<h6 id="user_id"></h6>
					<h6 id="name"></h6>
					<a href="#" class="readmore-btn">블로그 or 카페 or SNS 링크</a>
				</div>
			</div>
				<!-- kakao 지도 api -->
				<div id="map" style="width:300px; height:400px"></div>
				<!-- 위도 경도 좌표 표시 <div id="coordXY"></div> -->
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

