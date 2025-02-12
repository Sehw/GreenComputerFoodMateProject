package com.spring.FoodMate.order.controller;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.cart.dto.CartDTO;
import com.spring.FoodMate.cart.service.CartService;
import com.spring.FoodMate.common.Util;
import com.spring.FoodMate.order.service.OrderService;

import io.github.cdimascio.dotenv.Dotenv;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	@Autowired
	OrderService orderService; 
	
	private final Dotenv dotenv = Dotenv.load();
    private final String PimpUid = dotenv.get("PORTONE_IMP_UID");
	
	@RequestMapping(value="/order/order1")
	public ModelAndView orderPage(@RequestParam(value = "cartIds", required = false) String cartIds, @RequestParam(value="result", required=false) String result, @RequestParam(value="action",required=false) String action, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = Util.getViewName(request);
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("common/layout");
		mav.addObject("impUid", PimpUid);
		mav.addObject("showNavbar", true);
		mav.addObject("title", "푸드 메이트");
		mav.addObject("body", "/WEB-INF/views" + viewName + ".jsp");
		if (cartIds != null && !cartIds.isEmpty()) {
	        List<Integer> cartIdList = Arrays.stream(cartIds.split(","))
	                                         .map(Integer::parseInt)
	                                         .collect(Collectors.toList());
	        List<CartDTO> cartItems = orderService.getCartItems(cartIdList);
	        mav.addObject("orderItems", cartItems);
	    }
		return mav;
	}
	
	@RequestMapping(value="/order/order2")
	public ModelAndView newsPage(@RequestParam(value="result", required=false) String result, @RequestParam(value="action",required=false) String action, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = Util.getViewName(request);
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("common/layout");
		mav.addObject("impUid", PimpUid);
		mav.addObject("showNavbar", true);
		mav.addObject("title", "푸드 메이트");
		mav.addObject("body", "/WEB-INF/views" + viewName + ".jsp");
		return mav;
	}
	
}
