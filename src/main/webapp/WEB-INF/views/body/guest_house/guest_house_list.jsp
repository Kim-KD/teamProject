<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Blog Section end -->
<section class="blog-section spad">
	<div class="container">
	<div class="section-title">
			<h2>게스트 하우스</h2>
		</div>
		<div class="row">
			<c:forEach items="${boardList}" var="boardList">
			<div class="col-lg-4 col-md-6">
				<div class="blog-item">
					<a href="guest_house_read?no=${boardList.no}"><img src="assets/main/img/property/${boardList.thumbnail})"></a>
					<div class="blog-text">
						<div class="blog-date">${boardList.w_date}</div>
						<h4><a href="guest_house_read?no=${boardList.no}">${boardList.name}</a></h4>
						<h4><a href="guest_house_read?no=${boardList.no}">${boardList.title}</a></h4>
						<a href="guest_house_read?no=${boardList.no}" class="readmore-btn">자세히 보기</a>
					</div>
				</div>
			</div>
         </c:forEach>
		</div>
		<div class="site-pagination" style="text-align: right">
			<a href="guest_house_write" class="btn px-4 btn-primary text-white">글 작성</a>
		</div>
	</div>
</section>
<!-- Blog Section end -->