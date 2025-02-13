package com.spring.FoodMate.main;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("/main")
	public ModelAndView mainPage() {
		logger.error("This is an error message!");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/layout_Regacy");
		mav.addObject("showNavbar", true);
		mav.addObject("title","메인 페이지");
		mav.addObject("body", "/WEB-INF/views/main/main.jsp");
		return mav;
	}
}
