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

	// 게스트 하우스 게시글 작성
	public int gh_Insert(GH_BoardBean boardBean) {
		return sql.insert("GH_Mapper.gh_Insert", boardBean);
	}
	
	// 게스트 하우스 상세 정보 작성
	public int gh_More_Insert(GH_BoardBean boardBean) {
		return sql.insert("GH_Mapper.gh_More_Insert", boardBean);
	}
	
	// 게스트 하우스 방 정보 작성
	public int gh_Room_Insert(List<GH_RoomBean> roomList) {
		return sql.insert("GH_Mapper.gh_Room_Insert", roomList);
	}
	
	// 게스트 하우스 게시글 읽기
	public GH_BoardBean gh_Read(int no) {
		return sql.selectOne("GH_Mapper.gh_Read", no);
	}
	
	// 게스트 하우스 방 정보 읽기	
	public List<Map> gh_Room_Read(int no) {
		return sql.selectList("GH_Mapper.gh_Room_Read", no);
	}
	
	// 게스트 하우스 댓글 읽기
	public List<GH_ViewBean> gh_View_Read(int no) {
		return sql.selectList("GH_Mapper.gh_View_Read", no);
	}
	
	// 게스트 하우스 댓글 작성
	public int gh_View_Insert(GH_BoardBean boardBean) {
		return sql.insert("GH_Mapper.gh_View_Insert", boardBean);
	}
	
	// 게스트 하우스 게시글 수정
	public int gh_Update(GH_BoardBean boardBean) {
		return sql.update("GH_Mapper.gh_Update", boardBean);
	}
	
	// 게스트 하우스 게시글 삭제
	public int gh_Delete(int no) {
		return sql.delete("GH_Mapper.gh_Delete", no);
	}
	
	
	
	
	
	
	public List<String> testlist() {
		return sql.selectList("GH_Mapper.testlist");
	}

	public List<String> index_New_Slider() {
		return sql.selectList("GH_Mapper.index_New_Slider");
	}
	
	public List<String> index_Views_Slider() {
		return sql.selectList("GH_Mapper.index_Views_Slider");
	}
	
	public List<String> index_Likes_Slider() {
		return sql.selectList("GH_Mapper.index_Likes_Slider");
	}

}