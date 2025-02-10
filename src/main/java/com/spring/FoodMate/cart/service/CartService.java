package com.spring.FoodMate.cart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FoodMate.cart.dao.CartDAO;
import com.spring.FoodMate.cart.dto.CartDTO;
import com.spring.FoodMate.product.dao.ProductDAO;

@Service("cartService")
public class CartService {

    @Autowired
    private CartDAO cartDAO;  // CartDAO는 실제 DB 작업을 처리하는 클래스
    @Autowired
    private ProductDAO productDAO;

    public boolean addToCart(int pdt_id, int qty, String byr_id) {
    	// cartController에서 보낸 상품ID, 수량, 구매자ID 값을 받아온다.
    	String pdt_name = productDAO.getNameById(pdt_id);
    	// productDAO의 getNameById 메서드에 상품ID를 넣어서 상품이름을 가져온다.
    	// 생각할점 : 상품 ID를 넣었는데 없으면 어떡하지? 예외처리 있어야함.
        CartDTO cartItem = new CartDTO(pdt_id, qty, byr_id, pdt_name);
        // CartDTO의 특수 생성자에 4개의 값을 넣어서 CartDTO형 cartItem 객체를 만든다.
        boolean result = cartDAO.insertCartItem(cartItem);
        return result;
        // DB에 성공적으로 추가되었다면 true 반환
    }
}

