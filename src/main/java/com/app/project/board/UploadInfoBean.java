package com.app.project.board;

import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
public class UploadInfoBean {
	private Integer pno;		// 사진 번호
	private Integer no;			// 게시글 번호
	private String user_id;		// 유저 아이디
	// aaa.jpg
	private String file_name;	// 파일 이름
	// 20200609103507-aaa.jpg
	private String save_name;	// 저장 이름
	private Integer file_size;	// 파일 크기
}
