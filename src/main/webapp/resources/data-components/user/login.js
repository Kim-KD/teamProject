//로그인 폼 검증[s]
function L_validation(){
	 var user_id = $("#user_id").val();
	 // 정규식
	 var regExp_id = /^[a-z]+[a-z0-9]{5,19}$/g;

	 if(!regExp_id.test(user_id)) {
		$('.focus-input50').css('border','1px solid red');
		$("#warning_id").css('color','red').text('6~20자 영어 또는 숫자로 입력하세요.');
	    $('#result').removeClass();
		$("#user_id").val('');
		$("#user_id").focus();
		return false;
	 }
}
// 로그인 폼 검증[e]

$(function(){
	$("#user_id").on('keyup keydown', function(){
		if($("#user_id").val().length > 0) {
			$('.focus-input50').css('border','1px solid #827ffe');
			$("#warning_id").empty();
		}
	});
	
	// 로그인 실패 메세지
	var msg = $("#msg").val();
	console.log(msg);
	if(msg!="") {
		alert(msg);
	}
});