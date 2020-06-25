package com.app.project.Common.Search;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.project.board.gh.GH_BoardBean;
import com.app.project.board.trip.Trip_board_bean;

@Repository
public class SearchDao {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	// 게스트하우스 검색
	public List<GH_BoardBean> guest_house(SearchBean searchBean) {
		return sql.selectList("Search_Mapper.guest_house_Search", searchBean);
	}
	
	// 관광명소 검색
	public List<Trip_board_bean> trip(SearchBean searchBean) {
		return sql.selectList("Search_Mapper.trip_Search", searchBean);
	}
	
	// 게스트하우스 지역 검색
	public List<GH_BoardBean> guest_house_area(SearchBean searchBean) {
		return sql.selectList("Search_Mapper.guest_house_area", searchBean);
	}
	
	// 관광명소 지역 검색
	public List<Trip_board_bean> trip_area(SearchBean searchBean) {
		return sql.selectList("Search_Mapper.trip_area", searchBean);
	}
}
