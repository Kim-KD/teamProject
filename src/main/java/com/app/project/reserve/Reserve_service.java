package com.app.project.reserve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.project.util.Page;
import com.app.project.util.PagingUtil;

@Service
public class Reserve_service {
	
	@Autowired
	private Reserve_dao dao;

	public Page reserve_list(Integer pageno, String user_id) {
		int countOfBoard = dao.reserve_count(user_id);
		Page page = PagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<Reserve_bean> boardList = dao.reserve_find_all(srn, ern, user_id);
		page.setReserve_list(boardList);
		return page;
	}
	
	// 게스트 하우스 예약
	public Integer reserve_insert(Reserve_bean board) {
		dao.reserve_insert(board);
		return board.getRno();
	}
	
	// 게스트 하우스 예약 읽기
	public Reserve_bean reserve_read(Integer rno, String user_id) {
		Reserve_bean board = dao.reserve_read(rno);
		return board;
	}
	
	// 게스트 하우스 예약 수정
	public Integer reserve_update(Reserve_bean board) {
		return dao.reserve_update(board);
	}
}