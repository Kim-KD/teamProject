<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/ckeditor/ckeditor.js"></script>
<script>
$(function(){
	CKEDITOR.replace("content",{
		filebrowserUploadUrl : "/project/imgupload?_csrf=${_csrf.token}"
	})
	$("#title").val("${board.title}");
	$("#city").val("${board.city}");
	$("#address").val("${board.address}");
	$("#admission").val("${board.admission}");
	$("#opentime").val("${board.opentime}");
	
	// 게시글 수정
	$("#update_btn").on("click", function() {
		$.ajax({
			url: "/project/trip_update",
			method: "post",
			data: $("#update_form").serialize(),
			success: function() {
				location.href="/project/trip_read?no="+"${board.no}"
			},error(){
				alert("게시글을 수정하는데 실패했습니다.");
			}
		})
	})
	// 게시글 수정 취소 확인 창 보여주기
	$('#cancel_box_open').on('click', function(){
		$('#cancel_box').modal('show');
	})
	
	// 게시글 수정 취소
	$("#cancel_btn").on("click", function() {
		location.href="/project/trip_read?no="+"${board.no}"
	})
})

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

<!-- Contact Section end -->
<section class="contact-section">
    <div class="container">
    <div class="section-title">
			<h2>관광 명소 글 수정</h2>
	</div>
        <form id="update_form" class="contact-form" action="/project/trip_update" method="post" enctype="multipart/form-data">
        <input type="hidden" name="user_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="hidden" name="no" value="${board.no}">
        <input type="hidden" name="postcode" id="postcode" value="">

            <div class="row">
                <span class="col-sm-2 control-label">제목</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="title" name="title" placeholder="제목"> 
                </div>

                <span class="col-sm-2 control-label">지역주소</span>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="city" name="city" placeholder="지역주소">
                    <span><input type="button" onclick="search_Postcode()" value="우편번호 찾기"></span>
                </div>

                <span class="col-sm-2 control-label">상세주소</span>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="address" name="address" placeholder="상세주소">
                </div>

                <span class="col-sm-2 control-label">입장료</span>
                <div class="col-sm-4" id="sprice">
                    <input type="text" class="form-control" id="admission" name="admission">
                </div>

                <span class="col-sm-2 control-label">운영 시간</span>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="opentime" name="opentime">
                </div>

                <span class="col-sm-2 control-label">내용</span>
                <div class="col-lg-10">
                    <textarea placeholder="내용" id="content" name="content">${board.content}</textarea>
                    <button type="button" id="update_btn" class="btn btn-success">수정하기</button>
                    <button type="button" id="cancel_box_open" class="btn btn-danger">취소하기</button>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- Contact Section end -->

<!-- 게시글 삭제 Modal -->
<div id="cancel_box" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">게시글 수정 취소</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
			</div>

			<div class="modal-body">
				<div class="container">
					<div class="form-group">
						<div id="select">
							<h6>변경된 내용이 저장되지 않습니다.
							<br>정말 게시글 수정을 취소하시겠습니까?</h6>
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