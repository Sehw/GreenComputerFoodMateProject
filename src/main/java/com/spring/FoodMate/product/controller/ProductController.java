package com.spring.FoodMate.product;

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

import com.spring.FoodMate.common.Util;


@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@RequestMapping(value="/product_list", method=RequestMethod.GET)
	private ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = Util.getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/layout");
		mav.addObject("showHeadermenu", true);
		mav.addObject("showNavbar", true);
		mav.addObject("title", "상품 검색창");
		mav.addObject("body", "/WEB-INF/views/product" + viewName + ".jsp");
		return mav;
	}
	
	@RequestMapping(value="/product_detail", method=RequestMethod.GET)
	private ModelAndView detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = Util.getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/layout");
		mav.addObject("showHeadermenu", true);
		mav.addObject("showNavbar", true);
		mav.addObject("title", "제품 상세정보");
		mav.addObject("body", "/WEB-INF/views/product" + viewName + ".jsp");
		return mav;
	}

	@RequestMapping(value="/product_add", method=RequestMethod.GET)
	private ModelAndView addForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = Util.getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/layout");
		mav.addObject("showHeadermenu", true);
		mav.addObject("showNavbar", true);
		mav.addObject("title", "상품 등록");
		mav.addObject("body", "/WEB-INF/views/product" + viewName + ".jsp");
		return mav;
	}
	
	@RequestMapping(value="/product_compare", method=RequestMethod.GET)
	private ModelAndView compare(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = Util.getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/layout");
		mav.addObject("showHeadermenu", true);
		mav.addObject("showNavbar", true);
		mav.addObject("title", "재료 비교");
		mav.addObject("body", "/WEB-INF/views/product" + viewName + ".jsp");
		return mav;
	}

}