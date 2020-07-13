package com.app.project.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.project.board.trip.Trip_board_bean;
import com.app.project.service_center.inquiry.Inquiry_bean;
import com.app.project.user.User_bean;
import com.app.project.util.Page;
import com.app.project.util.PagingUtil;

@Service
public class Admin_service {
	
	@Autowired
	private Admin_dao dao;
	
	// 회원관리 start
	public Page userList(int pageno, String user_status, String user_id) {
		int countOfBoard = dao.user_count(user_status, user_id);
		Page page = PagingUtil.getPage(pageno, countOfBoard);
		int srn = page.getStartRowNum();
		int ern = page.getEndRowNum();
		List<User_bean> userList = dao.user_find_all(srn, ern, user_status, user_id);
		page.setUser_list(userList);
		return page;
	}
	
	// 유저 정보 읽기
	public User_bean userInfoRead(String user_id) {
		User_bean user = dao.user_read(user_id);
		if(user.getUser_status().equals("0")) {
			return user;
		}
		else if(user.getUser_status().equals("1")) {
			User_bean cpn = dao.cpn_read(user_id);
			user.setCpn_service_num(cpn.getCpn_service_num());
			user.setCpn_bank(cpn.getCpn_bank());
			user.setCpn_account(cpn.getCpn_account());
			return user;
		}
		else {
			return null;
		}
	}
	
	// 유저 계정 상태 수정
	public Integer enabledUpdate(User_bean user) {
			return dao.enabled_update(user);
	}
	// 회원관리 end
	
	
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