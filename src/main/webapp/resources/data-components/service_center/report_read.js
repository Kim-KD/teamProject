$(function() {

	if(isLogin===true && $("#user_id2").val()!==loginId) {
		$('#cancel_box_open').hide();
		$('#update_btn').hide();
	}
	if ($("#report_status2").val()=="1") {
		$('#update_btn').hide();
	}

	// 신고 글 삭제 확인 창 보여주기
	$('#delete_box_open').on('click', function(){
		$('#delete_box').modal('show');
	})
	
	// 신고 취소
	$("#delete_btn").on("click", function() {
		var param = {
			no : $("#no").val(),
			user_id : $("#user_id2").val(),
			_csrf:"${_csrf.token}"
		}
		$.ajax({
			url: "report_delete",
			method: "post",
			data: param,
			success: function() {
				alert("신고 글이 삭제되었습니다.");
				location.href = "report_list"
			},error(){
				alert("신고 글을 삭제하는데 실패했습니다.");
			}
		})
	})
})
