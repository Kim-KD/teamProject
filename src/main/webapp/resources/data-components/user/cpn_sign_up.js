/* //아이디, 비번, 이메일, 전화 등에 대한 정규식을 검증해서 오류가 있을 경우 메시지를 출력
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
}); */

// -------------------------------------------------------------

// ID 중복체크 [s]
function idcheckbtn() {
	var user_id = $("#user_id").val();
	var regExp_id = /^[a-z]+[a-z0-9]{5,19}$/g;
	var _csrf = $("#_csrf").val();
	
	if(!regExp_id.test(user_id)) {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_id").css('color','red').text('6~20자 영어 또는 숫자로 다시 입력해주세요.');
		$('.login50-form-btn').css('background-color','red');
		$("#user_id").val('');
		$("#user_id").focus();
		return false;
	} else {
		$.ajax({
			url : "id_chk",
			type : 'POST',
			dataType : "json",
			data : {"user_id" : user_id, "_csrf" : _csrf},
			success : function(result) {
				if(result == 1) {
					alert('중복된 아이디입니다.');
					$("#user_id").val('');
					$("#user_id").focus();
				} else {
					alert('사용가능한 아이디입니다.');
					$('#user_id').attr('readonly','readonly');
					$('.login50-form-btn').css('background-color','#66D37E');
					$('#idcheckicon').removeClass();
					$('#idcheckicon').addClass('fa fa-check');
					$('#idcheckbtn').removeAttr("onclick");
					$('#id_validation').val('1');
				}
			}
		});
	}
}
//ID 중복체크 [e]

// Email 중복체크 [s]
function emailcheckbtn() {
	var user_email = $("#user_email").val();
	var regExp_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var _csrf = $("#_csrf").val();
	
	if(!regExp_email.test(user_email)) {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_email").css('color','red').text('이메일 형식으로 입력하세요.');
		$('.email-form-btn').css('background-color','red');
		$("#user_email").val('');
		$("#user_email").focus();
		return false;
	} else {
		$.ajax({
			url: "email_chk",
			type : 'POST',
			dataType : "json",
			data : {"user_email" : user_email, "_csrf" : _csrf},
			success: function(result) {
				if(result == 1) {
					alert("중복된 이메일입니다.");
					$("#user_email").val('');
					$("#user_email").focus();
				} else {
					alert('사용가능한 이메일입니다.');
					$('#user_email').attr('readonly','readonly');
					$('.email50-form-btn').css('background-color','#66D37E');
					$('#emailcheckicon').removeClass();
					$('#emailcheckicon').addClass('fa fa-check');
					$('#emailcheckbtn').removeAttr("onclick");
					$('#email_validation').val('1');
				}
			}
		});
	}
}
// Email 중복체크 [e]

// 비밀번호 체크 font-awesome
$(function(){
	$('#user_pwd').keyup(function() {
		$('#result').addClass('fa fa-cog fa-spin').css("color","#337ab7");
	});
	
	$('#pwd_chk').keyup(function() {
		if($('#user_pwd').val()!=$('#pwd_chk').val()) {
			$('#result').removeClass();
			$('#result').addClass('fa fa-close').css("color","#d9534f");
		} else {
			$('#result').removeClass();
			$('#result').addClass('fa fa-check').css("color","#66D37E");
		}
	});
}); 
// 비밀번호 체크 font-awesome end

