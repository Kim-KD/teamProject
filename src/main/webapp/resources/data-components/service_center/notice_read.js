$(function() {

	// 공지 삭제 확인 창 보여주기
	$('#delete_box_open').on('click', function(){
		$('#delete_box').modal('show');
	})
	
	// 공지 삭제
	$("#delete_btn").on("click", function() {
		var param = {
			no : $("#no").val(),
			user_id : $("#user_id2").val(),
			_csrf:"${_csrf.token}"
		}
		$.ajax({
			url: "notice_delete",
			method: "post",
			data: param,
			success: function() {
				alert("공지가 삭제되었습니다.");
				location.href = "notice_list"
			},error(){
				alert("공지를 삭제하는데 실패했습니다.");
			}
		})
	})
})