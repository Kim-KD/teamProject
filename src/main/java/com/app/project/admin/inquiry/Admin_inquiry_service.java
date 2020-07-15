package com.app.project.admin.inquiry;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.project.board.trip.Trip_board_bean;
import com.app.project.service_center.inquiry.Inquiry_bean;
import com.app.project.user.User_bean;
import com.app.project.util.Page;
import com.app.project.util.PagingUtil;

@Service
public class Admin_inquiry_service {
	
	@Autowired
	private Admin_inquiry_dao dao;
	
	// 문의 관리 start
	public Page inquiry_list(int pageno, String inquiry_status, String user_id) {
		int countOfBoard = dao.inquiry_count(inquiry_status,user_id);
		Page page = PagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Inquiry_bean> boardList = dao.inquiry_find_all(srn, ern,inquiry_status , user_id);
		page.setInquiry_list(boardList);
		return page;
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
	// 문의 관리 end
}