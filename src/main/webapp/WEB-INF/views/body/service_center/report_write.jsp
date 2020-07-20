<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="resources/ckeditor/ckeditor.js"></script>
<script src="resources/data-components/service_center/report_write.js"></script>

<!-- Contact Section end -->
<section class="contact-section">
    <div class="container">
    <div class="section-title">
			<h2>신고 작성</h2>
	</div>
        <form class="contact-form" action="report_write" method="post">
        <input type="hidden" name="user_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
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
                    <textarea placeholder="내용" id="content" name="content"  style="width:100%;height:100;border:1;overflow:visible;text-overflow:ellipsis;"></textarea>
                </div>
                <button class="site-btn1 sb-big1">등록 하기</button>
            </div>
        </form>
    </div>
</section>
<!-- Contact Section end -->
