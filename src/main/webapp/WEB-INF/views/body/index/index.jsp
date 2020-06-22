<%@ page import="org.springframework.util.ObjectUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
					<a href="guest_house_read?no=${new_list.no}">
						<c:if test="${new_list.thumbnail != null}">
							<img src="assets/gh_img/${new_list.thumbnail}" alt="">
						</c:if>
						<c:if test="${new_list.thumbnail == null}">
							<img src="assets/gh_img/noimg.jpg" alt="">
						</c:if>
					</a>
						<div class="pi-badge new">인기</div>
					</div>
					<h3>${new_list.title}</h3>
					<p>${new_list.content}</p>
				</div>
			</div>
			</c:forEach>
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
					<a href="guest_house_read?no=${views_list.no}">
						<c:if test="${views_list.thumbnail != null}">
							<img src="assets/gh_img/${views_list.thumbnail}" alt="">
						</c:if>
						<c:if test="${views_list.thumbnail == null}">
							<img src="assets/gh_img/noimg.jpg" alt="">
						</c:if>
					</a>
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
					<a href="guest_house_read?no=${likes_list.no}">
						<c:if test="${likes_list.thumbnail != null}">
							<img src="assets/gh_img/${likes_list.thumbnail}" alt="">
						</c:if>
						<c:if test="${likes_list.thumbnail == null}">
							<img src="assets/gh_img/noimg.jpg" alt="">
						</c:if>
					</a>
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