package com.spring.FoodMate.order.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FoodMate.cart.dto.CartDTO;
import com.spring.FoodMate.mypage.dao.MypageDAO;
import com.spring.FoodMate.order.dao.OrderDAO;
import com.spring.FoodMate.order.dto.OrderDTO;

@Service("OrderService")
public class OrderService {		
	@Autowired
	private OrderDAO orderDAO;
	
    public List<CartDTO> getCartItems(List<Integer> cartIdList) {
        return orderDAO.getCartItemsByIds(cartIdList);
    }
	
}
