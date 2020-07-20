$(function() {
	
	if(document.location.href.split("project/")[1]=="wait_list") {
		$("#page_title").text("문의 답변 대기 목록");
	}else if(document.location.href.split("project/")[1]=="success_list") {
		$("#page_title").text("문의 답변 완료 목록");
	}
	else{
		return null;
	}
})
