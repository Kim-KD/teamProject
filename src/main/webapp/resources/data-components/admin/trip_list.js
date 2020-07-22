$(function() {

	var update_list = [];
	var delete_list = [];
	
	if(document.location.href.split("project/")[1].split("?")[0]=="trip_on_list") {
		$("#page_title").text("관광명소 게시글 공개 목록");
		var before = $("#before").attr("href");
		alert(before);
	}else if(document.location.href.split("project/")[1].split("?")[0]=="trip_off_list") {
		$("#page_title").text("관광명소 게시글 비공개 목록");
	}
	else{
		return null;
	}
	
	$(".selectOnoff").on("change",function(){
		$(this).attr("data-no"),
		$(this).val()
		update_list.push(update_map);
		console.log(update_list);
	})
	
	$("#update").on("click", function() {
//		var array = document.getElementsByClassName("update_td");
//		for (var i = 0; i < array.length; i++) {
//			list=[{
//				no:array[i].getElementById("no").val(),
//				on_off:array[i].getElementById("selectOnoff").val()
//			}]
//		}
		
//		$(".update_td").each(function(i){
//			list = [
//				{
//					no:$(this).children("#no").val(),
//					on_off:$(this).children("#selectOnoff").val()
//				}
//			]
//        });
		
		var param = {
				board:JSON.stringify(update_list),
				_csrf:"${_csrf.token}"
			}
		$.ajax({
			url:"admin_trip_update",
			data: param,
			method:"post",
			success:function() {
				location.reload(true);
				alert("공개 여부를 수정했습니다.");
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
			url:"admin_trip_delete",
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
