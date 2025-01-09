package com.spring.FoodMate.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("/main.do")
	public ModelAndView mainPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/layout");
		mav.addObject("showHeadermenu", true);
		mav.addObject("title","메인 페이지");
		mav.addObject("body", "/WEB-INF/views/main/main.jsp");
		return mav;
	}


}
