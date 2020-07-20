$(function() {
	if($("#report_status_val").val()=="0") {
		CKEDITOR.replace("answer",{
			filebrowserUploadUrl : "/guehamo/imgupload?_csrf=${_csrf.token}"
		})
	}
	$("#answer_btn").on("click", function() {
		var param = {
				no : $("#no").val(),
				report_status : '1',
				answer : CKEDITOR.instances.answer.getData(),
				_csrf:"${_csrf.token}"
			}
		$.ajax({
			url:"admin_report_update",
			data: param,
			method:"post",
			success:function() {
				location.reload(true);
				alert("답변 완료.");
			}, error() {
				alert("답변 실패했습니다.");
			}
		})
	})
	
	$("#answer_update_btn").on("click", function() {
		var text = $("#answer_area").text();
		$("#answer_area").text("");
		$("#answer_area").append("<textarea id='answer_update'>"+text+"</textarea>");
		$("#btn_area").append("<button class='btn btn-success' onclick='answer_update()'>수정하기</button>");
		$(this).hide();
		
		CKEDITOR.replace("answer_update",{
			filebrowserUploadUrl : "/guehamo/imgupload?_csrf=${_csrf.token}"
		})
	})
})

function answer_update(){
	var param = {
			no : $("#no").val(),
			answer : CKEDITOR.instances.answer_update.getData(),
			_csrf:"${_csrf.token}"
		}
	$.ajax({
		url:"admin_report_update",
		data: param,
		method:"post",
		success:function() {
			location.reload(true);
		}, error() {
			alert("답변 수정 실패했습니다.");
		}
	})
}
