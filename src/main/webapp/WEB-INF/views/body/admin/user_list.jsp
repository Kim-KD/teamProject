<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="resources/data-components/admin/user_list.js"></script>

<!-- Blog Section end -->
<section class="blog-section spad">
<aside>
	<ul>
		<li><a href="user_list">일반 회원 관리</a></li>
		<li><a href="cpn_list">기업 회원 관리</a></li>
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
            <col width="15%">
            <col width="15%">
            <col width="20%">
            <col width="15%">
            <col width="15%">
            <col width="20%">
         </colgroup>
         <thead>
            <tr>
               <th>유저 아이디</th>
               <th>유저 이름</th>
               <th>E-mail</th>
               <th>무선 전화</th>
               <th>유선 전화</th>
               <th>계정 상태</th>
            </tr>
         </thead>
         <tbody id="list">
         <c:forEach items="${page.user_list}" var="board">
            <tr>
           	   <td><a href="user_read?user_id=${board.user_id}">${board.user_id}</a></td>
               <td>${board.user_name}</td>
               <td>${board.user_email}</td>
               <td>${board.user_radio}</td>
               <td>${board.user_cable}</td>
               <td>
               <c:if test="${board.enabled==false}">비활성화</c:if>
               <c:if test="${board.enabled==true}">활성화</c:if>
               </td>
            </tr>
            <input type="hidden" id="user_status" value="${board.user_status}">
         </c:forEach>
         </tbody>
      </table>
   </div>
   
	<div>
	</div>
   
   <div style="text-align:center;">
<!--       <ul class="pagination"> -->
		<ul>
         <c:if test="${page.prev==true}">
            <li><a href="user_list?pageno=${page.startPage-1}">이전</a></li>
         </c:if>
         <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
            <c:choose>
               <c:when test="${page.pageno eq i }">
                  <li class="active">
                     <a href="user_list?pageno=${i}">${i}</a>
                  </li>
               </c:when>
               <c:otherwise>
                  <li><a href="user_list?pageno=${i}">${i}</a></li>
               </c:otherwise>
            </c:choose>
            
         </c:forEach>
         <c:if test="${page.next==true}">
            <li><a href="user_list?pageno=${page.endPage+1}">다음</a></li>
         </c:if>
      </ul>
      <form id="search_form" action="#" method="get">
      <input type="text" id="keyword" name="user_id">
      <button id="search_btn">검색</button>
      </form>
   </div>
		
</div>
</section>
<!-- Blog Section end -->

