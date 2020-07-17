<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="resources/ckeditor/ckeditor.js"></script>
<script src="resources/data-components/service_center/notice_update.js"></script>

<!-- Contact Section end -->
<section class="contact-section">
    <div class="container">
    <div class="section-title">
			<h2>공지 수정</h2>
	</div>
<form id="update_form" class="contact-form" action="#" method="post">
        <input type="hidden" id="admin_id" name="admin_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
        <input type="hidden" id="no" name="no" value="${board.no}">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        
            <div class="row">
            	<span class="col-sm-2 control-label">작성자</span>
                <div class="col-sm-10">
                    <span id="user_id">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}</span>
                </div>
            
                <span class="col-sm-2 control-label">제목</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="title" name="title" value="${board.title}" placeholder="제목"> 
                </div>

                <span class="col-sm-2 control-label">내용</span>
                <div class="col-sm-10">
                    <textarea placeholder="내용" id="content" name="content">${board.content}</textarea>
                </div>
                <button type="button" id="update_btn" class="site-btn1 sb-big1">수정 하기</button>
                <button type="button" id="cancel_box_open" class="site-btn1 sb-big1">수정 취소</button>
            </div>
        </form>
	</div>
</section>
<!-- Contact Section end -->

<!-- 문의 수정 취소 Modal -->
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
<!-- 문의 수정 취소 Modal End -->
