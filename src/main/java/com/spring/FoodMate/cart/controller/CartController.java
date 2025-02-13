package com.spring.FoodMate.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.member.dto.BuyerDTO;
import com.spring.FoodMate.cart.dto.CartDTO;
import com.spring.FoodMate.cart.service.CartService;
import com.spring.FoodMate.common.Util;

@Controller
public class CartController {
	@Autowired
	CartService cartService; 
	
	@RequestMapping(value="/cart/cartlist", method=RequestMethod.GET)
	public ModelAndView cartlist(HttpServletRequest request, HttpSession session) throws Exception {
		BuyerDTO buyerInfo = (BuyerDTO)session.getAttribute("buyerInfo");
		Map<String, List<CartDTO>> groupedCart = cartService.getGroupedCartList(buyerInfo.getByr_id());
		// cartService에 구매자 ID를 주면서 구매자의 판매자 별명별로 그룹화된 장바구니 목록을 달라고 요청.
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/layout");
		mav.addObject("showNavbar", true);
		mav.addObject("title", "FoodMate-장바구니");
		mav.addObject("body", "/WEB-INF/views" + Util.getViewName(request) + ".jsp");
		mav.addObject("groupedCart", groupedCart);
		return mav;
	}
	
	@RequestMapping(value = "/cart/addtocart", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addToCart(@RequestParam("productId") int pdt_id,
	                                      @RequestParam("quantity") int qty,
	                                      HttpSession session) {
	    BuyerDTO buyerInfo = (BuyerDTO) session.getAttribute("buyerInfo");
	    Map<String, Object> response = new HashMap<>();
	     
	    if (cartService.addToCart(pdt_id, qty, buyerInfo.getByr_id())) {
	    //장바구니 테이블에 insert 시도하고 성공시 true, 이외엔 false 반환
	        response.put("success", true);
	        response.put("message", "장바구니에 상품을 "+qty+" 개 담았습니다. 계속 쇼핑하시겠습니까?");
	    } else {
	        response.put("success", false);
	        response.put("message", "장바구니에 상품을 추가 중 오류가 발생했습니다. 잠시 후 다시 시도해 보세요.");
	    }
	    
	    return response;
	}
	
	@RequestMapping(value = "/cart/updateQty", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateCartQuantity(@RequestParam("cart_id") int cart_id,
    		@RequestParam("qty") int qty) {		
        Map<String, Object> response = new HashMap<>();
        try {            
            if (cartService.updateCartQuantity(cart_id, qty)) {
            // 장바구니 테이블에 수량 변경 시도하고 boolean 으로 결과 반환
                response.put("success", true);
            } else {
                response.put("success", false);
                response.put("message", "수량 업데이트에 실패했습니다. 잠시 후 다시 시도해 보세요.");
            }
        } catch (Exception e) {
        	e.printStackTrace();
            response.put("success", false);
            response.put("message", "서버 오류가 발생했습니다.");
        }
        return response;
    }
	
	@RequestMapping(value = "/cart/deleteselected", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteSelected(@RequestBody Map<String, List<Integer>> request) {
	    Map<String, Object> response = new HashMap<>();
	    List<Integer> cartIds = request.get("cartIds");

	    try {
	        boolean success = true;
	        for (int cartId : cartIds) {
	            success = success && cartService.deleteCartItem(cartId);
	        }

	        response.put("success", success);
	        if (!success) response.put("message", "삭제 실패. 잠시 후 다시 시도해 주세요.");
	    } catch (Exception e) {
	        response.put("success", false);
	        response.put("message", "서버 오류 발생");
	    }

	    return response;
	}

}