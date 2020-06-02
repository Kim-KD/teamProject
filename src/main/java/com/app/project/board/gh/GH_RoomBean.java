package com.app.project.board.gh;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GH_RoomBean {
	private int no;				// 게시글 번호
	private String room;		// 방
	private String room_status;	// 방 구분
	private String price;		// 가격
	private String photo;		// 뷰
	private String room_people;	// 정원
	private String gender;		// 성별
}
