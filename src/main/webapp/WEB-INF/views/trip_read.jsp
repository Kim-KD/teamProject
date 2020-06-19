<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/other_header.jsp" %>

<script>

</script>

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

					<div class="row">
						<div class="col-lg-3">
							<div class="property-header" >
								<h4 id="title"><span>입장료 :</span></h4>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="property-header" id="hroom_people">
<!-- 								<h4 id="room_people">인원(?/?)</h4> -->
							</div>
						</div>
						<div class="col-lg-3">
							<div class="property-header" id="hgender">
								<h4><span id="open_time">운영 시간 :</span></h4>
							</div>
						</div>
<!-- 						<div class="col-lg-3"> -->
<!-- 							<div class="property-header" id="hprice"> -->
<!-- 								<h4 id="price">가격</h4> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
				<hr>
				<div class="property-text">
					<h4>${board.title}</h4>
					<p>${board.content}</p>
				</div>
				<div class="property-feature">
					<div class="row">
						<div class="col-6 col-sm-4 col-md-3 col-lg-2">
							<div class="pf-box">
								<h6>입실 시간</h6>
								<p>${gh_details.check_in}</p>
							</div>
						</div>
						<div class="col-6 col-sm-4 col-md-3 col-lg-2">
							<div class="pf-box">
								<h6>퇴실 시간</h6>
								<p>${gh_details.check_out}</p>
							</div>
						</div>
						<div class="col-6 col-sm-4 col-md-3 col-lg-2">
							<div class="pf-box">
								<h6>소등 시간</h6>
								<p>${gh_details.off_time}</p>
							</div>
						</div>
						<div class="col-6 col-sm-4 col-md-3 col-lg-2">
							<div class="pf-box">
								<h6>파티 메뉴</h6>
								<p>${gh_details.party_menu}</p>
							</div>
						</div>
						<div class="col-6 col-sm-4 col-md-3 col-lg-2">
							<div class="pf-box">
								<h6>파티 시간</h6>
								<p>${gh_details.party_time}</p>
							</div>
						</div>
						<div class="col-6 col-sm-4 col-md-3 col-lg-2">
							<div class="pf-box">
								<h6>술</h6>
								<p>${gh_details.alcohol}</p>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-6 col-sm-4 col-md-3 col-lg-3">
							<div class="pf-box">
								<h6>참여 인원(남)</h6>
								<p>${gh_details.join_man}명</p>
							</div>
						</div>
						<div class="col-6 col-sm-4 col-md-3 col-lg-3">
							<div class="pf-box">
								<h6>참여 인원(여)</h6>
								<p>${gh_details.join_girl}명</p>
							</div>
						</div>
						<div class="col-6 col-sm-4 col-md-3 col-lg-2">
							<div class="pf-box">
								<h6>주차장</h6>
								<p>${gh_details.parking}</p>
							</div>
						</div>
						
						<div class="col-6 col-sm-4 col-md-3 col-lg-2">
							<div class="pf-box">
								<h6>조식</h6>
								<p>${gh_details.morning}</p>
							</div>
						</div>
						<div class="col-6 col-sm-4 col-md-3 col-lg-2">
							<div class="pf-box">
								<h6>Wi-Fi</h6>
								<p>${gh_details.wifi}</p>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-6 col-lg-3">
							<div class="pf-box">
								<h6>반려동물 출입여부</h6>
								<p>${gh_details.pet}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="video-item">
				<img src="assets/img/video-img.jpg" alt="">
				<a href="https://www.youtube.com/watch?v=Sz_1tkcU0Co" class="video-play"><span class="i fa fa-play"></span></a>
			</div> -->
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
					<h4>${gh_details.user_name}</h4>
					<h6>게스트 하우스 이름</h6>
					<p>연락처 : ${gh_details.user_radio}</p>
					<p>이메일 : ${gh_details.user_email}</p>
					<p>주소 : ${gh_details.address}</p>
					<a href="#" class="readmore-btn">블로그 or 카페 or SNS 링크</a>
				</div>
			</div>
			<div class="map-widget">
				<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d14376.077865872314!2d-73.879277264103!3d40.757667781624285!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sbd!4v1546528920522" style="border:0" allowfullscreen></iframe>
				</div>
			</div>
		</div>
	</div>
</section>
<script id="roomListTemplate" type="text/handlebars-template">
{{#each rooms}}
	<div class="col-lg-3">
		<div class="property-header">
			<h4>{{room}}</h4>
		</div>
	</div>
	<div class="col-lg-3">
		<div class="property-header">
			<h4>{{genderTitle}}</h4>
		</div>
	</div>
	<div class="col-lg-3">
		<div class="property-header">
			<h4>{{room_people}}</h4>
		</div>
	</div>
	<div class="col-lg-3">
		<div class="property-header">
			<h4>{{price}}</h4>
		</div>
	</div>
{{/each}}
</script>
<!-- <tr>
  <td>{{room}}</td>
  <td>{{genderTitle}}</td>
  <td>{{room_people}}</td>
  <td>{{price}}</td>
</tr> -->
<!--  Section end -->

<%@include file="/WEB-INF/include/footer.jsp" %>