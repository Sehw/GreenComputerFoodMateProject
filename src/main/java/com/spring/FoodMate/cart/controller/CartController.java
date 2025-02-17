package com.spring.FoodMate.cart.controller;

import java.util.Map;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CartController {
    ModelAndView cartlist(HttpServletRequest request, HttpSession session) throws Exception;
    
    Map<String, Object> addToCart(@RequestParam("productId") int pdt_id,
                                  @RequestParam("quantity") int qty,
                                  HttpSession session);
    
    Map<String, Object> updateCartQuantity(@RequestParam("cart_id") int cart_id,
                                          @RequestParam("qty") int qty);
    
    Map<String, Object> deleteSelected(@RequestBody Map<String, List<Integer>> request);
}