package com.spring.FoodMate.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.common.UtilMethod;


@Controller 
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value="/admin/adminMain", method=RequestMethod.GET)
	private ModelAndView main(@RequestParam(value="result", required=false) String result, @RequestParam(value="action",required=false) String action, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = UtilMethod.getViewName(request);
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("common/layoutAdmin");
		mav.addObject("showNavbar", true);
		mav.addObject("smallFooter", true);
		mav.addObject("title", "푸드 메이트");
		mav.addObject("body", "/WEB-INF/views" + viewName + ".jsp");
		mav.addObject("showSidebar", false); // 사이드바 표시 여부
        mav.addObject("sidebar", "/WEB-INF/views/admin/sidebar.jsp"); // 사이드바 포함 페이지 지정
		return mav;
	}
	
	@RequestMapping(value="/admin/*", method=RequestMethod.GET)
	private ModelAndView form(@RequestParam(value="result", required=false) String result, @RequestParam(value="action",required=false) String action, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = UtilMethod.getViewName(request);
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("common/layoutAdmin");
		mav.addObject("showNavbar", true);
		mav.addObject("smallFooter", true);
		mav.addObject("title", "푸드 메이트");
		mav.addObject("body", "/WEB-INF/views" + viewName + ".jsp");
		mav.addObject("showSidebar", true); // 사이드바 표시 여부
        mav.addObject("sidebar", "/WEB-INF/views/admin/sidebar.jsp"); // 사이드바 포함 페이지 지정
		return mav;
	}

}
