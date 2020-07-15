package com.app.project.admin.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Admin_notice_service {
	
	@Autowired
	private Admin_notice_dao dao;
	
	// 공지사항 작성
	public Integer notice_insert(Notice_bean board) {
		dao.notice_insert(board);
		return board.getNo();
	}
	
	// 문의 읽기
	public Notice_bean notice_read(Integer no, String admin_id) {
		Notice_bean board = dao.notice_read(no);
		return board;
	}
	
	// 공지사항 수정
	public Integer notice_update(Notice_bean board) {
			return dao.notice_update(board);
	}
	
	// 공지사항 삭제
	public Integer notice_delete(Integer no) {
		return dao.notice_delete(no);
	}
}