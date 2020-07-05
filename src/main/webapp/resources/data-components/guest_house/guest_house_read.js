function room_info(room_data) {
	var _csrf = $("#_csrf").val();
	var room = $(room_data).text();
	var no = $("#no").val();
	var trTemplate = Handlebars.compile($('#roomListTemplate').text());
	/* var roomListBody = $('#room-list tbody'); */
	
	var roomList = $("#roomList");
	
	$.ajax({
		url : "room_info_data",
		type : "POST",
		data : {"room" : room, "no" : no, "_csrf" : _csrf},
		dataType : "json",
		success : function(data) {
			if(data == 0) {
				alert("등록된 정보가 없습니다.");
			} else {
				/* roomListBody.text(""); */
				roomList.text("");
				for (var record of data) {
					record.genderTitle = record.gender == 1 ? '여' : '남';
				}
				/* roomListBody.html(trTemplate({rooms: data})); */
				roomList.html(trTemplate({rooms: data}));
			}
		}
	});
}

function border_Delete() {
	var no = $("#no").val();
	var _csrf = $("#_csrf").val();
	
	$.ajax({
		url : "gh_delete",
		type : "POST",
		data : {"no" : no, "_csrf" : _csrf},
		dataType : "json",
		success : function(data) {
			console.log(data);
			if(data > 0) {
				alert("게시글이 삭제되었습니다.");
				location.href = "/project/guest_house_list"
			}
		}
	});
}

function border_like() {
	var no = $("#no").val();
	var user_id = $("#user_id").val();
	var _csrf = $("#_csrf").val();
	
	$.ajax({
		url : "gh_like",
		type : "POST",
		data : {"no" : no, "user_id" : user_id, "_csrf" : _csrf},
		dataType : "json",
		success : function(data) {
			console.log(data);
		}
	});
}

Handlebars.registerHelper("isEqual", function(v1, v2) {
	return v1 == v2;
});

$(function(){
	getComment();
});

function getComment() {
	var no = $("#no").val();
	var viewList = Handlebars.compile($('#gh_view_comment').text());
	var commentList = $("#commentList");
	var _csrf = $("#_csrf").val();
	var user_id = $("#user_id").val();
	
	$.ajax({
		url : "gh_view_list",
		type : "POST",
		data : {"no" : no, "_csrf" : _csrf},
		dataType : "json",
		success : function(data) {
			if(data.length != 0) {
				commentList.html(viewList({commentList: data}));
				$("#commentList").removeAttr("style");
			} else {
				var html = "";
				html += "<div class='col-md-12'>";
				html += "<div class='loan-cal-result' style='text-align:center'>등록된 댓글이 없습니다.</div>";
				html += "</div>";
				$("#commentList").html(html);
			}
		}
	});
}

function comment_Add() {
	var no = $("#no").val();
	var content = $("#content").val();
	var user_id = $("#user_id").val();
	var _csrf = $("#_csrf").val();
	
	if(content == '') {
		alert("내용을 입력해주세요.");
	} else {
		$.ajax({
			url : "gh_view_insert",
			type : "POST",
			data : {"no" : no, "user_id" : user_id, "content" : content, "_csrf" : _csrf},
			dataType : "json",
			success : function(data) {
				if(data == 1) {
					alert("댓글이 등록되었습니다.");
					$("#content").val("");
					getComment();
				}
			}
		});
	}
}

function comment_Delete(re_no) {
	var no = $("#no").val();
	var user_id = $("#user_id").val();
	var _csrf = $("#_csrf").val();
	
	$.ajax({
		url : "gh_view_delete",
		type : "POST",
		data : {"no" : no, "re_no" : re_no, "user_id" : user_id, "_csrf" : _csrf},
		dataType : "json",
		success : function(data) {
			if(data == 1) {
				alert("댓글이 삭제되었습니다.");
				getComment();
			}
		}
	});
}

function comment_Modify_Form(re_no, comment) {
	var html = "";
	html += "<div id='formtest'>"
	html += "<form>"
	html += "<textarea id='re_comment' style='height:100px; border:solid 1px black; margin:0px' placeholder='내용을 입력해주세요.'>" + comment + "</textarea>";
	html += "<div style='text-align:center'>";
	html += "<a class='btn px-4 btn-success text-white' onclick='comment_Modify(" + re_no + ")'>등록</a>&nbsp";
	html += "<a class='btn px-4 btn-primary text-white' onclick='cancels(" + re_no + "," + comment + ")'>취소</a>";
	html += "</div>";
	html += "</form>";
	html += "</div>";
	$("#commentbtn"+re_no).css("display", "none");
	$("#comment"+re_no).html(html);
}

function cancels(re_no, comment) {
	var html = "";
	$("#formtest").remove();
	$("#commentbtn"+re_no).css("display", "");
	html += "<h6 id='comment" + re_no + "'>" + comment + "</h6>";
	$("#comment"+re_no).html(html);
}

function comment_Modify(re_no) {
	var no = $("#no").val();
	var content = $("#re_comment").val();
	var _csrf = $("#_csrf").val();
	
	if(content == '') {
		alert("내용을 입력해주세요.");
	} else {
		$.ajax({
			url : "gh_view_modify",
			type : "POST",
			data : {"no" : no, "re_no" : re_no, "content" : content, "_csrf" : _csrf},
			dataType : "json",
			success : function(data) {
				if(data == 1) {
					alert("댓글이 등록되었습니다.");
					$("#formtest").remove();
					getComment();
				}
			}
		});
	}
}