package com.app.project.service_center.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.project.util.Page;
import com.app.project.util.PagingUtil;

@Service
public class Report_service {
	
	@Autowired
	private Report_dao dao;

	public Page report_list(Integer pageno, String report_status, String user_id) {
		int countOfBoard = dao.report_count(report_status, user_id);
		Page page = PagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Report_bean> boardList = dao.report_find_all(srn, ern,report_status, user_id);
		page.setReport_list(boardList);
		return page;
	}
	
	// 신고 글 작성
	public Integer report_write(Report_bean board) {
		dao.report_insert(board);
		return board.getNo();
	}
	
	// 신고 글 읽기
	public Report_bean report_read(Integer no, String user_id) {
		Report_bean board = dao.report_read(no);
		return board;
	}
	
	// 신고 글 수정
	public Integer report_update(Report_bean board) {
		return dao.report_update(board);
	}
	
	// 신고 글 삭제
	public Integer report_delete(Integer no) {
		return dao.report_delete(no);
	}
}