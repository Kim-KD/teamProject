<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/include/other_header.jsp" %>
<meta charset="UTF-8">
<style>
#findIdAndPwd{padding: 100px}
#sendFindNum{margin-left: 44%; padding: 10px}
</style>
<script>

function check(value, pattern, area, fail_msg) {
	area.text("");
	if(value.length==0) { 
		area.text("필수입력입니다").css({"color":"red", "font-size":"0.75em"});
		return false;
	}
	else if(pattern.test(value)==false) { 
		area.text(fail_msg).css({"color":"red", "font-size":"0.75em"});
		return false;
	}
	return true
}

function checkUserId() {
	var pattern = /^[A-Za-z0-9]{8,10}$/;
	return check($("#user_id").val(), pattern, $("#pwd_id_msg"), "아이디는 영숫자 8~10자입니다");
}

function checkEmail_id() {
	var pattern =  /^[A-Za-z][A-Za-z0-9\.]+@[A-Za-z\.]+$/;
	return check($("#id_user_email").val(), pattern, $("#id_email_msg"), "잘못된 이메일입니다");
}

function checkEmail_pwd() {
	var pattern =  /^[A-Za-z][A-Za-z0-9\.]+@[A-Za-z\.]+$/;
	return check($("#pwd_user_email").val(), pattern, $("#pwd_email_msg"), "잘못된 이메일입니다");
}

function checkName() {
	var pattern = /^[가-힣]{2,10}$/;
	check($("#user_name").val(), pattern, $("#id_name_msg"), "이름은 한글 2~10자입니다");
}

function checkNum() {
	var pattern = /^[0-9]{4}$/;
	return check($("#find_num").val(), pattern, $("#pwd_num_msg"), "인증번호는 숫자 4자 입니다.");
}

$(function(){

	$("#id_user_email").on("blur", function() {
		checkEmail_id();
	});
	$("#user_name").on("blur", function() {
		checkName();
	});
	$("#user_id").on("blur", function() {
		checkUserId();
	});
	$("#pwd_user_email").on("blur", function() {
		checkEmail_pwd();
	});
	$("#find_num").on("blur", function() {
		checkNum();
	});
	
	$("#sendFindNum").on("click",function(){
		var result1 = checkUserId();
		var result2 = checkEmail_pwd();
		if(result1==false || result2==false){
			alert("입력하신 정보를 확인해주세요");
			return;
		}
		else{
			$.ajax({
				url:"/project/find_num",
				data: $('#pwdFrm').serialize(),
				method:"post",
				success:function() {
					alert("인증번호를 보냈습니다.");
				}, error() {
					alert("인증번호를 보내는데 실패했습니다.");
				}
			})
		}
	})

	$("#findIdBtn").on("click",function(){
		var result1 = checkName();
		var result2 = checkEmail_id();
		if(result1==false || result2==false){
			alert("입력하신 정보를 확인해주세요");
			return;
		}else{
			$.ajax({
				url:"/project/find_id",
				data: $('#idFrm').serialize(),
				method:"post",
				success:function() {
					alert("이메일로 아이디를 보냈습니다 이메일을 확인해 주세요.");
				}, error() {
					alert("아이디를 찾는데 실패했습니다.");
				}
			})
		}
	})
		
	$("#findPwdBtn").on("click",function(){
		var result1 = checkUserId();
		var result2 = checkEmail_pwd();
		var result3 = checkNum();
		if(result1==false || result2==false || result3==false){
			alert("입력하신 정보를 확인해주세요");
			return;
		}else{
			$.ajax({
				url:"/project/find_pwd",
				data: $('#pwdFrm').serialize(),
				method:"post",
				success:function() {
					alert("이메일로 임시비밀번호를 보냈습니다 이메일을 확인해 주세요.");
				}, error() {
					alert("비밀번호를 찾는데 실패했습니다.");
				}
			})
		}	
	})
})
</script>
	<section class="site-section" id="findIdAndPwd">
      <div class="container">
        <div class="row">
        <div class="col-lg-6">
            <h2 class="mb-4">아이디 찾기</h2>
            <form class="p-4 border rounded" id="idFrm">
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">E-mail</label>
                  <span id="id_email_msg"></span>
                  <input type="text" id="id_user_email" name="user_email" class="form-control" placeholder="E-mail 입력">
                </div>
              </div>
              <div class="row form-group mb-4">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">이름</label>
                  <span id="id_name_msg"></span>
                  <input type="text" id="user_name" name="user_name" class="form-control" placeholder="이름 입력">
                </div>
              </div>
              <div class="row form-group">
                <div class="col-md-12">
                <input type="hidden" name="_csrf" value="${_csrf.token}"><br>
                  <button type="button" id="findIdBtn" class="btn px-4 btn-primary text-white">아이디 찾기</button>
                </div>
              </div>
            </form>
          </div>
          
          <div class="col-lg-6 mb-5">
            <h2 class="mb-4">비밀번호 찾기</h2>
            <form class="p-4 border rounded" id="pwdFrm">
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">아이디</label>
                  <span id="pwd_id_msg"></span>
                  <input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디 입력">
                </div>
              </div>
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">E-mail</label>
                  <span id="pwd_email_msg"></span>
                  <input type="text" id="pwd_user_email" name="user_email" class="form-control" placeholder="E-mail 입력">
                </div>
              </div>
              <div class="row form-group mb-4">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">인증번호</label>
                  <span id="pwd_num_msg"></span>
                  <input type="text" id="find_num" name="find_num" class="form-control" placeholder="인증번호 입력">
                </div>
              </div>
              <div class="row form-group">
                <div class="col-md-12">
                <input type="hidden" name="_csrf" value="${_csrf.token}"><br>
                  <button type="button" id="findPwdBtn" class="btn px-4 btn-primary text-white">비밀번호 찾기</button>
                  <button type="button" id="sendFindNum">인증번호 받기</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
<%@include file="/WEB-INF/include/footer.jsp" %>