$(function() {
	if(document.location.href.split("project/")[1]=="report_wait_list") {
		$("#page_title").text("신고 답변 대기 목록");
	}else if(document.location.href.split("project/")[1]=="report_success_list") {
		$("#page_title").text("신고 답변 완료 목록");
	}
	else{
		return null;
	}
})
