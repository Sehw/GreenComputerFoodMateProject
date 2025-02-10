package com.spring.FoodMate.product.controller;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.common.Util;
import com.spring.FoodMate.product.dto.CategoryDTO;
import com.spring.FoodMate.product.dto.ProductDTO;
import com.spring.FoodMate.product.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductDTO productVO;
	@Autowired
	private CategoryDTO categoryDTO;
	@Autowired
	private ProductService productService;
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping(value="/product_list", method=RequestMethod.GET)
	private ModelAndView list(
	    @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword, //keyword=검색어, 없으면 빈문자열로 바꿔줌
	    HttpServletRequest request, HttpServletResponse response
	) throws Exception {
	    String viewName = Util.getViewName(request);
	    ModelAndView mav = new ModelAndView();
	    List<ProductDTO> searchList = productService.pdtList(keyword);
	    // Service 에 keyword(검색어)를 주고 해당하는 상품VO의 List를 받아옴.
	    mav.setViewName("common/layout");
	    mav.addObject("showNavbar", true);
	    mav.addObject("title", "FoodMate-상품 검색창");
	    mav.addObject("body", "/WEB-INF/views/product" + viewName + ".jsp");
	    mav.addObject("list", searchList);
	    return mav;
	}

	@RequestMapping(value="/product_detail", method=RequestMethod.GET)
	private ModelAndView detail(
			@RequestParam(value = "pdt_id", required = true) String pdt_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = Util.getViewName(request);
		ModelAndView mav = new ModelAndView();
		
		ProductDTO product = productService.select1Pdt(pdt_id);
		List<CategoryDTO> categoryStep = productService.categoryStep(product.getCategory_id());

		mav.setViewName("common/layout");
		mav.addObject("showNavbar", true);
		mav.addObject("title", "제품 상세정보");
		mav.addObject("body", "/WEB-INF/views/product" + viewName + ".jsp");
		mav.addObject("pdt", product);
		Collections.reverse(categoryStep);
		mav.addObject("category", categoryStep);
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