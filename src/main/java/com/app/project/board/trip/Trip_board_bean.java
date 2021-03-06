package com.app.project.board.trip;

import java.time.LocalDate;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.app.project.board.UploadInfoBean;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Trip_board_bean {

	private Integer no;				// 게시글 번호
	private String user_id;		// 아이디
	private String name;		// 관광명소 이름
	private String title;		// 제목 
	private String content;		// 내용
	private String postcode;	// 우편번호
	private String city;		// 지역주소
	private String address;		// 상세주소
	private String on_off;		// 게시글 공개여부
	private String p_link;		// 파워링크
	private String up_view;		// 상단노출
	private Integer views;			// 조회수
	private Integer likes;			// 추천수
	private LocalDate w_date;		// 작성날짜
	private Integer admission;		// 입장료
	private String opentime;	// 운영 시간
	private String thumbnail;		// 풍경 이미지
	private List<MultipartFile> upload; // 사진 업로드
	private List<Trip_view_bean> comments; // 댓글
	private List<UploadInfoBean> upload_info; // 사진 업로드 정보
}
