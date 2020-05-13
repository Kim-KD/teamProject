<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/other_header.jsp" %>

<!-- Contact Section end -->
<section class="contact-section">
    <div class="container">
        <form class="contact-form" action="write" method="post">
        <input type="hidden" name="user_id" value="${login_data}">
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
                <div class="col-sm-4">
                    <select class="form-control selectbox" name="room">
                        <option value="도미토리룸">도미토리룸</option>
                        <option value="더블룸">더블룸</option>
                        <option value="트윈룸">트윈룸</option>
                    </select>
                </div>

                <span class="col-sm-2 control-label">방구분(남/여)</span>
                <div class="col-sm-4">
                    <select class="form-control selectbox" name="room_status">
                        <option value="남">남</option>
                        <option value="여">여</option>
                    </select>
                </div>

                <span class="col-sm-2 control-label">정원</span>
                <div class="col-sm-4">
                    <select class="form-control selectbox" name="room_people">
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
                <div class="col-sm-4">
                    <select class="form-control selectbox" name="price">
                        <option value="30,000원">30,000원</option>
                        <option value="40,000원">40,000원</option>
                        <option value="50,000원">50,000원</option>
                        <option value="60,000원">60,000원</option>
                        <option value="70,000원">70,000원</option>
                        <option value="80,000원">80,000원</option>
                        <option value="90,000원">90,000원</option>
                    </select>
                </div>

                <span class="col-sm-2 control-label">파티 메뉴</span>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="party_menu" placeholder="파티 메뉴">
                </div>

                <span class="col-sm-2 control-label">파티 시간</span>
                <div class="col-sm-2">
                    <select class="form-control selectbox" id="party_time1">
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
                
                <span class="col-sm-2 control-label">소등 시간</span>
                <div class="col-sm-2">
                    <select class="form-control selectbox" name="off_time">
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
                
                <input type="hidden" name="party_time" value="111">
                <input type="hidden" name="photo" value="111">
                
                <span class="col-sm-2 control-label">내용</span>
                <div class="col-lg-10">
                    <textarea placeholder="내용" name="content"></textarea>
                    <button class="site-btn1 sb-big1">등록</button>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- Contact Section end -->

<%@include file="/WEB-INF/include/footer.jsp" %>