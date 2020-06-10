<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/other_header.jsp" %>

<!-- Contact Section end -->
<section class="contact-section">
    <div class="container">
        <form class="contact-form" action="write" method="post" enctype="multipart/form-data">
        <input type="hidden" name="user_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        
        <input type="hidden" name="postcode" value="0000">
        <input type="hidden" name="party_day" value="00-00">
        
            <div class="row">
                <span class="col-sm-2 control-label">제목</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="title" placeholder="제목"> 
                </div>

                <span class="col-sm-2 control-label">지역주소</span>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="city" placeholder="지역주소">
                </div>

                <span class="col-sm-2 control-label">상세주소</span>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="address" placeholder="상세주소">
                </div>

                <span class="col-sm-2 control-label">방</span>
                <div class="col-sm-4" id="sroom">
                	<input type="hidden" id="room_status" name="room_status" value="0">
                    <select class="form-control selectbox" id="room" name="room">
                    	<option>===선택===</option>
                        <option value="도미토리룸">도미토리룸</option>
                        <option value="더블룸">더블룸</option>
                        <option value="트윈룸">트윈룸</option>
                    </select>
                </div>

                <span class="col-sm-2 control-label">방구분(남/여)</span>
                <div class="col-sm-4" id="sgender">
                    <select class="form-control selectbox" id="gender" name="gender">
                    	<option>===선택===</option>
                        <option value="0">남</option>
                        <option value="1">여</option>
                    </select>
                </div>

                <span class="col-sm-2 control-label">정원</span>
                <div class="col-sm-4" id="sroom_people">
                    <select class="form-control selectbox" id="room_people" name="room_people">
                        <option>===선택===</option>
                        <option value="1">1명</option>
                        <option value="2">2명</option>
                        <option value="3">3명</option>
                        <option value="4">4명</option>
                        <option value="5">5명</option>
                        <option value="6">6명</option>
                        <option value="7">7명</option>
                        <option value="8">8명</option>
                        <option value="9">9명</option>
                        <option value="10">10명</option>
                    </select>
                </div>

                <span class="col-sm-2 control-label">가격</span>
                <div class="col-sm-4" id="sprice">
                    <select class="form-control selectbox" id="price" name="price">
                        <option>===선택===</option>
                        <option value="30000">30,000원</option>
                        <option value="40000">40,000원</option>
                        <option value="50000">50,000원</option>
                        <option value="60000">60,000원</option>
                        <option value="70000">70,000원</option>
                        <option value="80000">80,000원</option>
                        <option value="90000">90,000원</option>
                    </select>
                </div>
                <span class="col-sm-12 control-label"></span>
                
                
                <div class="container">
                	<div class="row" id="test">
                	
                	</div>
                </div>
                <div class="col-sm-12 control-label">
                	<input type="button" onclick="btn_test();" value="추가">
                </div>
                <script>
                function btn_test(){
                	if(confirm("방 정보를 추가 하시겠습니까??") == true) {
	                	var room_orig = $("select", $('#room'));
	                	var gender_orig = $("select", $('#gender'));
	                	var room_people_orig = $("select", $('#room_people'));
	                	var price_orig = $("select", $('#price'));
	                	
	                	var room_copy = $("#room").clone();
	                	var gender_copy = $("#gender").clone();
	                	var room_people_copy = $("#room_people").clone();
	                	var price_copy = $("#price").clone();
	                	
	                	$("select", room_copy).val(room_orig.val());
	                	$("select", gender_copy).val(gender_orig.val());
	                	$("select", room_people_copy).val(room_people_orig.val());
	                	$("select", price_copy).val(price_orig.val());
	                	
	                	room_copy.appendTo("#sroom");
	                	gender_copy.appendTo("#sgender");
	                	room_people_copy.appendTo("#sroom_people");
	                	price_copy.appendTo("#sprice");
                	} else {
                		return;
                	}
                }
                </script>

                <span class="col-sm-2 control-label">파티 메뉴</span>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="party_menu" placeholder="파티 메뉴">
                </div>

                <span class="col-sm-2 control-label">파티 시간</span>
                <div class="col-sm-2">
                    <select class="form-control selectbox" id="party_time1">
                        <option>===선택===</option>
                        <option value="18:00">18:00</option>
                        <option value="18:30">18:30</option>
                        <option value="19:00">19:00</option>
                        <option value="19:30">19:30</option>
                        <option value="20:00">20:00</option>
                        <option value="20:30">20:30</option>
                        <option value="21:00">21:00</option>
                        <option value="21:30">21:30</option>
                        <option value="22:00">22:00</option>
                        <option value="22:30">22:30</option>
                        <option value="23:00">23:00</option>
                        <option value="23:30">23:30</option>
                        <option value="24:00">24:00</option>
                    </select>
                </div>
                <span id="wave">~</span>
                <div class="col-sm-2">
                    <select class="form-control selectbox" id="party_time2">
                        <option>===선택===</option>
                        <option value="18:00">18:00</option>
                        <option value="18:30">18:30</option>
                        <option value="19:00">19:00</option>
                        <option value="19:30">19:30</option>
                        <option value="20:00">20:00</option>
                        <option value="20:30">20:30</option>
                        <option value="21:00">21:00</option>
                        <option value="21:30">21:30</option>
                        <option value="22:00">22:00</option>
                        <option value="22:30">22:30</option>
                        <option value="23:00">23:00</option>
                        <option value="23:30">23:30</option>
                        <option value="24:00">24:00</option>
                    </select>
                </div>
                
                <input type="hidden" id ="party_time" name="party_time">
                <script>
				$(function() {
					var party_time = $("#party_time");
					$("#party_time2").change(function(){
						var party_time1 = $("#party_time1 option:selected").val();
						var party_time2 = $("#party_time2 option:selected").val();
						party_time.val(party_time1 + "~" + party_time2);
					});
				});
				</script>
                
                <span class="col-sm-2 control-label">소등 시간</span>
                <div class="col-sm-2">
                    <select class="form-control selectbox" name="off_time">
                    	<option>===선택===</option>
                        <option value="22:00">22:00</option>
                        <option value="22:30">22:30</option>
                        <option value="21:00">21:00</option>
                        <option value="21:30">21:30</option>
                        <option value="22:00">22:00</option>
                        <option value="22:30">22:30</option>
                        <option value="23:00">23:00</option>
                        <option value="23:30">23:30</option>
                        <option value="24:00">24:00</option>
                        <option value="24:30">24:30</option>
                        <option value="01:00">01:00</option>
                        <option value="01:30">01:30</option>
                        <option value="02:00">02:00</option>
                    </select>
                </div>

                <span class="col-sm-2 control-label">입실 시간</span>
                <div class="col-sm-2">
                    <select class="form-control selectbox" name="check_in">
                        <option>===선택===</option>
                        <option value="10:00">10:00</option>
                        <option value="10:30">10:30</option>
                        <option value="11:00">11:00</option>
                        <option value="11:30">11:30</option>
                        <option value="12:00">12:00</option>
                        <option value="12:30">12:30</option>
                        <option value="13:00">13:00</option>
                        <option value="13:30">13:30</option>
                        <option value="14:00">14:00</option>
                        <option value="14:30">14:30</option>
                        <option value="15:00">15:00</option>
                        <option value="15:30">15:30</option>
                        <option value="16:00">16:00</option>
                    </select>
                </div>

                <span class="col-sm-2 control-label">퇴실 시간</span>
                <div class="col-sm-2">
                    <select class="form-control selectbox" name="check_out">
                        <option>===선택===</option>
                        <option value="10:00">10:00</option>
                        <option value="10:30">10:30</option>
                        <option value="11:00">11:00</option>
                        <option value="11:30">11:30</option>
                        <option value="12:00">12:00</option>
                        <option value="12:30">12:30</option>
                        <option value="13:00">13:00</option>
                        <option value="13:30">13:30</option>
                        <option value="14:00">14:00</option>
                        <option value="14:30">14:30</option>
                        <option value="15:00">15:00</option>
                        <option value="15:30">15:30</option>
                        <option value="16:00">16:00</option>
                    </select>
                </div>

                <div class="container">
                    <div class="row">
                        <span class="col-sm-2 control-label">상세 정보</span>

                        <div class="col-sm-2">
                            <label><input type="checkbox" id="chk_info" name="alcohol" data-toggle="checkbox" value="alcohol">술</label>
                        </div>
                        <div class="col-sm-2">
                            <label><input type="checkbox" id="chk_info" name="wifi" data-toggle="checkbox" value="wifi">Wi-Fi</label>
                        </div>
                        <div class="col-sm-2">
                            <label><input type="checkbox" id="chk_info" name="parking" data-toggle="checkbox" value="parking">주차장</label>
                        </div>
                        <div class="col-sm-2">
                            <label><input type="checkbox" id="chk_info" name="morning" data-toggle="checkbox" value="morning">조식</label>
                        </div>
                        <div class="col-sm-2">
                            <label><input type="checkbox" id="chk_info" name="pet" data-toggle="checkbox" value="pet">반려동물 출입</label>
                        </div>
                    </div>
                </div>
                
                <span class="col-sm-2 control-label">내용</span>
                <div class="col-lg-10">
                    <textarea placeholder="내용" name="content"></textarea>
                    <input type="file" class="form-control-file" name="file" placeholder="파일 선택">
                    <button class="site-btn1 sb-big1">등록</button>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- Contact Section end -->

<%@include file="/WEB-INF/include/footer.jsp" %>