<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/main_header.jsp" %>

<!-- 최신글 -->
<section class="property-section">
	<div class="container">
		<div class="section-title">
			<h2>최신글</h2>
		</div>
		<div class="row" id="slide">
			<c:forEach items="${new_list}" var="new_list">
			<div class="col-lg-4">
				<div class="property-item">
					<div class="pi-image">
						<c:if test="${new_list.thumbnail != null}">
							<img src="assets/gh_img/${new_list.thumbnail}" alt="">
						</c:if>
						<c:if test="${new_list.thumbnail == null}">
							<img src="assets/gh_img/noimg.jpg" alt="">
						</c:if>
						<div class="pi-badge new">인기</div>
					</div>
					<h3>${new_list.title}</h3>
					<p>${new_list.content}</p>
				</div>
			</div>
			</c:forEach>

			<!-- <div class="col-lg-4">
				<div class="property-item">
					<div class="pi-image">
						<img src="assets/img/property/1.jpg" alt="">
						<div class="pi-badge new">인기</div>
					</div>
					<h3>게스트하우스 이름</h3>
					<h5>가격</h5>
					<p>게스트 하우스 소개글</p>
					<a href="#" class="readmore-btn">게시글로 이동</a>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="property-item">
					<div class="pi-image">
						<img src="assets/img/property/2.jpg" alt="">
						<div class="pi-badge offer">추천</div>
					</div>
					<h3>게스트하우스 이름</h3>
					<h5>가격</h5>
					<p>게스트 하우스 소개글</p>
					<a href="#" class="readmore-btn">게시글로 이동</a>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="property-item">
					<div class="pi-image">
						<img src="assets/img/property/3.jpg" alt="">
						<div class="pi-badge new">인기</div>
					</div>
					<h3>게스트하우스 이름</h3>
					<h5>가격</h5>
					<p>게스트 하우스 소개글</p>
					<a href="#" class="readmore-btn">게시글로 이동</a>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="property-item">
					<div class="pi-image">
						<img src="assets/img/property/1.jpg" alt="">
						<div class="pi-badge new">인기</div>
					</div>
					<h3>게스트하우스 이름</h3>
					<h5>가격</h5>
					<p>게스트 하우스 소개글</p>
					<a href="#" class="readmore-btn">게시글로 이동</a>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="property-item">
					<div class="pi-image">
						<img src="assets/img/property/2.jpg" alt="">
						<div class="pi-badge offer">추천</div>
					</div>
					<h3>게스트하우스 이름</h3>
					<h5>가격</h5>
					<p>게스트 하우스 소개글</p>
					<a href="#" class="readmore-btn">게시글로 이동</a>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="property-item">
					<div class="pi-image">
						<img src="assets/img/property/3.jpg" alt="">
						<div class="pi-badge new">인기</div>
					</div>
					<h3>게스트하우스 이름</h3>
					<h5>가격</h5>
					<p>게스트 하우스 소개글</p>
					<a href="#" class="readmore-btn">게시글로 이동</a>
				</div>
			</div> -->
		</div>
	</div>
</section>
<!-- 최신글 end -->

<!-- 조회수 Top -->
<section class="property-section">
	<div class="container">
		<div class="section-title">
			<h2>조회수 Top</h2>
		</div>
		<div class="row" id="slide1">
			<c:forEach items="${views_list}" var="views_list">
			<div class="col-lg-4">
				<div class="property-item">
					<div class="pi-image">
						<c:if test="${new_list.thumbnail != null}">
							<img src="assets/gh_img/${new_list.thumbnail}" alt="">
						</c:if>
						<c:if test="${new_list.thumbnail == null}">
							<img src="assets/gh_img/noimg.jpg" alt="">
						</c:if>
						<div class="pi-badge new">인기</div>
					</div>
					<h3>${views_list.title}</h3>
					<p>${views_list.content}</p>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</section>
<!-- 조회수 Top end -->

<!-- 추천 Top -->
<section class="property-section">
	<div class="container">
		<div class="section-title">
			<h2>추천 Top</h2>
		</div>
		<div class="row" id="slide2">
			<c:forEach items="${likes_list}" var="likes_list">
			<div class="col-lg-4">
				<div class="property-item">
					<div class="pi-image">
						<c:if test="${new_list.thumbnail != null}">
							<img src="assets/gh_img/${new_list.thumbnail}" alt="">
						</c:if>
						<c:if test="${new_list.thumbnail == null}">
							<img src="assets/gh_img/noimg.jpg" alt="">
						</c:if>
						<div class="pi-badge new">인기</div>
					</div>
					<h3>${likes_list.title}</h3>
					<p>${likes_list.content}</p>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</section>
<section class="padding_bt"><div></div>
</section>
<!-- 추천 end -->

<!-- Loan Section end -->
<!-- <section class="loan-section"> -->
<!-- 	<div class="loan-warp"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="section-title text-white"> -->
<!-- 				<h2>See If You Qualify for a Mortgage</h2> -->
<!-- 				<p>Donec eget efficitur ex. Donec eget dolor vitae eros feugiat tristique id vitae massa. Proin vulputate congue rutrum. Fusce lobortis a enim eget tempus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse potenti. Ut gravida mattis magna, non varius lorem sodales nec. In libero orci, ornare non nisl a, auctor euismod purus. Morbi pretium interdum vestibulum. Fusce nec eleifend ipsum. Sed non blandit tellus. </p> -->
<!-- 			</div> -->
<!-- 			<form class="loan-form"> -->
<!-- 				<input type="text" placeholder="Your income"> -->
<!-- 				<input type="text" placeholder="Amount needed"> -->
<!-- 				<button class="site-btn">Submit</button> -->
<!-- 			</form> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </section> -->
<!-- Loan Section end -->

<%@include file="/WEB-INF/include/footer.jsp" %>