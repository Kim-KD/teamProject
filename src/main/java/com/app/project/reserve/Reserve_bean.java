package com.app.project.reserve;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Reserve_bean {

	private Integer no;					// 게시글 번호
	private Integer rno;				// 예약 번호
	private String user_id;				// 예약 유저 아이디
	private String name;				// 게스트하우스 이름 
	private LocalDateTime reserve_date;	// 작성 날짜
	private LocalDateTime check_in;		// 체크인 날짜
	private LocalDateTime check_out;	// 체크아웃 날짜
	private String reserve_total;		// 총 예약일
	private String personel;			// 예약 인원
	private String reserve_status;		// 진행 상태
	private String room;				// 예약한 방
	private String pay;					// 결제 금액
}
