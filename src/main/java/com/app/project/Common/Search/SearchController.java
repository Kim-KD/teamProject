package com.app.project.Common.Search;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService ssvc;
	private ModelAndView mav;
	
	@PostMapping("all_search")
	public ModelAndView all_search(SearchBean searchBean) {
		mav = ssvc.all_search(searchBean);
		return mav;
	}
	
}
