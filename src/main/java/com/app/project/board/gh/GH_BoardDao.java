package com.app.project.board.gh;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GH_BoardDao {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	// 게스트하우스 목록
	public List<GH_BoardBean> guest_house_list() {
		return sql.selectList("GH_Mapper.guest_house_list");
	}
	
	// 게스트하우스 게시글 작성
	public int gh_Insert(GH_BoardBean boardBean) {
		return sql.insert("GH_Mapper.gh_Insert", boardBean);
	}
	
	// 게스트하우스 상세 정보 작성
	public int gh_More_Insert(GH_BoardBean boardBean) {
		return sql.insert("GH_Mapper.gh_More_Insert", boardBean);
	}
	
	// 게스트하우스 방 정보 작성
	public int gh_Room_Insert(List<GH_RoomBean> roomList) {
		return sql.insert("GH_Mapper.gh_Room_Insert", roomList);
	}
	
	// 게스트하우스 게시글 수정
	public int gh_Modify(GH_BoardBean boardBean) {
		return sql.update("GH_Mapper.gh_Modify", boardBean);
	}
	
	// 게스트하우스 상세 정보 수정
	public int gh_More_Modify(GH_BoardBean boardBean) {
		return sql.update("GH_Mapper.gh_More_Modify", boardBean);
	}
	
	// 게스트하우스 방 정보 수정
	public int gh_Room_Modify(List<GH_RoomBean> roomList) {
		return sql.update("GH_Mapper.gh_Room_Modify", roomList);
	}
	
	// 게스트하우스 게시글 + 후기 삭제
	public int gh_delete(int no) {
		return sql.delete("GH_Mapper.gh_delete", no);
	}
	
	// 상세보기 페이지
	public Map<String, Object> guest_house_read(int no) {
		return sql.selectOne("GH_Mapper.guest_house_read", no);
	}
	
	// 게스트하우스 방 정보
	public List<Map<String, Object>> room_info_data(GH_RoomBean roomBean) {
		return sql.selectList("GH_Mapper.room_info_data", roomBean);
	}
	
	// 게스트하우스 후기 작성
	public int gh_View_Insert(GH_ViewBean viewBean) {
		return sql.insert("GH_Mapper.gh_View_Insert", viewBean);
	}
	
	// 게스트하우스 후기 읽기
	public List<GH_ViewBean> gh_View_Read(int no) {
		return sql.selectList("GH_Mapper.gh_View_Read", no);
	}
	
	// 게스트하우스 후기 삭제
	public int gh_View_delete(GH_ViewBean viewBean) {
		return sql.delete("GH_Mapper.gh_view_delete", viewBean);
	}
	
	// 게스트하우스 후기 수정
	public int gh_view_modify(GH_ViewBean viewBean) {
		return sql.update("GH_Mapper.gh_view_modify", viewBean);
	}
	
	// index 최신순
	public List<GH_BoardBean> index_New_Slider() {
		return sql.selectList("GH_Mapper.index_New_Slider");
	}
	
	// index 조회수
	public List<GH_BoardBean> index_Views_Slider() {
		return sql.selectList("GH_Mapper.index_Views_Slider");
	}
	
	// index 추천수
	public List<GH_BoardBean> index_Likes_Slider() {
		return sql.selectList("GH_Mapper.index_Likes_Slider");
	}

}