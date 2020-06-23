package com.app.project.Common.Search;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class SearchService {
	
	@Autowired
	private SearchDao sdao;
	private ModelAndView mav;
	
	public ModelAndView all_search(SearchBean searchBean) {
		List<Map<String, Object>> all_search_data = sdao.all_search(searchBean);
		
		mav = new ModelAndView();
		mav.addObject("all_search_data", all_search_data);
		mav.setViewName("");
		
		return mav;
	}
	
}