// 회원등록 폼 검증[s]
function F_validation(){
	var user_id = $("#user_id").val();
	var user_pwd = $("#user_pwd").val();
	var pwd_chk = $("#pwd_chk").val();
	var user_name = $("#user_name").val();
	var user_email = $("#user_email").val();
	var user_radio = $("#user_radio").val();
	var user_gender = $("#user_gender option:selected").val();
	var user_job = $("#user_job").val();
	var id_validation = $("#id_validation").val();
	var email_validation = $("#email_validation").val();
	var cpn_service_num = $("#cpn_service_num").val();
	var cpn_bank = $("#cpn_bank").val();
	var cpn_account = $("#cpn_account").val();
	
	// 정규식
	var regExp_id = /^[a-z]+[a-z0-9]{5,19}$/g;
	var regExp_pw = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;
	var regExp_name = /^[가-힣]{2,4}$/;
	var regExp_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(!regExp_id.test(user_id)) {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_id").css('color','red').text('6~20자 영어 또는 숫자로 입력하세요.');
		$("#user_id").val('');
		$("#user_id").focus();
		return false;
	} else if(!regExp_pw.test(user_pwd)) {
		$('.focus-input50').css('border','1px solid red');
		$('#warning_pw').css('color','red').text('특수문자 포함 8자이상 16자 이하로 입력하세요.');
		$("#user_pwd").val('');
		$("#pwd_chk").val('');
		$("#user_pwd").focus();
		return false;
	} else if(pwd_chk.length == 0) {
		$('.focus-input50').css('border','1px solid red');
		$('#warning_pw').css('color','red').text('비밀번호를 다시 입력하세요.');
		$("#pwd_chk").focus();
		return false;
	} else if(user_pwd != pwd_chk) {
		$('.focus-input50').css('border','1px solid red');
		$('#warning_pw').css('color','red').text('비밀번호가 일치하지않습니다.');
		$("#user_pwd").val('');
		$("#pwd_chk").val('');
		$("#user_pwd").focus();
		return false;
	} else if(!regExp_email.test(user_email)) {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_email").css('color','red').text('이메일 형식으로 입력하세요.');
		$("#user_email").val('');
		$("#user_email").focus();
		return false;
	} else if(!regExp_name.test(user_name)) {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_name").css('color','red').text('2-4자 한글만 입력하세요.');
		$("#user_name").val('');
		$("#user_name").focus();
		return false;
	} else if(user_radio == '') {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_radio").css('color','red').text('핸드폰 번호를 입력해주세요.');
		$("#user_radio").val('');
		$("#user_radio").focus();
		return false;
	} else if(user_gender == '') {
		$('.focus-gender').css('border','1px solid red');
		$("#warning_gender").css('color','red').text('성별을 선택해주세요.');
		$("#user_gender").focus();
		return false;
	} else if(user_job == '') {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_job").css('color','red').text('직업을 적어주세요.');
		$("#user_job").val('');
		$("#user_job").focus();
		return false;
	} else if(cpn_service_num == '') {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_service_num").css('color','red').text('사업자번호를 입력해주세요.');
		$("#cpn_service_num").val('');
		$("#cpn_service_num").focus();
		return false;
	} else if(cpn_bank == '') {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_bank").css('color','red').text('은행을 입력해주세요');
		$("#cpn_bank").val('');
		$("#cpn_bank").focus();
		return false;
	} else if(cpn_account == '') {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_account").css('color','red').text('계좌번호를 입력해주세요.');
		$("#cpn_account").val('');
		$("#cpn_account").focus();
		return false;
	} else if(id_validation == "0") {
		alert("아이디 중복확인은 필수입니다.");
		$("#uid").focus();
		return false;
	} else if(email_validation == "0") {
		alert("이메일 중복확인은 필수입니다.");
		$("#uid").focus();
		return false;
	}
}
// 회원등록 폼 검증[e]

// out focus 처리[s]
$(function(){	
	$('#user_id').blur(function(){
		if($("#id_validation").val() == 1) {
			$('.login50-form-btn').css('background-color','#66d37e');
		} else {
			$('.focus-input50').css('border','1px solid #827ffe');
			$('.login50-form-btn').css('background-color','#7300fb');
		}
	});
	$('#user_email').blur(function(){
		if($("#email_validation").val() == 1) {
			$('.email50-form-btn').css('background-color','#66d37e');
		} else {
			$('.focus-input50').css('border','1px solid #827ffe');
			$('.email50-form-btn').css('background-color','#7300fb');
		}
	});
	$('#user_pwd').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
		$('#result').removeClass();
	});
	$('#pwd_chk').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
		$('#result').removeClass();
	});
	$('#user_name').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
	});
	$('#user_radio').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
	});
	$('#user_gender').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
	});
	$('#user_job').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
	});
	$('#cpn_service_num').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
	});
	$('#cpn_bank').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
	});
	$('#cpn_account').blur(function(){
		$('.focus-input50').css('border','1px solid #827ffe');
	});
});
// out focus 처리 [e]

// keyup, keydown 되었을때, 메세지 제거
$(function(){
	$("#user_id").on('keyup keydown', function(){
		if($("#user_id").val().length > 0) {
			$('.focus-input50').css('border','1px solid #827ffe');
			$('.login50-form-btn').css('background-color','#7300fb');
			$("#warning_id").empty();			
		}
	});
	$("#user_email").on('keyup keydown', function(){
		if($("#user_email").val().length > 0) {
			$("#warning_email").empty();			
		}
	});
	
	$("#user_pwd").on('keyup keydown', function(){
		if($("#user_pwd").val().length > 0) {
			$("#warning_pw").empty();			
		}
	});
	$("#pwd_chk").on('keyup keydown', function(){
		if($("#pwd_chk").val().length > 0) {
			$("#warning_pw").empty();			
		}
	});
	$("#user_name").on('keyup keydown', function(){
		if($("#user_name").val().length > 0) {
			$("#warning_name").empty();			
		}
	});
	$("#user_radio").on('keyup keydown', function(){
		if($("#user_radio").val().length > 0) {
			$("#warning_radio").empty();			
		}
	});
	$("#user_job").on('keyup keydown', function(){
		if($("#user_job").val().length > 0) {
			$("#warning_job").empty();			
		}
	});
	$("#cpn_service_num").on('keyup keydown', function(){
		if($("#cpn_service_num").val().length > 0) {
			$("#warning_service_num").empty();			
		}
	});
	$("#cpn_bank").on('keyup keydown', function(){
		if($("#cpn_bank").val().length > 0) {
			$("#warning_bank").empty();			
		}
	});
	$("#cpn_account").on('keyup keydown', function(){
		if($("#cpn_account").val().length > 0) {
			$("#cpn_account").empty();			
		}
	});
});
//keyup, keydown 되었을때, 메세지 제거 [e]