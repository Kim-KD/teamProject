<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/ckeditor/ckeditor.js"></script>

<script src="resources/data-components/trip/common.js"></script>
<script src="resources/data-components/trip/trip_write.js"></script>

<!-- Contact Section end -->
<section class="contact-section">
    <div class="container">
    <div class="section-title">
			<h2>관광 명소 글 작성</h2>
	</div>
        <form class="contact-form" action="/project/trip_write" method="post" enctype="multipart/form-data">
        <input type="hidden" name="user_id" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="hidden" name="postcode" id="postcode" value="">
        
            <div class="row">
                <span class="col-sm-2 control-label">제목</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="title" placeholder="제목"> 
                </div>
                
                <span class="col-sm-2 control-label">관광명소 이름</span>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="name" placeholder="관광명소 이름"> 
                </div>

                <span class="col-sm-2 control-label">지역주소</span>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="city" placeholder="지역주소">
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
                    <textarea placeholder="내용" id="content" name="content"></textarea>
                    <button class="site-btn1 sb-big1">등록</button>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- Contact Section end -->
