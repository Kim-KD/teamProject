<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<script>
//아이디, 비번, 이메일, 전화 등에 대한 정규식을 검증해서 오류가 있을 경우 메시지를 출력
//function check(입력값, 패턴, 에러메시지출력할 곳, 에러메시지)
function check(value, pattern, area, fail_msg) {
	area.text("");
	if(value.length==0) { 
		area.text("필수입력 입니다").css({"color":"red", "font-size":"0.75em"});
		return false;
	} else if(pattern.test(value)==false) { 
		area.text(fail_msg).css({"color":"red", "font-size":"0.75em"});
		return false;
	}
	return true
}

//ajax로 아이디 사용여부 확인
function ajaxCheckId() {
	$.ajax({
		url: "id_chk",
		method: "get",
		data : "user_id=" + $("#user_id").val(),
		success: function(result) {
			console.log($("#user_pwd").val());
			if (result == 1){
				$("#id_msg").text("사용중인 아이디입니다").css({"color":"red", "font-size":"0.75em"});
			}else{
				$("#id_msg").text("좋은 아이디네요").css({"color":"green", "font-size":"0.75em"});
			}
			
		},
		error: function() {
			alert("아이디 중복확인 실패");
		}
	});
}

// ajax : 비동기(지멋대로 병렬 실행) -> 동기화(jQuery then, done, fail)
function ajaxCheckEmail() {
	$.ajax({
		url: "email_chk",
		method: "get",
		data : "user_email=" + $("#user_email").val(),
		success: function(result) {
			console.log(result);
			if (result == 1){
				$("#email_msg").text("사용중인 이메일입니다").css({"color":"red", "font-size":"0.75em"});
			}else{
				$("#email_msg").text("사용가능한 이메일입니다").css({"color":"green", "font-size":"0.75em"});
			}
		},
		error: function() {
			alert("이메일 중복확인 실패");
		}
	})
}

//아이디 확인
function checkUserid() {
	var pattern = /^[A-Za-z][A-Za-z0-9]{7,13}$/;
	return check($("#user_id").val(), pattern, $("#id_msg"), "아이디는 영숫자 8~12자입니다")
}

// 이메일 확인
function checkEmail() {
	// \의 역할 : 원래 의미를 빠져나온다(escape)
	// .은 정규식에서 임의의 글자. 점의 의미로 사용하려면 \.
	var pattern =  /^[A-Za-z][A-Za-z0-9]+@[A-Za-z\.]+$/;
	return check($("#user_email").val(), pattern, $("#email_msg"), "잘못된 이메일입니다");
}

// 이름 확인
function checkIrum() {
	var pattern = /^[가-힣]{2,5}$/;
	return check($("#user_name").val(), pattern, $("#name_msg"), "이름은 한글 2~10자입니다");
}

