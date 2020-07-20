package com.app.project.util;

import java.util.List;

import com.app.project.board.gh.GH_BoardBean;
import com.app.project.board.trip.Trip_board_bean;
import com.app.project.reserve.Reserve_bean;
import com.app.project.service_center.inquiry.Inquiry_bean;
import com.app.project.service_center.notice.Notice_bean;
import com.app.project.service_center.report.Report_bean;
import com.app.project.user.User_bean;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Page{
	// 아래 두 필드는 페이지네이션과 상관없다
	private int startRowNum;
	private int endRowNum;
	private int startPage;
	private int endPage;
	private boolean isPrev;
	private boolean isNext;
	private int pageno;
	
	List<Trip_board_bean> trip_list;
	List<GH_BoardBean> gh_list;
	List<Reserve_bean> reserve_list;
	
//	관리자 유저 관리 리스트
	List<User_bean> user_list;
	
//	고객센터
//	공지사항 리스트
	List<Notice_bean> notice_list;
//	1:1문의 리스트
	List<Inquiry_bean> inquiry_list;
//	신고 글 리스트
	List<Report_bean> report_list;
}