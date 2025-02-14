package com.spring.FoodMate.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.product.dto.ProductDTO;
import com.spring.FoodMate.product.service.ProductService;
import com.spring.FoodMate.recipe.service.RecipeService;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
    private RecipeService recipeService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/main")
	public ModelAndView mainPage() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/layout");
		mav.addObject("recipeList", recipeService.selectRecipeList()); //서비스에 selectRecipeList메소드있어야함
		mav.addObject("productList", productService.pdtList("")); 
		mav.addObject("showNavbar", true);
		mav.addObject("title","메인 페이지");
		mav.addObject("body", "/WEB-INF/views/main/main.jsp");
		return mav;
	}
}
