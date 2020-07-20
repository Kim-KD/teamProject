$(function(){
	CKEDITOR.replace("content",{
		filebrowserUploadUrl : "/guehamo/imgupload?_csrf=${_csrf.token}"
	})

	// 신고 수정
	$("#update_btn").on("click", function() {
		var param = {
			no : $("#no").val(),
			user_id : $("#user_id2").val(),
			title : $("#title").val(),
			content : CKEDITOR.instances.content.getData(),
			_csrf:"${_csrf.token}"
		}
		$.ajax({
			url: "report_update",
			method: "post",
			data: param,
			success: function() {
				location.href="report_read?no="+$("#no").val()
			},error(){
				alert("게시글을 수정하는데 실패했습니다.");
			}
		})
	})

	// 신고 수정 취소 확인 창 보여주기
	$('#cancel_box_open').on('click', function(){
		$('#cancel_box').modal('show');
	})
	
	// 신고 수정 취소
	$("#cancel_btn").on("click", function() {
		location.href="report_read?no="+$("#no").val();
	})
})
