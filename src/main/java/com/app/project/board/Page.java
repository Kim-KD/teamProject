package com.app.project.board;

import java.util.List;

import com.app.project.board.gh.GH_BoardBean;
import com.app.project.board.trip.Trip_board_bean;
import com.app.project.reserve.Reserve_bean;
import com.app.project.service_center.inquiry.Inquiry_bean;

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
	List<Inquiry_bean> inquiry_list;
}