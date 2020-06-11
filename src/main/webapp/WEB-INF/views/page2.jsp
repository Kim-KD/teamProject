<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/other_header.jsp" %>

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
					
					<div class="property-info-bar">
						<div class="row">
							<div class="col-lg-7">
								<div class="pi-metas">
									<div class="pi-meta" onclick="return room_info(this,${gh_details.no})" id="room">도미토리룸</div>
									<div class="pi-meta" onclick="return room_info(this,${gh_details.no})" id="room">더블룸</div>
									<div class="pi-meta" onclick="return room_info(this,${gh_details.no})" id="room">트윈룸</div>
									
									<script>
										function room_info(room_data,no) {
											var room = $(room_data).text();
											var trTemplate = Handlebars.compile($('#roomListTemplate').text());
											/* var roomListBody = $('#room-list tbody'); */
											
											var roomList = $("#roomList");
											
											$.ajax({
												url : "room_info_data",
												type : "GET",
												data : {"room" : room, "no" : no},
												dataType : "json",
												success : function(data) {
													if(data == 0) {
														alert("등록된 정보가 없습니다.");
													} else {
														/* roomListBody.text(""); */
														roomList.text("");
														/* of -> 빨간줄 떠써 in으로 변경 */
														for (var record in data) {
															record.genderTitle = record.gender == 1 ? '여' : '남';
														}
														/* roomListBody.html(trTemplate({rooms: data})); */
														roomList.html(trTemplate({rooms: data}));
													}
												}
											});
										}
									</script>
									
								</div>
							</div>
							<div class="col-lg-5 text-left text-lg-right">
								<a href="#" class="offer-btn">예약 하기</a>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-lg-3">
							<div class="property-header" id="hroom">
								<h4 id="room">방</h4>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="property-header" id="hgender">
								<h4 id="gender">남 / 여</h4>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="property-header" id="hroom_people">
								<h4 id="room_people">인원(?/?)</h4>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="property-header" id="hprice">
								<h4 id="price">가격</h4>
							</div>
						</div>
					</div>
					<div class="row" id="roomList">
						
					</div>
					
					<!-- <div class="row">
						<style>
							table {
								width: 600px;
							}
						</style>
						<table id='room-list'>
							<thead>
								<tr>
									<th>방</th>
									<th>남 / 여</th>
									<th>인원(?/?)</th>
									<th>가격</th>
								</tr>
							</thead>
							
							<tbody>
							</tbody>
						</table>
					</div> -->
					
					<hr>
					<div class="property-text">
						<h4>${gh_details.title}</h4>
						<p>${gh_details.content}</p>
					</div>
					<hr>
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