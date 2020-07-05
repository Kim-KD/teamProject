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
				url:"find_num",
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
				url:"find_id",
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
				url:"find_pwd",
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
