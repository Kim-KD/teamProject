<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="resources/data-components/trip/trip_list.js"></script>

<style>
	#writeBtn{position:relative; left:500px;}
</style>
<!-- Blog Section end -->
<section class="blog-section spad">
	<div class="container">
		<div class="section-title">
			<h2>관광 명소</h2>
		</div>
		<input type="hidden" id="cnt" value="1">
		<div class="row" id="trip_list">
         <c:forEach items="${page.trip_list}" var="board" varStatus="cnt">
			<div class="col-lg-4 col-md-6" id="trip_board">
				<div class="blog-item">
					<a href="trip_read?no=${board.no}"><img src="assets/img/blog/1.jpg" alt="이미지를 불러 올 수 없습니다."></a>
					<div class="blog-text">
						<div class="blog-date">${board.w_date}</div>
						<h4><a href="trip_read?no=${board.no}">${board.name}</a></h4>
						<p><a href="trip_read?no=${board.no}">${board.title}</a></p>
						<a href="trip_read?no=${board.no}" class="readmore-btn">자세히 보기</a>
					</div>
				</div>
			</div>
         </c:forEach>
         </div>
        
	<div style="text-align:center;">
	<div class="site-pagination">
         <c:if test="${page.prev==true}">
            <a href="trip_list?pageno=${page.startPage-1}">이전</a>
         </c:if>
         <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
            <c:choose>
               <c:when test="${page.pageno eq i }">
                     <a class="active" href="trip_list?pageno=${i}">${i}</a>
               </c:when>
               <c:otherwise>
                  <a href="trip_list?pageno=${i}">${i}</a>
               </c:otherwise>
            </c:choose>
            
         </c:forEach>
         <c:if test="${page.next==true}">
            <a href="trip_list?pageno=${page.endPage+1}">다음</a>
         </c:if>
      <button id="writeBtn" class="btn px-4 btn-primary text-white">글 작성</button>
   </div>
   </div>
</div>
</section>
<!-- Blog Section end -->

