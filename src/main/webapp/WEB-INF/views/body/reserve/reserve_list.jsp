<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
$(function(){
	
})
</script>
<!-- Blog Section end -->
<section class="blog-section spad">
	<div class="container">
		<div class="section-title">
			<h2>게스트 하우스 예약 내역</h2>
		</div>
		
		<div>
      <table class="table table-hover">
         <colgroup>
            <col width="50%">
            <col width="20%">
            <col width="10%">
            <col width="10%">
            <col width="10%">
         </colgroup>
         <thead>
            <tr>
               <th>게스트 하우스 이름</th>
               <th>예약 상세 정보</th>
               <th>예약일</th>
               <th>체크인 날짜</th>
               <th>진행 상태</th>
            </tr>
         </thead>
         <tbody id="list">
         <c:forEach items="${page.reserve_list}" var="board">
            <tr>
           	   <td><a href="guest_house_read?no=${board.no}">${board.name}</a></td>
               <td>예약 번호 : ${board.rno}<br><a href="reserve_read?rno=${board.rno}">자세히 보기</a></td>
               <td>${board.reserve_date}</td>
               <td>${board.check_in}</td>
               <td>
               <c:if test="${board.reserve_status==0}">예약 취소</c:if>
               <c:if test="${board.reserve_status==1}">예약 대기</c:if>
               <c:if test="${board.reserve_status==2}">예약 완료</c:if>
               </td>
            </tr>
         </c:forEach>
         </tbody>
      </table>
   </div>
   
   <div style="text-align:center;">
      <ul class="pagination">
         <c:if test="${page.prev==true}">
            <li><a href="reserve_list?pageno=${page.startPage-1}">이전</a></li>
         </c:if>
         <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
            <c:choose>
               <c:when test="${page.pageno eq i }">
                  <li class="active">
                     <a href="reserve_list?pageno=${i}">${i}</a>
                  </li>
               </c:when>
               <c:otherwise>
                  <li><a href="reserve_list?pageno=${i}">${i}</a></li>
               </c:otherwise>
            </c:choose>
            
         </c:forEach>
         <c:if test="${page.next==true}">
            <li><a href="reserve_list?pageno=${page.endPage+1}">다음</a></li>
         </c:if>
      </ul>
   </div>
		
</div>
</section>
<!-- Blog Section end -->

