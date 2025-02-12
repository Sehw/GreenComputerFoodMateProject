package com.spring.FoodMate.cart.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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

    public CartDTO isInMyCart(int pdt_id, String byr_id) {
    	try {
    		CartDTO cartTest = new CartDTO(pdt_id, byr_id);
    		CartDTO resultDTO = cartDAO.isInMyCart(cartTest);
    		return resultDTO;
    	} catch (Exception e) {
    		CartDTO error = new CartDTO();
    		error.setCart_id(0);
    		return error;
    	}
    }
    
    public boolean addToCart(int pdt_id, int qty, String byr_id) {
    	try {
    		CartDTO duplResult = isInMyCart(pdt_id, byr_id);
    		
    		int dupl;
    		if(duplResult != null) {
    			if(duplResult.getCart_id() == 0) { dupl = -1; }
    			else { dupl = 1; } 
    		} else { dupl = 0; }
    		
    		if(dupl==0) {
    			// cartController에서 보낸 상품ID, 수량, 구매자ID 값을 받아온다.
            	String pdt_name = productDAO.getNameById(pdt_id);
            	// productDAO의 getNameById 메서드에 상품ID를 넣어서 상품이름을 가져온다.
            	// 생각할점 : 상품 ID를 넣었는데 없으면 어떡하지? 예외처리 있어야함.
                CartDTO cartItem = new CartDTO(pdt_id, qty, byr_id, pdt_name);
                // CartDTO의 특수 생성자에 4개의 값을 넣어서 CartDTO형 cartItem 객체를 만든다.
                boolean result = cartDAO.insertCartItem(cartItem);
                return result;
                // DB에 성공적으로 추가되었다면 true 반환
    		} else if(dupl==1) {
    			int cartId = duplResult.getCart_id();
    			int newQty = duplResult.getQty() + qty;
    			return updateCartQuantity(cartId, newQty);
    		} else {
    			return false;
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    		return false;
    	}
    }
    
    public Map<String, List<CartDTO>> getGroupedCartList(String byr_id) throws Exception {
    	// cartController 에서 보낸 구매자 ID를 받아온다.
    	List<CartDTO> cartList = cartDAO.getCartListById(byr_id);
    	// cartDAO에 구매자ID를 주면서 구매자의 cartDTO 리스트를 요청한다.
        Map<String, List<CartDTO>> groupedCart = new LinkedHashMap<>();
        // 링크드 해시맵? 으로 판매자 별명별로 상품 그룹지을 준비
        for (CartDTO cart : cartList) {    
            groupedCart.computeIfAbsent(cart.getNickname(), k -> new ArrayList<>()).add(cart);
            // 판매자 별명 기준으로 그룹화
        }
        
        return groupedCart;
    }
    
    public boolean updateCartQuantity(int cart_id, int qty) {
        return cartDAO.updateCartQuantity(cart_id, qty) > 0; // 업데이트된 행 수가 1 이상이면 성공
    }
    
    public boolean deleteCartItem(int cart_id) {
        int result = cartDAO.deleteCartItem(cart_id);
        return result > 0;  // 성공하면 true, 실패하면 false
    }   
}