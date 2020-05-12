package com.app.project.board.gh;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("login_data")
public class GH_BoardController {
	
	@Autowired
	private GH_BoardService bsvc;
	
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String write(GH_BoardBean boardBean) {
		bsvc.write(boardBean);
		
		return "index";
	}
}