<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	$("#content").html("${board.content}");
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

            <div class="row">
                <span class="col-sm-2 control-label">제목</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="title" name="title" placeholder="제목"> 
                </div>

                <span class="col-sm-2 control-label">지역주소</span>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="city" name="city" placeholder="지역주소">
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
                    <textarea placeholder="내용" id="content" name="content"></textarea>
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