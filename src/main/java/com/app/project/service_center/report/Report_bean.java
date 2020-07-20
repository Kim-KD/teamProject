package com.app.project.service_center.report;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Report_bean {

	private Integer no;				// 게시글 번호
	private String user_id;			// 아이디
	private String title;			// 제목 
	private String content;			// 내용
	private LocalDate report_date;	//문의 날짜
	private String report_status;	//문의 상태
	private String answer;			// 답변
}
