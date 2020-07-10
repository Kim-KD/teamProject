<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Blog Section end -->
<section class="blog-section spad">

	<div class="container">
		<div class="section-title">
			<h2>유저 회원 관리</h2>
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
         </c:forEach>
         </tbody>
      </table>
   </div>
   
   <div style="text-align:center;">
      <ul class="pagination">
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
   </div>
		
</div>
</section>
<!-- Blog Section end -->

