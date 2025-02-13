package com.spring.FoodMate.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.cart.dto.CartDTO;
import com.spring.FoodMate.cart.service.CartService;
import com.spring.FoodMate.common.Util;
import com.spring.FoodMate.member.dto.BuyerDTO;


@Controller
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	@Autowired
	CartService cartService; 
	
	@RequestMapping(value="/cart/cartlist", method=RequestMethod.GET)
	public ModelAndView cartlist(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		String viewName = Util.getViewName(request);		
		ModelAndView mav = new ModelAndView();
		
		BuyerDTO buyerInfo = (BuyerDTO)session.getAttribute("buyerInfo");
		String byr_id = buyerInfo.getByr_id();
		Map<String, List<CartDTO>> groupedCart = cartService.getGroupedCartList(byr_id);
		// cartService에 구매자 ID를 주면서 구매자의 판매자 별명별로 그룹화된 장바구니 목록을 달라고 요청.
		
		mav.setViewName("common/layout");
		mav.addObject("showNavbar", true);
		mav.addObject("title", "FoodMate-장바구니");
		mav.addObject("body", "/WEB-INF/views" + viewName + ".jsp");
		mav.addObject("groupedCart", groupedCart);
		return mav;
	}
	
	@RequestMapping(value = "/cart/addtocart", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addToCart(@RequestParam("productId") int pdt_id,
	                                      @RequestParam("quantity") int qty,
	                                      HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		
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
	        response.put("message", "장바구니에 상품을 추가 중 오류 발생. 근데 로그인 안돼있을땐 이 오류 뜨면 안됨.");
	    }
	    
	    return response;
	}
	
	@RequestMapping(value = "/cart/updateQty", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateCartQuantity(@RequestParam("cart_id") int cart_id, @RequestParam("qty") int qty) {
		
        Map<String, Object> response = new HashMap<>();
        try {
            boolean success = cartService.updateCartQuantity(cart_id, qty);
            if (success) {
                response.put("success", true);
            } else {
                response.put("success", false);
                response.put("message", "수량 업데이트에 실패했습니다.");
            }
        } catch (Exception e) {
        	e.getStackTrace();
            response.put("success", false);
            response.put("message", "서버 오류가 발생했습니다.");
        }
        return response;
    }
	
	@RequestMapping(value = "/cart/deleteselected", method = RequestMethod.POST)
	public ResponseEntity<?> deleteSelected(@RequestBody Map<String, List<Integer>> request) {
	    List<Integer> cartIds = request.get("cartIds");

	    try {
	        boolean success = true;
	        for (int cartId : cartIds) {
	            success = success && cartService.deleteCartItem(cartId);
	        }

	        Map<String, Object> response = new HashMap<>();
	        if (success) {
	            response.put("success", true);
	            response.put("message", "삭제 성공");
	        } else {
	            response.put("success", false);
	            response.put("message", "삭제 실패. 왜지?");
	        }
	        return ResponseEntity.ok().body(response); // JSON 형식으로 반환
	    } catch (Exception e) {
	        Map<String, Object> response = new HashMap<>();
	        response.put("success", false);
	        response.put("message", "서버 오류로 인한 삭제 실패");
	        return ResponseEntity.status(500).body(response);
	    }
	}
}