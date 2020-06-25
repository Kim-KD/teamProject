<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="property-section">
	<div class="container">
		<div class="section-title">
			<h2>검색 목록</h2>
		</div>
		<c:if test="${search_data != null}">
			<div class="row" id="slide">
			<c:forEach items="${search_data}" var="search_data">
				<div class="col-lg-4">
					<div class="property-item">
						<div class="pi-image">
						<a href="guest_house_read?no=${search_data.no}">
							<c:if test="${search_data.thumbnail != null}">
								<img src="assets/main/img/property/${search_data.thumbnail}" alt="">
							</c:if>
							<c:if test="${search_data.thumbnail == null}">
								<img src="assets/main/img/property/6.png" alt="">
							</c:if>
						</a>
						</div>
						<h3>${search_data.title}</h3>
						<p>${search_data.content}</p>
					</div>
				</div>
			</c:forEach>
			</div>
		</c:if>
		
		<c:if test="${guest_house_area_search_data != null || trip_area_search_data != null}">
			<h2>숙소</h2>
			<div class="row" id="slide">
			<c:forEach items="${guest_house_area_search_data}" var="guest_house_area_search_data">
				<div class="col-lg-4">
					<div class="property-item">
						<div class="pi-image">
						<a href="guest_house_read?no=${guest_house_area_search_data.no}">
							<c:if test="${guest_house_area_search_data.thumbnail != null}">
								<img src="assets/main/img/property/${guest_house_area_search_data.thumbnail}" alt="">
							</c:if>
							<c:if test="${guest_house_area_search_data.thumbnail == null}">
								<img src="assets/main/img/property/6.png" alt="">
							</c:if>
						</a>
						</div>
						<h3>${guest_house_area_search_data.title}</h3>
						<p>${guest_house_area_search_data.content}</p>
					</div>
				</div>
			</c:forEach>
			</div>
			
			<br><br><h2>관광</h2>
			<div class="row" id="slide">
			<c:forEach items="${trip_area_search_data}" var="trip_area_search_data">
				<div class="col-lg-4">
					<div class="property-item">
						<div class="pi-image">
						<a href="guest_house_read?no=${trip_area_search_data.no}">
							<c:if test="${trip_area_search_data.thumbnail != null}">
								<img src="assets/main/img/property/${trip_area_search_data.thumbnail}" alt="">
							</c:if>
							<c:if test="${trip_area_search_data.thumbnail == null}">
								<img src="assets/main/img/property/6.png" alt="">
							</c:if>
						</a>
						</div>
						<h3>${trip_area_search_data.title}</h3>
						<p>${trip_area_search_data.content}</p>
					</div>
				</div>
			</c:forEach>
			</div>
		</c:if>
	</div>
</section>