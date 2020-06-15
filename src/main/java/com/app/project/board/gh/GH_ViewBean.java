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
public class GH_ViewBean {

	private int no;
	private int re_no;
	private String user_id;
	private String content;
	
}