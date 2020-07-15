package com.app.project.admin.notice;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Admin_notice_dao {
	
	@Autowired
	private SqlSessionTemplate sql;

	// 공지사항 작성
	public Integer notice_insert(Notice_bean board) {
		return sql.insert("notice_mapper.notice_insert", board);
	}
	
	// 공지사항 읽기
	public Notice_bean notice_read(Integer no) {
		return sql.selectOne("notice_mapper.notice_read", no);
	}
	
	// 공지사항 수정
	public Integer notice_update(Notice_bean board) {
		return sql.update("notice_mapper.notice_update", board);
	}
	
	// 공지사항 삭제
	public Integer notice_delete(Integer no) {
		return sql.delete("notice_mapper.notice_delete", no);
	}
}