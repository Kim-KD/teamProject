<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Blog Section end -->
<section class="blog-section spad">

<aside>
	<ul>
		<li><a href="notice_list">공지 사항</a></li>
		<li><a href="#">자주하는 질문</a></li>
		<li><a href="inquiry_list">1:1문의</a></li>
		<li><a href="report_list">게시글 신고</a></li>
	</ul>
</aside>

	<div class="container">
		<div class="section-title">
			<h2>신고 내역</h2>
		</div>
		
		<div>
      <table class="table table-hover">
         <colgroup>
            <col width="40%">
            <col width="30%">
            <col width="20%">
            <col width="10%">
         </colgroup>
         <thead>
            <tr>
               <th>제목</th>
               <th>작성자</th>
               <th>작성 날짜</th>
               <th>진행 상태</th>
            </tr>
         </thead>
         <tbody id="list">
         <c:forEach items="${page.report_list}" var="board">
            <tr>
           	   <td><a href="report_read?no=${board.no}">${board.title}</a></td>
               <td>${board.user_id}</td>
               <td>${board.report_date}</td>
               <td>
               <c:if test="${board.report_status==0}">답변 대기</c:if>
               <c:if test="${board.report_status==1}">답변 완료</c:if>
               </td>
            </tr>
         </c:forEach>
         </tbody>
      </table>
      	<a type="button" class="btn btn-success" href="report_write">문의하기</a>
   </div>
   
   <div style="text-align:center;">
      <ul>
         <c:if test="${page.prev==true}">
            <li><a href="report_list?pageno=${page.startPage-1}">이전</a></li>
         </c:if>
         <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
            <c:choose>
               <c:when test="${page.pageno eq i }">
                  <li class="active">
                     <a href="report_list?pageno=${i}">${i}</a>
                  </li>
               </c:when>
               <c:otherwise>
                  <li><a href="report_list?pageno=${i}">${i}</a></li>
               </c:otherwise>
            </c:choose>
            
         </c:forEach>
         <c:if test="${page.next==true}">
            <li><a href="report_list?pageno=${page.endPage+1}">다음</a></li>
         </c:if>
      </ul>
   </div>
   <form id="search_form" action="#" method="get">
      <input type="text" id="keyword" name="title">
      <button id="search_btn">검색</button>
   </form>
		
</div>
</section>
<!-- Blog Section end -->

