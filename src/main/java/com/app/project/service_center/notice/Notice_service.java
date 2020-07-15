package com.app.project.service_center.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.project.admin.notice.Notice_bean;
import com.app.project.util.Page;
import com.app.project.util.PagingUtil;

@Service
public class Notice_service {
	
	@Autowired
	private Notice_dao dao;

	// 공지사항 리스트
	public Page notice_list(Integer pageno, String title) {
		int countOfBoard = dao.notice_count(title);
		Page page = PagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Notice_bean> boardList = dao.notice_find_all(srn, ern, title);
		page.setNotice_list(boardList);
		return page;
	}
	
	// 공지사항 읽기
	public Notice_bean notice_read(Integer no) {
		Notice_bean board = dao.notice_read(no);
		return board;
	}
}