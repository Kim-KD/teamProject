package com.app.project.Common.Search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.app.project.board.gh.GH_BoardBean;
import com.app.project.board.trip.Trip_board_bean;

@Service
public class SearchService {
	
	@Autowired
	private SearchDao sdao;
	private ModelAndView mav;
	
	public ModelAndView search(SearchBean searchBean) {
		mav = new ModelAndView();
		if(searchBean.getSearch_type().equals("0")) {
			List<GH_BoardBean> guest_house = sdao.guest_house(searchBean);
			mav.addObject("search_data", guest_house);
			mav.setViewName("search/searchList");
			return mav;
		} else if(searchBean.getSearch_type().equals("1")) {
			List<Trip_board_bean> trip = sdao.trip(searchBean);
			mav.addObject("search_data", trip);
			mav.setViewName("search/searchList");
			return mav;
		} else if(searchBean.getSearch_type().equals("2")) {
			List<GH_BoardBean> guest_house_area = sdao.guest_house_area(searchBean);
			List<Trip_board_bean> trip_area = sdao.trip_area(searchBean);
			
			mav.addObject("guest_house_area_search_data", guest_house_area);
			mav.addObject("trip_area_search_data", trip_area);
			mav.setViewName("search/searchList");
			return mav;
		}
		return mav;
	}
}