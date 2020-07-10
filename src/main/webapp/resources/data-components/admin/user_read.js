$(function() {
	
	if($("#cpn_service_num").text()==""){
		$("#cpn_info").hide();
		$("#back").attr('href','user_list');
	}else{
		$("#back").attr('href','cpn_list');
	}
	
	$("#update").on("click", function() {
		var param = {
				user_id : $("#user_id").text(),
				enabled : $("#selectEnabled").val(),
				_csrf:"${_csrf.token}"
			}
		$.ajax({
			url:"enabled_update",
			data: param,
			method:"post",
			success:function() {
				alert("계정 상태를 수정했습니다.");
			}, error() {
				alert("계정 상태를 수정하는데 실패했습니다.");
			}
		})
	})
})
