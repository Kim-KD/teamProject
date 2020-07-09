function S_search() {
	var keyword = $("#keyword").val();
	var search_type = $('.searchTag.sp_active').text();
	
	if(keyword == '') {
		alert("검색어를 입력해주세요.");
		return false;
	} else if(search_type == "숙소") {
		search_type = "0";
		$('#search_type').val(search_type);
	} else if(search_type == "관광") {
		search_type = "1";
		$('#search_type').val(search_type);
	} else if(search_type == "지역") {
		search_type = "2";
		$('#search_type').val(search_type);
	}
}

$(function(){
	$("#logoutBtn").on("click", function() {
		$.ajax({
			url: "logout",
			method: "post",
			data: "_csrf="+"${_csrf.token}",
			success: function() {
				location.href = "/project";
			}
		})
	})
})