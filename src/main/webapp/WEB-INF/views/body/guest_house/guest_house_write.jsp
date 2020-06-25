<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="resources/ckeditor/ckeditor.js"></script>
<script>
$(function(){
	CKEDITOR.replace("content",{
		 filebrowserUploadUrl : "/project/imgUpload"
	});	
})
</script>

<!-- Contact Section end -->
<section class="contact-section">
    <div class="container">
        <form class="contact-form" action="write" method="post" enctype="multipart/form-data">
        <input type="hidden" name="user_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        
        <input type="hidden" name="postcode" id="postcode" value="">
        <input type="hidden" name="party_day" value="00-00">
        
            <div class="row">
                <span class="col-sm-2 control-label">제목</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="title" placeholder="제목"> 
                </div>
				<span class="col-sm-2 control-label">게스트하우스 이름</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="name" placeholder="게스트하우스 이름"> 
                </div>
                <span class="col-sm-2 control-label">지역주소</span>
                <div class="col-sm-3">
                    <input type="text" class="form-control" name="city" id="city" placeholder="지역주소">
                </div>
                
                <span><input type="button" onclick="search_Postcode()" value="우편번호 찾기"></span>

                <span class="col-sm-2 control-label">상세주소</span>
                <div class="col-sm-3">
                    <input type="text" class="form-control" name="address" id="address" placeholder="상세주소">
                </div>
                
                <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
				    function search_Postcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var addr = ''; // 주소 변수
				                var extraAddr = ''; // 참고항목 변수
				
				                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				                    addr = data.roadAddress;
				                } else { // 사용자가 지번 주소를 선택했을 경우(J)
				                    addr = data.jibunAddress;
				                }
				
				                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				                if(data.userSelectedType === 'R'){
				                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                        extraAddr += data.bname;
				                    }
				                    // 건물명이 있고, 공동주택일 경우 추가한다.
				                    if(data.buildingName !== '' && data.apartment === 'Y'){
				                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                    if(extraAddr !== ''){
				                        extraAddr = ' (' + extraAddr + ')';
				                    }
				                    // 조합된 참고항목을 해당 필드에 넣는다.
				                    /* document.getElementById("sample6_extraAddress").value = extraAddr; */
				                
				                } /* else {
				                    document.getElementById("sample6_extraAddress").value = '';
				                } */
				
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                document.getElementById("postcode").value = data.zonecode;
				                document.getElementById("city").value = addr;
				                // 커서를 상세주소 필드로 이동한다.
				                document.getElementById("address").focus();
				            }
				        }).open();
				    }
				</script>

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
				
                <script>
                function add_Room_info(){
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
                
                function delete_Room_info() {
                	var room = document.getElementById("room");
                	var gender = document.getElementById("gender");
                	var room_people = document.getElementById("room_people");
                	var price = document.getElementById("price");
                	
                	var room_parent = room.parentElement;
                	var gender_parent = gender.parentElement;
                	var room_people_parent = room_people.parentElement;
                	var price_parent = price.parentElement;

                	var length = $("select[name=room]").length;
                	
                	if(length == 1) {
                		alert("삭제할 수 없습니다.");
                		return;
                	} else {
                		room_parent.removeChild(room);
                		gender_parent.removeChild(gender);
                		room_people_parent.removeChild(room_people);
                		price_parent.removeChild(price);
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
                    <textarea placeholder="내용" id="content" name="content"></textarea>
                    <input type="file" class="form-control-file" name="file" placeholder="파일 선택">
                    <button class="site-btn1 sb-big1">등록</button>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- Contact Section end -->