package com.app.project.admin.notice;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Notice_bean {
	
	private Integer no;					// 글 번호
	private String admin_id;			// 관리자 아이디
	private String title;				// 제목
	private String content;				// 내용
	private LocalDate write_date;			// 작성 날짜
	
}