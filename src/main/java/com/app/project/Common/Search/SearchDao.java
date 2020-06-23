package com.app.project.Common.Search;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDao {
	
	@Autowired
	private SqlSessionTemplate sql;

	public List<Map<String, Object>> all_search(SearchBean searchBean) {
		return sql.selectList("Search_Mapper.all_search", searchBean);
	}
}
