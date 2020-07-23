<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="resources/data-components/admin/trip_list.js"></script>

<!-- Blog Section end -->
<section class="blog-section spad">
<aside>
	<ul>
		<li><a href="guest_on_list">게스트 하우스 공개 게시글 관리</a></li>
		<li><a href="guest_off_list">게스트 하우스 비공개 게시글 관리</a></li>
		<li><a href="trip_on_list">관광명소 공개 게시글 관리</a></li>
		<li><a href="trip_off_list">관광명소 비공개 게시글 관리</a></li>
		<li><a href="user_list">일반 회원 관리</a></li>
		<li><a href="cpn_list">기업 회원 관리</a></li>
		<li><a href="guest_list">일반 회원 관리</a></li>
		<li><a href="trip_list">기업 회원 관리</a></li>
		<li><a href="wait_list">문의 답변 대기</a></li>
		<li><a href="success_list">문의 답변 완료</a></li>
		<li><a href="report_wait_list">신고 답변 대기</a></li>
		<li><a href="report_success_list">신고 답변 완료</a></li>
		<li><a href="notice_write">공지 사항 작성</a></li>
	</ul>
</aside>
	<div class="container">
		<div class="section-title">
			<h2 id="page_title"></h2>
		</div>
		
		<div>
      <table class="table table-hover">
         <colgroup>
         	<col width="10%">
            <col width="40%">
            <col width="20%">
            <col width="15%">
            <col width="15%">
         </colgroup>
         <thead>
            <tr>
               <th>선택</th>
               <th>제목</th>
               <th>유저 아이디</th>
               <th>작성 날짜</th>
               <th>공개 여부</th>
            </tr>
         </thead>
         <tbody id="list">
         <c:forEach items="${page.trip_list}" var="board">
            <tr>
            	<td><input type="checkbox" name="no" data-no="${board.no}" data-on_of="${board.on_off}"></td>
           	   <td><a href="trip_read?no=${board.no}">${board.title}</a></td>
           	   <td><a href="user_read?user_id=${board.user_id}">${board.user_id}</a></td>
               <td>${board.w_date}</td>
               <td class="update_td">
		       	<select class="selectOnoff" name="on_off" data-no="${board.no}">
			       	<c:if test="${board.on_off=='y'}">
				       	<option selected="selected" value="y">공개</option>
				       	<option value="n">비공개</option>
			       	</c:if>
	               	<c:if test="${board.on_off=='n'}">비공개
	               		<option selected="selected" value="n">비공개</option>
			       		<option value="y">공개</option>
	               	</c:if>
				</select>
               </td>
            </tr>
         </c:forEach>
         </tbody>
      </table>
   </div>
   
	<div>
		<button type="button" class="btn btn-success" id="update">수정하기</button>
		<button type="button" class="btn btn-danger" id="delete">삭제하기</button>
	</div>
   
   <div style="text-align:center;">
		<div class="site-pagination">
         <c:if test="${page.prev==true}">
            <a class="before_on" href="trip_on_list?pageno=${page.startPage-1}">이전</a>
            <a class="before_off" href="trip_off_list?pageno=${page.startPage-1}">이전</a>
         </c:if>
         <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
            <c:choose>
               <c:when test="${page.pageno eq i }">
                   	<a class="now_on" class="active" href="trip_on_list?pageno=${i}">${i}</a>
                   	<a class="now_off" class="active" href="trip_off_list?pageno=${i}">${i}</a>
               </c:when>
               <c:otherwise>
               		<a class="different_on" href="trip_on_list?pageno=${i}">${i}</a>
               		<a class="different_off" href="trip_off_list?pageno=${i}">${i}</a>
               </c:otherwise>
            </c:choose>
         </c:forEach>
         <c:if test="${page.next==true}">
           	<a class="after_on" href="trip_on_list?pageno=${page.endPage+1}">다음</a>
           	<a class="after_off" href="trip_off_list?pageno=${page.endPage+1}">다음</a>
         </c:if>
      </div>
      <form id="search_form" action="#" method="get">
      <input type="text" id="keyword" name="user_id">
      <button id="search_btn">검색</button>
      </form>
   </div>
		
</div>
</section>
<!-- Blog Section end -->

