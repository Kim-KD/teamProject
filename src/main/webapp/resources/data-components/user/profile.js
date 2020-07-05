function check(value, pattern, area, fail_msg) {
	area.text("");
	if(pattern.test(value)==false) {
		if(value == "" || "@"){
			return true;
		}else{
			area.text(fail_msg).css({"color":"red", "font-size":"0.75em"});
			return false;
		}
	}
	return true
}

function checkEmail() {
	var pattern =  /^[A-Za-z][A-Za-z0-9\.]+@[A-Za-z\.]+$/;
	var user_email = $("#email1").val()+"@"+$("#email2").val()
	return check(user_email, pattern, $("#email_msg"), "잘못된 이메일입니다");
}

function checkNewPwd() {
	var pattern = /(?=.*[!@#$%^&*])^[A-Za-z0-9!@#$%^&*]{8,10}$/;
	return check($("#user_pwd").val(), pattern, $("#pwd_msg"), "비밀번호는 특수문자포함 영숫자 8~10자입니다")
}

function checkPwd() {
	$("#pwd_check_msg").text("");
	var pwd1 = $("#user_pwd").val();
	var pwd2 = $("#pwd_check").val();
	if(pwd1!==pwd2) {
		$("#pwd_check_msg").text("비밀번호가 일치하지 않습니다").css({"color":"red", "font-size":"0.75em"});
		return false;
	}
	return true;
}

function checkRadio() {
	var inputTel = $("#user_radio").val();
	var tel = inputTel.replace(/\-/g,'');
	$("#user_radio").val(tel);
	var pattern =  /^[0-9]{10,11}$/;
	return check(tel, pattern, $("#radio_msg"), "무선 전화는 숫자 10~11자입니다")
}

function checkCable() {
	var inputTel = $("#user_cable").val();
	var tel = inputTel.replace(/\-/g,'');
	$("#user_cable").val(tel);
	var pattern =  /^[0-9]{9,11}$/;
	return check(tel, pattern, $("#cable_msg"), "유선 전화는 숫자 9~10자입니다")
}

function ajaxEmailCheck() {
	var user_email = $("#email1").val()+"@"+$("#email2").val()
	$.ajax({
		url: "/project/up_email_chk",
		data: "user_email=" + user_email,
		method: "get",
		success:function(result){
			if(result==0){
				$("#email_msg").text("사용가능한 이메일입니다").css({"color":"green", "font-size":"0.75em"});
				return true;
			}else if(result==1){
				$("#email_msg").text("사용중인 이메일입니다").css({"color":"red", "font-size":"0.75em"})
				return false;
			}
		}
	})
}

	// 서버에서 보내온 데이터를 화면에 출력
	function printUser(user) {
		$("#user_name").text(user.user_name);
		$("#user_job").text(user.user_job);
		$("#user_status").val(user.user_status);
		$("#user_radio").val(user.user_radio);
		$("#user_cable").val(user.user_cable);
		$("#user_id").text(user.user_id);
		$("#user_create_day").text(user.user_create_day);
		if(user.user_status=="1"){
			$("#cpn_service_num").text(user.cpn_service_num);
			$("#cpn_bank").text(user.cpn_bank);
			$("#cpn_account").text(user.cpn_account);
		}else{
			$("#cpn_info").hide();
		}
		if(user.user_gender=="m"){
			$("#user_gender").text("남자");
		}
		if(user.user_gender=="g"){
			$("#user_gender").text("여자");
		}
		if(user.user_status=="0"){
			$("#user_status2").text("일반 회원");
		}
		if(user.user_gender=="1"){
			$("#user_status2").text("기업회원");
		}
		if(user.enabled=="true"){
			$("#enabled2").text("활성화").css({"color":"green"});
			$("#enabled").val("1");
		}
		if(user.enabled=="false"){
			$("#enabled2").text("비 활성화").css({"color":"red"});
			$("#enabled").val("0");
		}

		// 이메일을 읽어와 @를 기준으로 분리
		var indexOfAt = user.user_email.indexOf('@');
		var email1 = user.user_email.substr(0, indexOfAt);
		var email2 = user.user_email.substr(indexOfAt+1);
		$("#email1").val(email1);
		$("#email2").val(email2);
			
		// #selectEmail에서 선택한 이메일 서버와 email2에 출력되는 서버를 동기화한다
		var $select = $("#selectEmail").find("option");
		$select.each(function(idx, option) {
			if($(option).text()==email2) {
				$($select[idx]).prop("selected", true);
			}
		});

		var $select = $("#selectBank").find("option");
		$select.each(function(idx, option) {
			if($(option).text()==user.user_bank) {
				$($select[idx]).prop("selected", true);
			}
		});
	}		
	$(function() {
		
		$("#user_pwd").on("blur", function() {
			checkNewPwd();
		});
		$("#pwd_check").on("blur", function() {
			checkPwd();
		});
		$("#user_radio").on("blur", function() {
			checkRadio();
		});
		$("#user_cable").on("blur", function() {
			checkCable();
		});
		$("#email1").on("blur", function() {
			var result = checkEmail();
			if(result==true)
				ajaxEmailCheck();
		})
		$("#email2").on("blur", function() {
			var result = checkEmail();
			if(result==true)
				ajaxEmailCheck();
		})
		
		// Model에 담긴 user를 자바스크립트 객체로 변환 후 출력
		var user = {
			user_name : "${user.user_name}",
			user_gender : "${user.user_gender}",
			user_job : "${user.user_job}",
			user_status : "${user.user_status}",
			user_radio : "${user.user_radio}",
			user_cable : "${user.user_cable}",
			user_id : "${user.user_id}",
			user_email: "${user.user_email}",
			user_create_day: "${user.user_create_day}",
			enabled: "${user.enabled}",
			cpn_service_num: "${user.cpn_service_num}",
			cpn_bank: "${user.cpn_bank}",
			cpn_account: "${user.cpn_account}",
		}
		printUser(user);
			
		// 이메일 선택에 대한 이벤트 핸들러 : 사용자가 선택한 이메일을 email2에 출력
		// 사용자가 선택한 이메일이 직접 입력인 경우 email2 편집 활성화, 아닌 경우 비활성화
		$("#selectEmail").on("change", function() {
			var choice = $("#selectEmail").val();
			if(choice!="직접 입력") {
				$("#email2").val(choice);
				$("#email2").prop("disabled", true);
			}
			if(choice=="직접 입력") {
				// input 상자의 내용이 없어야 placeholder가 출력된다
				$("#email2").val("");
				$("#email2").attr("placeholder", choice);
				$("#email2").prop("disabled", false);
			}
		})
		
		$("#selectBank").on("change", function() {
			var choice = $("#selectBank").val();
			if(choice!="직접 입력") {
				$("#cpn_bank").val(choice);
				$("#cpn_bank").prop("disabled", true);
			}
			if(choice=="직접 입력") {
				// input 상자의 내용이 없어야 placeholder가 출력된다
				$("#cpn_bank").val("");
				$("#cpn_bank").attr("placeholder", choice);
				$("#cpn_bank").prop("disabled", false);
			}
		})

		$("#update").on("click", function() {
			var result1 = checkRadio();
			var result2 = checkCable();
			var result3 = checkEmail();
			var result4 = checkPwd();
			var result5 = checkNewPwd();
			if(result1==false || result2==false || result3==false || result4==false
					|| result5==false){
				alert("입력하신 정보를 확인해주세요");
				return;
			}else{
			var user_email = $("#email1").val()+"@"+$("#email2").val()	
			var $form = $("#updateFrm")
			$("<input>").attr("type","hidden")
				.attr("name","user_email").val(user_email).appendTo($form);
				$.ajax({
					url:"update",
					data: $('#updateFrm').serialize(),
					method:"post",
					success:function() {
						alert("정보를 수정했습니다.");
						location.href="profile_read";
					}, error() {
						alert("정보를 수정하는데 실패했습니다.");
					}
				})
			}
		})
	})