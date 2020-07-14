<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="resources/ckeditor/ckeditor.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function(){
	CKEDITOR.replace("content",{
		filebrowserUploadUrl : "/guehamo/imgupload?_csrf=${_csrf.token}"
	})
	$("#title").val("${board.title}");

	// 게시글 수정
	$("#update_btn").on("click", function() {
		$.ajax({
			url: "inquiry_update",
			method: "post",
			data: $("#update_form").serialize(),
			success: function() {
				location.href="inquiry_read?no="+"${board.no}"
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
		location.href="inquiry_read?no="+"${board.no}"
	})
})
</script>

<!-- Contact Section end -->
<section class="contact-section">
    <div class="container">
    <div class="section-title">
			<h2>문의 수정</h2>
	</div>
<form id="update_form" class="contact-form" action="#" method="post">
        <input type="hidden" name="user_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
        <input type="hidden" name="no" value="${board.no}">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        
            <div class="row">
            	<span class="col-sm-2 control-label">작성자</span>
                <div class="col-sm-10">
                    <span id="user_id">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}</span>
                </div>
            
                <span class="col-sm-2 control-label">제목</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="title" name="title" placeholder="제목"> 
                </div>

                <span class="col-sm-2 control-label">내용</span>
                <div class="col-sm-10">
                    <textarea placeholder="내용" id="content" name="content"  style="width:100%;height:100;border:1;overflow:visible;text-overflow:ellipsis;">${board.content}</textarea>
                </div>
                <button type="button" id="update_btn" class="site-btn1 sb-big1">수정 하기</button>
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
				<h4 class="modal-title" id="myModalLabel">문의 수정 취소</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
			</div>

			<div class="modal-body">
				<div class="container">
					<div class="form-group">
						<div id="select">
							<h6>변경된 내용이 저장되지 않습니다.
							<br>정말 문의 수정을 취소하시겠습니까?</h6>
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
