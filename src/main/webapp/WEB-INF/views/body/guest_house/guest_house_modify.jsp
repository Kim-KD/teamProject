<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="resources/ckeditor/ckeditor.js"></script>
<script src="resources/data-components/guest_house/common.js"></script>
<script src="resources/data-components/guest_house/guest_house_modify.js"></script>

<!-- Contact Section end -->
<section class="contact-section">
    <div class="container">
        <form class="contact-form" action="modify" method="post" enctype="multipart/form-data">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        
        <input type="hidden" name="no" id="no" value="${modify_page_data.no}">
        <input type="hidden" name="user_id" id="user_id" value="${modify_page_data.user_id}">
        <input type="hidden" name="postcode" id="postcode" value="${modify_page_data.postcode}">
        <input type="hidden" name="party_day" value="${modify_page_data.party_day}">
        
            <div class="row">
                <span class="col-sm-2 control-label">제목</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="title" value="${modify_page_data.title}"> 
                </div>
				<span class="col-sm-2 control-label">게스트하우스 이름</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="name" value="${modify_page_data.name}"> 
                </div>
                <span class="col-sm-2 control-label">지역주소</span>
                <div class="col-sm-3">
                    <input type="text" class="form-control" name="city" id="city" value="${modify_page_data.city}">
                </div>
                
                <span><input type="button" onclick="search_Postcode()" value="우편번호 찾기"></span>

                <span class="col-sm-2 control-label">상세주소</span>
                <div class="col-sm-3">
                    <input type="text" class="form-control" name="address" id="address" value="${modify_page_data.address}">
                </div>
                
                <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
                
                <div class="container">
                	<div class="row" id="test">
                	
                	</div>
                </div>
                
                <div class="col-sm-12 control-label" style="text-align: center">
					<a class="btn px-4 btn-success text-white" onclick="add_Room_info();">추가</a>&nbsp;
					<a class="btn px-4 btn-primary text-white" onclick="delete_Room_info()">삭제</a>
				</div>

                <span class="col-sm-2 control-label">파티 메뉴</span>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="party_menu" value="${modify_page_data.party_menu}">
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
                
                <span class="col-sm-2 control-label">소등 시간</span>
                <div class="col-sm-2">
                    <select class="form-control selectbox" name="off_time">
                    	<option>===선택===</option>
                        <option ${modify_page_data.off_time == "22:00"? "selected = selected" : "" } value="22:00">22:00</option>
                        <option ${modify_page_data.off_time == "22:30"? "selected = selected" : "" } value="22:30">22:30</option>
                        <option ${modify_page_data.off_time == "23:00"? "selected = selected" : "" } value="23:00">23:00</option>
                        <option ${modify_page_data.off_time == "23:30"? "selected = selected" : "" } value="23:30">23:30</option>
                        <option ${modify_page_data.off_time == "24:00"? "selected = selected" : "" } value="24:00">24:00</option>
                        <option ${modify_page_data.off_time == "24:30"? "selected = selected" : "" } value="24:30">24:30</option>
                        <option ${modify_page_data.off_time == "01:00"? "selected = selected" : "" } value="01:00">01:00</option>
                        <option ${modify_page_data.off_time == "01:30"? "selected = selected" : "" } value="01:30">01:30</option>
                        <option ${modify_page_data.off_time == "02:00"? "selected = selected" : "" } value="02:00">02:00</option>
                    </select>
                </div>

                <span class="col-sm-2 control-label">입실 시간</span>
                <div class="col-sm-2">
                    <select class="form-control selectbox" name="check_in">
                        <option>===선택===</option>
                        <option ${modify_page_data.check_in == "10:00"? "selected = selected" : "" } value="10:00">10:00</option>
                        <option ${modify_page_data.check_in == "10:30"? "selected = selected" : "" } value="10:30">10:30</option>
                        <option ${modify_page_data.check_in == "11:00"? "selected = selected" : "" } value="11:00">11:00</option>
                        <option ${modify_page_data.check_in == "11:30"? "selected = selected" : "" } value="11:30">11:30</option>
                        <option ${modify_page_data.check_in == "12:00"? "selected = selected" : "" } value="12:00">12:00</option>
                        <option ${modify_page_data.check_in == "12:30"? "selected = selected" : "" } value="12:30">12:30</option>
                        <option ${modify_page_data.check_in == "13:00"? "selected = selected" : "" } value="13:00">13:00</option>
                        <option ${modify_page_data.check_in == "13:30"? "selected = selected" : "" } value="13:30">13:30</option>
                        <option ${modify_page_data.check_in == "14:00"? "selected = selected" : "" } value="14:00">14:00</option>
                        <option ${modify_page_data.check_in == "14:30"? "selected = selected" : "" } value="14:30">14:30</option>
                        <option ${modify_page_data.check_in == "15:00"? "selected = selected" : "" } value="15:00">15:00</option>
                        <option ${modify_page_data.check_in == "15:30"? "selected = selected" : "" } value="15:30">15:30</option>
                        <option ${modify_page_data.check_in == "16:00"? "selected = selected" : "" } value="16:00">16:00</option>
                    </select>
                </div>

                <span class="col-sm-2 control-label">퇴실 시간</span>
                <div class="col-sm-2">
                    <select class="form-control selectbox" name="check_out">
                        <option>===선택===</option>
                        <option ${modify_page_data.check_out == "10:00"? "selected = selected" : "" } value="10:00">10:00</option>
                        <option ${modify_page_data.check_out == "10:30"? "selected = selected" : "" } value="10:30">10:30</option>
                        <option ${modify_page_data.check_out == "11:00"? "selected = selected" : "" } value="11:00">11:00</option>
                        <option ${modify_page_data.check_out == "11:30"? "selected = selected" : "" } value="11:30">11:30</option>
                        <option ${modify_page_data.check_out == "12:00"? "selected = selected" : "" } value="12:00">12:00</option>
                        <option ${modify_page_data.check_out == "12:30"? "selected = selected" : "" } value="12:30">12:30</option>
                        <option ${modify_page_data.check_out == "13:00"? "selected = selected" : "" } value="13:00">13:00</option>
                        <option ${modify_page_data.check_out == "13:30"? "selected = selected" : "" } value="13:30">13:30</option>
                        <option ${modify_page_data.check_out == "14:00"? "selected = selected" : "" } value="14:00">14:00</option>
                        <option ${modify_page_data.check_out == "14:30"? "selected = selected" : "" } value="14:30">14:30</option>
                        <option ${modify_page_data.check_out == "15:00"? "selected = selected" : "" } value="15:00">15:00</option>
                        <option ${modify_page_data.check_out == "15:30"? "selected = selected" : "" } value="15:30">15:30</option>
                        <option ${modify_page_data.check_out == "16:00"? "selected = selected" : "" } value="16:00">16:00</option>
                    </select>
                </div>

                <div class="container">
                    <div class="row">
                        <span class="col-sm-2 control-label">상세 정보</span>

                        <div class="col-sm-2">
                            <label><input type="checkbox" id="chk_info" name="alcohol" data-toggle="checkbox" ${modify_page_data.alcohol != null? "checked = checked" : "" } value="alcohol">술</label>
                        </div>
                        <div class="col-sm-2">
                            <label><input type="checkbox" id="chk_info" name="wifi" data-toggle="checkbox" ${modify_page_data.wifi != null? "checked = checked" : "" } value="wifi">Wi-Fi</label>
                        </div>
                        <div class="col-sm-2">
                            <label><input type="checkbox" id="chk_info" name="parking" data-toggle="checkbox" ${modify_page_data.parking != null? "checked = checked" : "" } value="parking">주차장</label>
                        </div>
                        <div class="col-sm-2">
                            <label><input type="checkbox" id="chk_info" name="morning" data-toggle="checkbox" ${modify_page_data.morning != null? "checked = checked" : "" } value="morning">조식</label>
                        </div>
                        <div class="col-sm-2">
                            <label><input type="checkbox" id="chk_info" name="pet" data-toggle="checkbox" ${modify_page_data.pet != null? "checked = checked" : "" } value="pet">반려동물 출입</label>
                        </div>
                    </div>
                </div>
                
                <span class="col-sm-2 control-label">내용</span>
                <div class="col-lg-10">
                    <textarea placeholder="내용" id="content" name="content">${modify_page_data.content}</textarea>
                    <input type="file" class="form-control-file" name="file" placeholder="파일 선택">
                    <button class="site-btn1 sb-big1">수정</button>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- Contact Section end -->