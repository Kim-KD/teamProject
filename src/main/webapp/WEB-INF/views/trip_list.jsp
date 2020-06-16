<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/other_header.jsp" %>

<script>
$(function(){
	$("#writeBtn").on("click",function(){
		location.href="/project/trip_write"
	})
})
</script>
<style>
#writeBtn{margin-left: 74%}
</style>
<!-- Blog Section end -->
<section class="blog-section spad">
	<div class="container">
		<div class="section-title">
			<h2>관광 명소</h2>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="blog-item">
					<img src="assets/img/blog/1.jpg" alt="">
					<div class="blog-text">
						<div class="blog-date">작성 날짜</div>
						<h4>제목</h4>
						<p>내용 </p>
						<a href="#" class="readmore-btn">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="blog-item">
					<img src="assets/img/blog/2.jpg" alt="">
					<div class="blog-text">
						<div class="blog-date">작성 날짜</div>
						<h4>제목</h4>
						<p>내용 </p>
						<a href="#" class="readmore-btn">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="blog-item">
					<img src="assets/img/blog/3.jpg" alt="">
					<div class="blog-text">
						<div class="blog-date">작성 날짜</div>
						<h4>제목</h4>
						<p>내용 </p>
						<a href="#" class="readmore-btn">자세히 보기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="blog-item">
					<img src="assets/img/blog/4.jpg" alt="">
					<div class="blog-text">
						<div class="blog-date">작성 날짜</div>
						<h4>제목</h4>
						<p>내용 </p>
						<a href="#" class="readmore-btn">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="blog-item">
					<img src="assets/img/blog/5.jpg" alt="">
					<div class="blog-text">
						<div class="blog-date">작성 날짜</div>
						<h4>제목</h4>
						<p>내용 </p>
						<a href="#" class="readmore-btn">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="blog-item">
					<img src="assets/img/blog/6.jpg" alt="">
					<div class="blog-text">
						<div class="blog-date">작성 날짜</div>
						<h4>제목</h4>
						<p>내용 </p>
						<a href="#" class="readmore-btn">자세히 보기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="blog-item">
					<img src="assets/img/blog/1.jpg" alt="">
					<div class="blog-text">
						<div class="blog-date">작성 날짜</div>
						<h4>제목</h4>
						<p>내용 </p>
						<a href="#" class="readmore-btn">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="blog-item">
					<img src="assets/img/blog/2.jpg" alt="">
					<div class="blog-text">
						<div class="blog-date">작성 날짜</div>
						<h4>제목</h4>
						<p>내용 </p>
						<a href="#" class="readmore-btn">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="blog-item">
					<img src="assets/img/blog/3.jpg" alt="">
					<div class="blog-text">
						<div class="blog-date">작성 날짜</div>
						<h4>제목</h4>
						<p>내용 </p>
						<a href="#" class="readmore-btn">자세히 보기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="blog-item">
					<img src="assets/img/blog/4.jpg" alt="">
					<div class="blog-text">
						<div class="blog-date">작성 날짜</div>
						<h4>제목</h4>
						<p>내용 </p>
						<a href="#" class="readmore-btn">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="blog-item">
					<img src="assets/img/blog/5.jpg" alt="">
					<div class="blog-text">
						<div class="blog-date">작성 날짜</div>
						<h4>제목</h4>
						<p>내용 </p>
						<a href="#" class="readmore-btn">자세히 보기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="blog-item">
					<img src="assets/img/blog/6.jpg" alt="">
					<div class="blog-text">
						<div class="blog-date">작성 날짜</div>
						<h4>제목</h4>
						<p>내용 </p>
						<a href="#" class="readmore-btn">자세히 보기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="site-pagination">
			<a href="#">01.</a>
			<a href="#" class="active">02.</a>
			<a href="#">03.</a>
			<a href="#">04.</a>
			<button id="writeBtn" class="btn px-4 btn-primary text-white">글 작성</button>
		</div>
	</div>
</section>
<!-- Blog Section end -->

<%@include file="/WEB-INF/include/footer.jsp" %>