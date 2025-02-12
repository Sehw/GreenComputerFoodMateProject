package com.spring.FoodMate.cart.controller;

import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.cart.service.CartService;
import com.spring.FoodMate.common.Util;
import com.spring.FoodMate.member.dto.BuyerDTO;


@Controller
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	@Autowired
	CartService cartService; 
	
	@RequestMapping(value="/cart/*Form", method=RequestMethod.GET)
	public ModelAndView mypageform(@RequestParam(value="result", required=false) String result, @RequestParam(value="action",required=false) String action, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = Util.getViewName(request);
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("common/layout");
		mav.addObject("showNavbar", true);
		mav.addObject("showSidebar",false);
		mav.addObject("title", "푸드 메이트");
		mav.addObject("body", "/WEB-INF/views" + viewName + ".jsp");
		return mav;
	}
	
	@RequestMapping(value = "/cart/addtocart", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addToCart(@RequestParam("productId") int pdt_id,
	                                      @RequestParam("quantity") int qty,
	                                      HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		Boolean isBuyerLogOn = (Boolean) session.getAttribute("isBuyerLogOn");
		if (isBuyerLogOn == null || !isBuyerLogOn) {
		    System.out.println("로그인도 안해놓고");
		    response.put("success", false);
		    response.put("message", "로그인 후 장바구니에 담을 수 있습니다.");
		    return response;
		}
		
	    // 세션에서 BuyerVO 객체를 가져옴
	    BuyerDTO buyerInfo = (BuyerDTO) session.getAttribute("buyerInfo");
	    
	    if (buyerInfo == null) {
	        response.put("success", false);
	        response.put("message", "로그인 정보가 유효하지 않습니다. 다시 로그인해주세요.");
	        return response;
	    }
	    
	    String byr_id = buyerInfo.getByr_id();
	    
	    // 장바구니 추가 서비스 호출
	    boolean result = cartService.addToCart(pdt_id, qty, byr_id);
	    
	    if (result) {
	        response.put("success", true);
	    } else {
	        response.put("success", false);
	        response.put("message", "장바구니에 상품을 추가하는데 실패했습니다. 근데 로그인 안돼있을땐 이메시지뜨면안됨.");
	    }
	    
	    return response;
	}
}