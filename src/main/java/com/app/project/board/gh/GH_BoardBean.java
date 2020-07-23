package com.app.project.board.gh;

import java.time.LocalDate;

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
public class GH_BoardBean {
	private int no;				// 게시글 번호
	private String user_id;		// 아이디
	private String title;		// 제목 
	private String content;		// 내용
	private String thumbnail;	// 섬네일
	private String postcode;	// 우편번호
	private String city;		// 지역주소
	private String address;		// 상세주소
	private String on_off;		// 게시글 공개여부
	private String p_link;		// 파워링크
	private String up_view;		// 상단노출
	private int views;			// 조회수
	private int likes;			// 추천수
	private LocalDate w_date;		// 작성날짜
	private String party_menu;	// 파티 메뉴
	private String alcohol;		// 술
	private String party_time;	// 파티 시간
	private String off_time;	// 소등 시
	private int join_man;		// 참여 인원(남)
	private int join_girl;		// 참여 인원(여)
	private String party_day;	// 파티 날짜
	private String wifi;		// Wi-Fi
	private String parking;		// 주차장
	private String morning;		// 조식
	private String pet;			// 반려동물 출입여부
	private String check_in;	// 입실 시간
	private String check_out;	// 퇴실 시간
	private String name;		// 게스트하우스 이름
}