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
public class Trip_view_bean {

	private Integer no;
	private Integer vno;
	private String user_id;
	private String content;
	
}
