$(function(){
	$("#title").val("${board.title}");
	$("#name").val("${board.name}");
	$("#city").val("${board.city}");
	$("#address").val("${board.address}");
	$("#admission").val("${board.admission}");
	$("#opentime").val("${board.opentime}");
	
	// 게시글 수정
	$("#update_btn").on("click", function() {
		$.ajax({
			url: "trip_update",
			method: "post",
			data: $("#update_form").serialize(),
			success: function() {
				location.href="/trip_read?no="+"${board.no}"
			},error(){
				alert("게시글을 수정하는데 실패했습니다.");
			}
		});
	});
	// 게시글 수정 취소 확인 창 보여주기
	$('#cancel_box_open').on('click', function(){
		$('#cancel_box').modal('show');
	});
	
	// 게시글 수정 취소
	$("#cancel_btn").on("click", function() {
		location.href="/trip_read?no="+"${board.no}"
	});
});