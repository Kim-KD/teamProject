//댓글 가져오기
function printComment(comments) {
   var $comments = $("#comments_list");
   $comments.empty();
   $.each(comments, function(i, comment) {
      var $comment = $("<div>").appendTo($comments);
      var $upper_div = $("<div>").appendTo($comment);
      var $center_div = $("<div>").attr("id","comment_area"+comment.vno).appendTo($comment);
      $("<span></span>").text(comment.user_id).appendTo($upper_div);
      $("<span>").html(comment.content).appendTo($center_div);
      
      if(comment.user_id===loginId) {
          
    	  var btn = $("<button>").attr("class","delete_comment").attr("data-vno",comment.vno).attr("data-user_id",comment.user_id)
    	  .text("삭제").appendTo($center_div)
    	  btn.css("float","right");
    	  var btn = $("<button>").attr("class","update_comment").attr("data-vno",comment.vno).attr("data-user_id",comment.user_id)
    	  .text("수정").appendTo($center_div)
		  btn.css("float","right");
      }
      $("<hr>").appendTo($comment);
   });
  $("#comment_textarea").val('');	
}

$(function() {

		/* 초기 화면 셋팅 start */
	   // 자바객체 -> json -> 자바스크립트 객체
	   var board = JSON.parse('${board}');
	   $("#update_btn").attr('href',"/project/trip_update?no="+board.no+"&user_id="+board.user_id);
	   
	   $("#title").text(board.title);
	   $("#name").text(board.name);
	   $("#user_id").text(board.user_id);
	   $("#no").text(board.no);
	   $("#w_time").text(board.w_time);
	   $("#likes").text(board.likes);
	   $("#views").text(board.views);
	   
	   if(board.admission==null){
		   board.admission="";
		}
	   if(board.opentime==null){
		   board.opentime="";
		}
	   $("#admission").text(board.admission);
	   $("#opentime").text(board.opentime);
	   
	   // 초기화 - 버튼영역 감추기
	   $("#btn_area").hide();

	   if(isLogin===true && board.user_id===loginId) {
	      $("#title").prop("disabled", false);
	      $("#btn_area").show();
	      
	   } else if(isLogin===true && board.user_id!==loginId) {
	      $("#like_btn").prop("disabled", false);
	   }

		// 댓글 셋팅
		printComment(board.comments)
		
		/* 초기 화면 셋팅 end */
		
		// 게시글 삭제 확인 창 보여주기
		$('#delete_box_open').on('click', function(){
			$('#delete_box').modal('show');
		})

	// 게시글 삭제
	$("#delete_btn").on("click", function() {
		var param = {
			no : board.no,
			user_id : board.user_id,
			_csrf:"${_csrf.token}"
		}
		$.ajax({
			url: "/project/trip_delete",
			method: "post",
			data: param,
			success: function() {
				alert("게시글이 삭제되었습니다.");
				location.href = "/project/trip_list"
			},error(){
				alert("게시글을 삭제하는데 실패했습니다.");
			}
		})
	})

	// 게시글 추천
	$("#like_btn").on("click", function() {
		var param = {
			no : board.no,
			user_id : board.user_id,
			_csrf:"${_csrf.token}"
		}
		$.ajax({
			url: "/project/trip_like",
			method: "post",
			data: param,
			success: function(e) {
				if(e==true){
					$("#likes").text(board.likes+1);
					alert("게시글이 추천되었습니다.");
				}else if(e==null){
					alert("자신의 게시글에 추천할 수 없습니다.");
				}else{
					alert("이미 추천한 게시글 입니다.");
				}
			},error(){
				alert("게시글을 추천하는데 실패했습니다.");
			}
		})
	})

	/* 후기 start */
	// 댓글 달기
   $("#comment_write").on("click", function() {
     if($("#comment_textarea").val()!=="") {
	   if(isLogin===false){
		   alert("로그인을 하고 후기를 작성할 수 있습니다.")
		   return;
		}
      var params = {
         no : board.no,
         content : $("#comment_textarea").val(),
         _csrf: "${_csrf.token}"
      }
      $.ajax({
         url: "/project/view_write",
         method: "post", 
         data: params
      })
      .done((result)=>{printComment(result);})
      .fail((result)=>{console.log(result)});
     }
   })
   // 1.댓글 수정 누르면 textarea로 바꾸기
	$(document).on("click",".update_comment", function() {
		var text = $("#comment_area"+$(this).attr("data-vno")).children('span').text();
		var vno = $(this).attr("data-vno");
		var user_id = $(this).attr("data-user_id");
		var div_id = $("#comment_area"+vno);
		div_id.children('span').remove();
		div_id.append("<textarea id=new_comment"+vno+">"+text+"</textarea>");
		div_id.append("<button id='comment_update_btn"+vno+" date-vno="+vno+" data-user_id="+user_id+">수정</button>");
		$(this).hide();
		var btn = $("<button>").attr("class","update_comment_btn").attr("data-vno",vno).attr("data-user_id",user_id)
  	  	.text("수정").appendTo(div_id);
		btn.css("float","right");
 	})
   
   // 2.댓글 수정 누르면 변경시키기
	$(document).on("click",".update_comment_btn", function() {
		// data-no 속성의 값을 꺼낼 때
    	// data("no") -> 넣은 값의 타입 그대로
    	// attr("data-no") ->문자열
    	var param = {
       		no: board.no,
       		vno: $(this).attr("data-vno"),
       		user_id: $(this).attr("data-user_id"),
       		content: $("#new_comment"+$(this).attr("data-vno")).val(),
       		_csrf: "${_csrf.token}",
       		_method:"put"
    	}
    	$.ajax({
       		url: "/project/view_update",
       		method: "post",
       		data: param
    	})
    	.done((result)=>{
    		$(this).hide();
    		var text = $("#new_comment"+$(this).attr("data-vno")).val();
    		var vno = $(this).attr("data-vno");
    		var user_id = $(this).attr("data-user_id");
    		var div_id = $("#comment_area"+vno);
    		var btn = $("<button>").attr("class","update_comment").attr("data-vno",vno).attr("data-user_id",user_id)
      	  	.text("수정").appendTo($("#comment_area"+vno));
  		  	btn.css("float","right");
			div_id.children('textarea').remove();
			div_id.append("<span>"+text+"</span>");
        	})
    	.fail((result)=>{
        	console.log(result);
        	});
	})
   
	// 댓글 삭제
	$(document).on("click",".delete_comment", function() {
    	// data-no 속성의 값을 꺼낼 때
    	// data("no") -> 넣은 값의 타입 그대로
    	// attr("data-no") ->문자열
    	var params = {
       		no : board.no,
       		vno : $(this).attr("data-vno"),
       		user_id : $(this).attr("data-user_id"),
       		_csrf: "${_csrf.token}",
       		_method:"delete"
    	}
    	$.ajax({
       		url: "/project/view_delete",
       		method: "post",
       		data: params
    	})
    	.done((result)=>{ printComment(result); })
    	.fail((result)=>{console.log(result)});
	})

		// kakao 지도 api
		// 검색 지도 경도위도 알아내기
		// var coordXY = document.getElementById("coordXY");
		
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { center: new kakao.maps.LatLng(33.450701, 126.570667), // 위도경도
		level: 3 //지도의 레벨(확대, 축소 정도)
		};
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 지도타입 컨트롤, 줌 컨트롤 생성
		var mapTypeControl = new kakao.maps.MapTypeControl(); map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		var zoomControl = new kakao.maps.ZoomControl(); map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT); // ★ 주소-좌표 변환 객체를 생성
		var geocoder = new kakao.maps.services.Geocoder();
		
		// ★ 주소로 좌표를 검색
		geocoder.addressSearch(board.city+board.address, function(result, status) {
			// 정상적으로 검색이 완료됐으면
			if (status === kakao.maps.services.Status.OK) {
				
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				yy = result[0].x;
				xx = result[0].y;
				
				// 결과값으로 받은 위치를 마커로 표시
				var marker = new kakao.maps.Marker({ map: map, position: coords });
				
				// 인포윈도우로 장소에 대한 설명을 표시
				var iwContent = '<div style="padding:5px;">'+board.name+'<br>'
				+'<a href="https://map.kakao.com/link/map/'+board.name+','+xx+','+yy+'" style="color:blue" target="_blank">크게 보기</a> '
				+' <a href="https://map.kakao.com/link/to/'+board.name+','+xx+','+yy+'" style="color:blue" target="_blank">길찾기</a>'+'</div>'
				var infowindow = new kakao.maps.InfoWindow({ content : iwContent }); infowindow.open(map, marker);
				
				// 지도의 중심을 결과값으로 받은 위치로 이동
				map.setCenter(coords);
				
				// ★ resize 마커 중심
				var markerPosition = marker.getPosition();
				$(window).on('resize', function(){ map.relayout(); map.setCenter(markerPosition); });
				
				// ★ 검색 경도위도 표시 
				// coordXY.innerHTML = "<br>X좌표 : " + xx + "<br><br>Y좌표 : " + yy; } else { console.log('에러');
			}
		});
})