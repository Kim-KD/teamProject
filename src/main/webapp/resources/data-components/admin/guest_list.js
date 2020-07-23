$(function() {

	var update_list = [];
	var update_map = {};
	var delete_list = [];
	
	if(document.location.href.split("project/")[1].split("?")[0]=="guest_on_list") {
		$("#page_title").text("게스트 하우스 게시글 공개 목록");
		$(".before_off").hide();
		$(".now_off").hide();
		$(".different_off").hide();
		$(".after_off").hide();
		
	}else if(document.location.href.split("project/")[1].split("?")[0]=="guest_off_list") {
		$("#page_title").text("게스트 하우스 게시글 비공개 목록");
		$(".before_on").hide();
		$(".now_on").hide();
		$(".different_on").hide();
		$(".after_on").hide();
	}
	else{
		return null;
	}
	
	$(".selectOnoff").on("change",function(){
		update_map={
				no:$(this).attr("data-no"),
				on_off:$(this).val()
		}
		update_list.push(update_map);
		console.log(update_list);
	})
	
	$("#update").on("click", function() {
		if(JSON.stringify(update_list)=="[]") {
			alert("공개 여부를 수정할 게시글이 없습니다.");
			return null;
		}
		var param = {
				board:JSON.stringify(update_list),
				_csrf:"${_csrf.token}"
			}
		$.ajax({
			url:"admin_guest_update",
			data: param,
			method:"post",
			success:function(result) {
				if(result==1){
					location.reload(true);
					alert("공개 여부를 수정했습니다.");
				}else{
					alert("공개 여부를 수정하는데 실패했습니다.");
				}
			}, error() {
				console.log(param);
				alert("공개 여부를 수정하는데 실패했습니다.");
			}
		})
	})
	
	
	
	$("#delete").on("click", function() {
		
		$("input[name='no']:checked").each(function(){
			delete_list.push($(this).attr("data-no"));
		})
		
		if(JSON.stringify(delete_list)=="[]") {
			alert("삭제할 게시글을 선택해주세요.");
			return null;
		}
		
		var param = {
				no:JSON.stringify(delete_list),
				_csrf:"${_csrf.token}"
			}
		$.ajax({
			url:"admin_guest_delete",
			data: param,
			method:"post",
			success:function(result) {
				location.reload(true);
				alert("게시글을 삭제했습니다.");
			}, error() {
				console.log(param);
				alert("게시글을 삭제하는데 실패했습니다.");
			}
		})
	})
})
