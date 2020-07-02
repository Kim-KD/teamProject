<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<!-- Single Property Section end -->
<section class="single-property-section spad">
	<div class="container">
		<c:set var="user_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"/>
		<input type="hidden" id="user_id" name="user_id" value="${user_id}">		
		<input type="hidden" id="no" name="no" value="${gh_details.no}">
		<input type="hidden" id="views" name="views" value="${gh_details.views }">
		<input type="hidden" id="_csrf" name="_csrf" value="${_csrf.token}">
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
									<div class="pi-meta" onclick="return room_info(this)" id="room">도미토리룸</div>
									<div class="pi-meta" onclick="return room_info(this)" id="room">더블룸</div>
									<div class="pi-meta" onclick="return room_info(this)" id="room">트윈룸</div>
									
									<script>
										function room_info(room_data) {
											var _csrf = $("#_csrf").val();
											var room = $(room_data).text();
											var no = $("#no").val();
											var trTemplate = Handlebars.compile($('#roomListTemplate').text());
											/* var roomListBody = $('#room-list tbody'); */
											
											var roomList = $("#roomList");
											
											$.ajax({
												url : "room_info_data",
												type : "POST",
												data : {"room" : room, "no" : no, "_csrf" : _csrf},
												dataType : "json",
												success : function(data) {
													if(data == 0) {
														alert("등록된 정보가 없습니다.");
													} else {
														/* roomListBody.text(""); */
														roomList.text("");
														for (var record of data) {
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
						<c:if test="${gh_details.user_id == sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
							<a href="guest_house_modify?no=${gh_details.no}" class="btn px-4 btn-success text-white">수정</a>&nbsp;
							<a class="btn px-4 btn-danger text-white" onclick="border_Delete()">삭제</a>
						</c:if>
					</div>
					<hr>
					
					<script>
						function border_Delete() {
							var no = $("#no").val();
							var _csrf = $("#_csrf").val();
							
							$.ajax({
								url : "gh_delete",
								type : "POST",
								data : {"no" : no, "_csrf" : _csrf},
								dataType : "json",
								success : function(data) {
									console.log(data);
									if(data > 0) {
										alert("게시글이 삭제되었습니다.");
										location.href = "/project/guest_house_list"
									}
								}
							});
						}
					</script>
					
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
				<div class="loan-calculator">
					<h4>후기</h4>
					<div class="row" id="commentList">
						
					</div>
					<div class="row">
						<div class="col-md-12">
							<textarea name="content" id="content" placeholder="후기를 작성해주세요~"></textarea>
						</div>
						<div class="col-md-12">
							<div class="text-left text-sm-center">
								<button class="site-btn1 sb-big1" onclick="return comment_Add()">등록</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<script>
				Handlebars.registerHelper("isEqual", function(v1, v2) {
					return v1 == v2;
				});
				
				$(function(){
					getComment();
				});
				
				function getComment() {
					var no = $("#no").val();
					var viewList = Handlebars.compile($('#gh_view_comment').text());
					var commentList = $("#commentList");
					var _csrf = $("#_csrf").val();
					var user_id = $("#user_id").val();
					
					$.ajax({
						url : "gh_view_list",
						type : "POST",
						data : {"no" : no, "_csrf" : _csrf},
						dataType : "json",
						success : function(data) {
							if(data.length != 0) {
								commentList.html(viewList({commentList: data}));
								$("#commentList").removeAttr("style");
							} else {
								var html = "";
								html += "<div class='col-md-12'>";
								html += "<div class='loan-cal-result' style='text-align:center'>등록된 댓글이 없습니다.</div>";
								html += "</div>";
								$("#commentList").html(html);
							}
						}
					});
				}
				
				function comment_Add() {
					var no = $("#no").val();
					var content = $("#content").val();
					var user_id = $("#user_id").val();
					var _csrf = $("#_csrf").val();
					
					if(content == '') {
						alert("내용을 입력해주세요.");
					} else {
						$.ajax({
							url : "gh_view_insert",
							type : "POST",
							data : {"no" : no, "user_id" : user_id, "content" : content, "_csrf" : _csrf},
							dataType : "json",
							success : function(data) {
								if(data == 1) {
									alert("댓글이 등록되었습니다.");
									$("#content").val("");
									getComment();
								}
							}
						});
					}
				}
				
				function comment_Delete(re_no) {
					var no = $("#no").val();
					var user_id = $("#user_id").val();
					var _csrf = $("#_csrf").val();
					
					$.ajax({
						url : "gh_view_delete",
						type : "POST",
						data : {"no" : no, "re_no" : re_no, "user_id" : user_id, "_csrf" : _csrf},
						dataType : "json",
						success : function(data) {
							if(data == 1) {
								alert("댓글이 삭제되었습니다.");
								getComment();
							}
						}
					});
				}
				
				function comment_Modify_Form(re_no, comment) {
					var html = "";
					html += "<div id='formtest'>"
					html += "<form>"
					html += "<textarea id='re_comment' style='height:100px; border:solid 1px black; margin:0px' placeholder='내용을 입력해주세요.'>" + comment + "</textarea>";
					html += "<div style='text-align:center'>";
					html += "<a class='btn px-4 btn-success text-white' onclick='comment_Modify(" + re_no + ")'>등록</a>&nbsp";
					html += "<a class='btn px-4 btn-primary text-white' onclick='cancels(" + re_no + "," + comment + ")'>취소</a>";
					html += "</div>";
					html += "</form>";
					html += "</div>";
					$("#commentbtn"+re_no).css("display", "none");
					$("#comment"+re_no).html(html);
				}
				
				function cancels(re_no, comment) {
					var html = "";
					$("#formtest").remove();
					$("#commentbtn"+re_no).css("display", "");
					html += "<h6 id='comment" + re_no + "'>" + comment + "</h6>";
					$("#comment"+re_no).html(html);
				}
				
				function comment_Modify(re_no) {
					var no = $("#no").val();
					var content = $("#re_comment").val();
					var _csrf = $("#_csrf").val();
					
					if(content == '') {
						alert("내용을 입력해주세요.");
					} else {
						$.ajax({
							url : "gh_view_modify",
							type : "POST",
							data : {"no" : no, "re_no" : re_no, "content" : content, "_csrf" : _csrf},
							dataType : "json",
							success : function(data) {
								if(data == 1) {
									alert("댓글이 등록되었습니다.");
									$("#formtest").remove();
									getComment();
								}
							}
						});
					}
				}
				
			</script>
			<div class="col-lg-4 col-md-8 sidebar">
				<div class="agent-widget">
					<img src="assets/gh_img/unnamed.png" alt="">
					<div class="aw-text">
						<h4>${gh_details.user_name}</h4>
						<c:if test="${gh_details.name == null}">
							<h6>게스트하우스 이름 없음</h6>
						</c:if>
						<c:if test="${gh_details.name != null}">
							<h6>${gh_details.name}</h6>
						</c:if>
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

<script id="gh_view_comment" type="text/handlebars-template">
{{#each commentList}}
<div class="col-md-12">
	<div class="loan-cal-result">
		<h6 style="position: absolute;">작성자 : {{user_id}}</h6>
		{{#if (isEqual user_id '${user_id}')}}
			<div style="text-align: right" id="commentbtn{{re_no}}">
				<a class="btn px-4 btn-success text-white" onclick="comment_Modify_Form({{re_no}}, {{content}})">수정</a>&nbsp;
				<a class="btn px-4 btn-danger text-white" onclick="comment_Delete({{re_no}})">삭제</a>
			</div>
		{{/if}}
		<br><br>
		<h6 id="comment{{re_no}}">{{content}}</h6>
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