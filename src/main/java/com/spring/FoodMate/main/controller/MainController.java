package com.spring.FoodMate.main.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.common.exception.ApiException;
import com.spring.FoodMate.common.exception.UnhandledException;
import com.spring.FoodMate.product.service.ProductService;
import com.spring.FoodMate.recipe.service.RecipeService;

@Controller
public class MainController {
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
	
	@RequestMapping(value = "/testerror1", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> testError1() {
	    // 강제로 예외를 발생시키는 코드
	    throw new ApiException("강제 예외가 발생했습니다. /testerror1로 접근했습니다.");
	}
	
	@RequestMapping(value = "/testerror2", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> testError2() {
	    // 강제로 예외를 발생시키는 코드
	    throw new UnhandledException("강제 예외가 발생했습니다. /testerror2로 접근했습니다.");
	}
}
