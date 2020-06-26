package com.app.project.Common.Search;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService ssvc;
	private ModelAndView mav;
	
	@GetMapping("/search")
	public ModelAndView search(@RequestParam("keyword") String keyword, 
								@RequestParam("search_type") String search_type) {
		SearchBean searchBean = new SearchBean();
		searchBean.setKeyword(keyword);
		searchBean.setSearch_type(search_type);
		mav = ssvc.search(searchBean);
		return mav;
	}
	
}
