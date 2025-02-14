package com.spring.FoodMate.main;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.common.exception.ApiException;
import com.spring.FoodMate.common.exception.UnhandledException;

@Controller
public class MainController {
	@RequestMapping("/main")
	public ModelAndView mainPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/layout_Regacy");
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
