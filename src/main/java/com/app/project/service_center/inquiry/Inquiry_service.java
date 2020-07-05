package com.app.project.service_center.inquiry;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.project.board.Page;
import com.app.project.util.PagingUtil;

@Service
public class Inquiry_service {
	
	@Autowired
	private Inquiry_dao dao;

	public Page inquiry_list(int pageno, String user_id) {
		int countOfBoard = dao.inquiry_count(user_id);
		Page page = PagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Inquiry_bean> boardList = dao.inquiry_find_all(srn, ern, user_id);
		page.setInquiry_list(boardList);
		return page;
	}
	
	// 문의 작성
	public Integer inquiry_write(Inquiry_bean board) {
		dao.inquiry_insert(board);
		return board.getNo();
	}
	
	// 문의 읽기
	public Inquiry_bean inquiry_read(int no, String user_id) {
		Inquiry_bean board = dao.inquiry_read(no);
		return board;
	}
	
	// 문의 수정
	public Integer inquiry_update(Inquiry_bean board) {
		return dao.inquiry_update(board);
	}
	
	// 문의 삭제
	public Integer inquiry_delete(int no) {
		return dao.inquiry_delete(no);
	}
}