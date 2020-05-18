package com.app.project.board.trip;

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
public class Trip_BoardBean {

	private int no;				// 게시글 번호
	private String user_id;		// 아이디
	private String title;		// 제목 
	private String content;		// 내용
	private String postcode;	// 우편번호
	private String city;		// 지역주소
	private String address;		// 상세주소
	private String on_off;		// 게시글 공개여부
	private String p_link;		// 파워링크
	private String up_view;		// 상단노출
	private int views;			// 조회수
	private int likes;			// 추천수
	private String w_date;		// 작성날짜
	private int admission;		// 입장료
	private String opentime;	// 운영 시간
	private String photo;		// 풍경 이미지
}
