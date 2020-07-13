package com.app.project.service_center.inquiry;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Inquiry_bean {

	private Integer no;				// 게시글 번호
	private String user_id;			// 아이디
	private String title;			// 제목 
	private String content;			// 내용
	private LocalDate inquiry_date;	//문의 날짜
	private String inquiry_status;	//문의 상태
	private String answer;	// 답변
}
