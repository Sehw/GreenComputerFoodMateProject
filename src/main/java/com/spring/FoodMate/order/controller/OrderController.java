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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	        mav.addObject("orderItemList", cartIdList);
	    }
		return mav;
	}
	
	@RequestMapping("/order/setOrderItems")
	public String setOrderItems(@RequestBody List<Integer> cartIds, RedirectAttributes redirectAttributes) {
		
		 System.out.println("받은 주문 ID 리스트: " + cartIds); // 디버깅용
		 
		// 받은 cartIds를 이용해 실제 주문 아이템 가져오기
	    List<CartDTO> cartItems = orderService.getCartItems(cartIds);

	    // FlashAttribute에 저장하여 order2에서도 사용 가능
	    redirectAttributes.addFlashAttribute("orderItems", cartItems);
	    
	    // 주문 완료 페이지로 리다이렉트
	    return "redirect:/order/order2";
	}
	
	@RequestMapping(value="/order/order2")
	public ModelAndView newsPage(@RequestBody List<CartDTO> orderItems, @RequestParam(value="result", required=false) String result, @RequestParam(value="action",required=false) String action, HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		
		// 주문 아이템 추가
	    mav.addObject("orderItems", orderItems);
		
		return mav;
	}
	
}