// 비밀번호 확인
function checkPassword() {
	// 전방탐색 ()는 하나의 조건
	var pattern = /(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{7,13}$/;
	return check($("#user_pwd").val(), pattern, $("#password_msg"), "비밀번호는 영숫자와 특수문자 8~12자입니다")
}

// 비밀번호 일치
function checkPassword2() {
	$("#password_chk_msg").text("");
	var pwd1 = $("#user_pwd").val();
	var pwd2 = $("#pwd_chk").val();
	if(pwd1!==pwd2) {
		$("#password_chk_msg").text("비밀번호가 알치하지 않습니다").css({"color":"red", "font-size":"0.75em"});
		return false;
	}
	return true;
}

// 전화번호 확인
function checkRadio() {
	// 전화번호에 -가 있을 수도 없을 수도 있다
	var inputTel = $("#user_radio").val();
	// -를 찾아서 빈문자열로 변경(삭제)
	// 010-1111-2222 -> 01011112222
	// 옵션 g: 정규식은 찾으면 종료. 끝까지 찾아라
	var tel = inputTel.replace(/\-/g,'');
	$("#user_radio").val(tel);
	var pattern =  /^[0-9]{9,11}$/;
	return check(tel, pattern, $("#radio_msg"), "무선 연락처는 -제외한 숫자 9~11자 입니다.")
}

//전화번호 확인
function checkCable() {
	// 전화번호에 -가 있을 수도 없을 수도 있다
	var inputTel = $("#user_cable").val();
	// -를 찾아서 빈문자열로 변경(삭제)
	// 010-1111-2222 -> 01011112222
	// 옵션 g: 정규식은 찾으면 종료. 끝까지 찾아라
	var tel = inputTel.replace(/\-/g,'');
	$("#user_cable").val(tel);
	var pattern =  /^[0-9]{9,12}$/;
	if ($("#user_cable").val(tel)===""){
		return check(tel, pattern, $("#cable_msg"), "유선 연락처는 -제외한 숫자 9~12자 입니다.");
	}else
		return true;
}

$(function(){
	$("#user_id").on("blur", function() {
		var result = checkUserid();
		if(result==true)
			ajaxCheckId();
	});
	$("#user_email").on("blur", function() {
		var result = checkEmail();
		if(result==true)
			ajaxCheckEmail();
	});
	$("#user_name").on("blur", checkIrum);
	$("#user_pwd").on("blur", checkPassword);
	$("#pwd_chk").on("blur", checkPassword2);
	$("#user_radio").on("blur", checkRadio);
	$("#user_cable").on("blur", checkCable);
	
	$("#join").on("click", function() {
		var r1 = checkUserid();
		var r2 = checkEmail();
		var r3 = checkIrum();
		var r4 = checkPassword();
		var r5 = checkPassword2();
		var r6 = checkRadio();
		var r7 = checkCable();
		var result = r1 && r2 && r3 && r4 && r5 && r6 && r7;
		if(result===true) {
			$.when($.ajax("id_chk?user_id=" + $("#user_id").val()),
				$.ajax("email_chk?user_email=" + $("#user_email").val())
			).done(()=>{
				alert("가입하신 이메일로 가입확인 메일을 보냈습니다.\n보내드린 메일에 링크를 클릭하시고 로그인해주세요.");
				$("#join_form").submit();
			})
		}
	})	
});

</script>

</head>
<body>
	<form id="join_form" action="join" method="post">
	<input type="hidden" id="user_status" name="user_status" value="0">
		<div class="container">		
			<div class="form-group">
				<label for="user_id">아이디</label>&nbsp;
				<span id="id_msg"></span>
				<input type="text" class="form-control" id="user_id" name="user_id" placeholder="8~12자 영어 또는 숫자로 입력하세요.">
			</div>
			<div class="form-group">
				<label for="user_email">이메일</label>&nbsp;
				<span id="email_msg"></span>
				<input type="text" class="form-control" id="user_email" name="user_email" placeholder="ex)example@gmail.com">
			</div>
			<div class="form-group">
				<label for="user_name">이름</label>&nbsp;
				<span id="name_msg"></span>
				<input type="text" class="form-control" id="user_name" name="user_name" placeholder="홍길동">
			</div>
			<div class="form-group">
				<label for="user_pwd">비밀번호</label>&nbsp;
				<span id="password_msg"></span>
				<input type="password" class="form-control" id="user_pwd" name="user_pwd" placeholder="특수문자 포함 8자이상 12자 이하로 입력하세요.">
			</div>
			<div class="form-group">
				<label for="password2">비밀번호 확인</label>&nbsp;
				<span id="password_chk_msg"></span>
				<input type="password" class="form-control" id="pwd_chk" placeholder="특수문자 포함 8자이상 12자 이하로 입력하세요.">
			</div>
			<div class="form-group">
				<label for="user_radio">연락처(무선)</label>&nbsp;
				<span id="radio_msg"></span>
				<input type="text" class="form-control" id="user_radio" name="user_radio" placeholder="'-'를 제외한 무선 연락처 입력">
			</div>
			<div class="form-group">
				<label for="user_cable">연락처(유선)</label>&nbsp;
				<span id="cable_msg"></span>
				<input type="text" class="form-control" id="user_cable" name="user_cable" placeholder="'-'를 제외한 유선 연락처 입력">
			</div>

			<div class="form-group">
				<label for="user_gender">성별</label>&nbsp;
				<span id="gender_msg"></span>
				<div class="btn-group" data-toggle="buttons">
					<label class="btn btn-primary">
						<input type="radio" id="man" autocomplete="off" value="m" name="user_gender">남자
					</label>
					<label class="btn btn-danger">
						<input type="radio" id="woman" autocomplete="off" value="g" name="user_gender">여자
					</label>
				</div>
			</div>
			<div class="form-group">
				<label for="user_job">직업</label>&nbsp;
				<span id="job_msg"></span>
				<input type="text" class="form-control" id="user_job" name="user_job" placeholder="개발자, 기획자, 서버 관리자 등등">
			</div>
			권한 : <select name="authorities">
			<option value="ROLE_USER">사용자</option>
			<option value="ROLE_MANAGER">매니저</option>
			<option value="ROLE_ADMIN">관리자</option>
		</select>
		<input type="hidden" name="_csrf" value="${_csrf.token}"><br>
			<button type="button" class="btn btn-info" id="join">회원가입</button>
		</div>
	</form>
</body>
</html>