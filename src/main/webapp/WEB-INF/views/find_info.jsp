<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/other_header.jsp" %>
<meta charset="UTF-8">
<style>
#findIdAndPwd{padding: 100px}
#sendFindNum{margin-left: 44%; padding: 10px}
</style>
<script>
$(function(){
	$("#sendFindNum").on("click",function(){
		$.ajax({
			url:"/project/find_num",
			data: $('#findPwd').serialize(),
			method:"post",
			success:function() {
				alert("인증번호를 보냈습니다.");
			}, error() {
				alert("인증번호를 보내는데 실패했습니다.");
			}
		})
	})
})
</script>
	<section class="site-section" id="findIdAndPwd">
      <div class="container">
        <div class="row">
        <div class="col-lg-6">
            <h2 class="mb-4">아이디 찾기</h2>
            <form action="#" class="p-4 border rounded" id="findId">
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">E-mail</label>
                  <input type="text" id="user_email" name="user_email" class="form-control" placeholder="E-mail 입력">
                </div>
              </div>
              <div class="row form-group mb-4">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">이름</label>
                  <input type="password" id="user_name" name="user_name" class="form-control" placeholder="이름 입력">
                </div>
              </div>
              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="아이디 찾기" class="btn px-4 btn-primary text-white">
                </div>
              </div>
            </form>
          </div>
          
          <div class="col-lg-6 mb-5">
            <h2 class="mb-4">비밀번호 찾기</h2>
            <form action="#" class="p-4 border rounded" id="findPwd">
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">아이디</label>
                  <input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디 입력">
                </div>
              </div>
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">E-mail</label>
                  <input type="password" id="user_email" name="user_email" class="form-control" placeholder="E-mail 입력">
                </div>
              </div>
              <div class="row form-group mb-4">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">인증번호</label>
                  <input type="password" id="find_num" name="find_num" class="form-control" placeholder="인증번호 입력">
                </div>
              </div>
              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="비밀번호 찾기" class="btn px-4 btn-primary text-white">
                  <button type="button" id="sendFindNum">인증번호 받기</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
<%@include file="/WEB-INF/include/footer.jsp" %>