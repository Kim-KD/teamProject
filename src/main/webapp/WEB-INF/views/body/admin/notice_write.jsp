<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="resources/ckeditor/ckeditor.js"></script>
<script src="resources/data-components/admin/notice_write.js"></script>

<!-- Contact Section end -->
<section class="contact-section">
    <div class="container">
    <div class="section-title">
			<h2>공지사항 작성</h2>
	</div>
        <form class="contact-form" action="notice_write" method="post" enctype="multipart/form-data">
        <input type="hidden" name="admin_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        
            <div class="row">
                <span class="col-sm-2 control-label">제목</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="title" placeholder="제목"> 
                </div>

                <span class="col-sm-2 control-label">내용</span>
                <div class="col-lg-10">
                    <textarea id="content" name="content"></textarea>
                    <button class="site-btn1 sb-big1">등록</button>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- Contact Section end -->
