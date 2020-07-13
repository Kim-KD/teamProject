$(function() {
	
	$("#answer_btn").on("click", function() {
		var param = {
				no : $("#no").val(),
				inquiry_status : '1',
				answer : $("#answer").val(),
				_csrf:"${_csrf.token}"
			}
		$.ajax({
			url:"admin_inquiry_update",
			data: param,
			method:"post",
			success:function() {
				alert("답변 완료.");
			}, error() {
				alert("답변 실패했습니다.");
			}
		})
	})
	
	$("#answer_update_btn").on("click", function() {
		var param = {
				no : $("#no").val(),
				answer : $("#answer").val(),
				_csrf:"${_csrf.token}"
			}
		$.ajax({
			url:"admin_inquiry_update",
			data: param,
			method:"post",
			success:function() {
				alert("답변 수정 완료.");
			}, error() {
				alert("답변 수정 실패했습니다.");
			}
		})
	})
})
