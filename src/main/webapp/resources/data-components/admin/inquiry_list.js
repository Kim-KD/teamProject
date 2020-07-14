$(function() {
	
	if($("#inquiry_status").val()=="0") {
		$("#page_title").text("답변 대기 목록");
	}else if($("#inquiry_status").val()=="1") {
		$("#page_title").text("답변 완료 목록");
	}
	else{
		return null;
	}
})
