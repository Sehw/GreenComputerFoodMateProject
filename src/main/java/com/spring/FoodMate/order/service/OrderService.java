package com.spring.FoodMate.order.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FoodMate.cart.dto.CartDTO;
import com.spring.FoodMate.mypage.dao.MypageDAO;
import com.spring.FoodMate.order.dao.OrderDAO;
import com.spring.FoodMate.order.dto.OrderDTO;
import com.spring.FoodMate.product.dto.ProductDTO;

@Service("OrderService")
public class OrderService {		
	@Autowired
	private OrderDAO orderDAO;
	
    public List<CartDTO> getCartItems(List<Integer> cartIdList) {
        return orderDAO.getCartItemsByIds(cartIdList);
    }
	
    // 사용자가 주문한 상품 목록을 가져오는 메소드
    public List<ProductDTO> getOrderedProducts(String buyerId) {
        return orderDAO.getOrderedProductsByBuyerId(buyerId);  // OrderDAO에서 가져오는 메소드
    }
    
}
