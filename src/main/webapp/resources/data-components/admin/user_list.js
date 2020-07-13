$(function() {
	
	if($("#user_status").val()=="0") {
		$("#page_title").text("일반 회원 관리");
	}else if($("#user_status").val()=="1") {
		$("#page_title").text("기업 회원 관리");
	}
	else{
		return null;
	}
})
