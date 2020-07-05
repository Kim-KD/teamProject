function add_Room_info(){
	if(confirm("방 정보를 추가 하시겠습니까??") == true) {
    	var room_orig = $("select", $('#room'));
    	var gender_orig = $("select", $('#gender'));
    	var room_people_orig = $("select", $('#room_people'));
    	var price_orig = $("select", $('#price'));
    	
    	var room_copy = $("#room").clone();
    	var gender_copy = $("#gender").clone();
    	var room_people_copy = $("#room_people").clone();
    	var price_copy = $("#price").clone();
    	
    	$("select", room_copy).val(room_orig.val());
    	$("select", gender_copy).val(gender_orig.val());
    	$("select", room_people_copy).val(room_people_orig.val());
    	$("select", price_copy).val(price_orig.val());
    	
    	room_copy.appendTo("#sroom");
    	gender_copy.appendTo("#sgender");
    	room_people_copy.appendTo("#sroom_people");
    	price_copy.appendTo("#sprice");
	} else {
		return;
	}
}

function delete_Room_info() {
	var room = document.getElementById("room");
	var gender = document.getElementById("gender");
	var room_people = document.getElementById("room_people");
	var price = document.getElementById("price");
	
	var room_parent = room.parentElement;
	var gender_parent = gender.parentElement;
	var room_people_parent = room_people.parentElement;
	var price_parent = price.parentElement;

	var length = $("select[name=room]").length;
	
	if(length == 1) {
		alert("삭제할 수 없습니다.");
		return;
	} else {
		room_parent.removeChild(room);
		gender_parent.removeChild(gender);
		room_people_parent.removeChild(room_people);
		price_parent.removeChild(price);
	}
}

$(function() {
	var party_time = $("#party_time");
	$("#party_time2").change(function(){
		var party_time1 = $("#party_time1 option:selected").val();
		var party_time2 = $("#party_time2 option:selected").val();
		party_time.val(party_time1 + "~" + party_time2);
	});
});