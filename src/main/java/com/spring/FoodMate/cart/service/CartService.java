package com.spring.FoodMate.cart.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FoodMate.cart.dao.CartDAO;
import com.spring.FoodMate.cart.dto.CartDTO;
import com.spring.FoodMate.cart.exception.CartException;
import com.spring.FoodMate.common.exception.DBException;
import com.spring.FoodMate.product.dao.ProductDAO;

@Service("cartService")
public class CartService {
    @Autowired
    private CartDAO cartDAO;
    @Autowired
    private ProductDAO productDAO;

    public boolean addToCart(int pdt_id, int qty, String byr_id) {
        try {
            CartDTO duplResult = cartDAO.isInMyCart(pdt_id, byr_id); // 담으려는 상품이 이미 장바구니에 있냐?

            if (duplResult != null && duplResult.getCart_id() != 0) {
                return updateCartQuantity(duplResult.getCart_id(), duplResult.getQty() + qty);
                // 이미 장바구니에 있으면 수량만 더해
            }

            // 없으면 새 상품 담아
            String pdt_name = productDAO.getNameById(pdt_id); // 상품 이름 가져오기
            CartDTO cartItem = new CartDTO(pdt_id, qty, byr_id, pdt_name); // 장바구니 아이템 생성
            return cartDAO.insertCartItem(cartItem); // 장바구니에 아이템 추가

        } catch (DBException e) {
        	throw new CartException("CartService에서 DB예외 전달.", e);
        } catch (Exception e) {
            throw new CartException("CartService.addToCart 에러! pdt_id=" + pdt_id + ", qty=" + qty + ", byr_id=" + byr_id, e);
        }
    }

    public Map<String, List<CartDTO>> getGroupedCartList(String byr_id) {
        try {
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
        } catch (DBException e) {
        	throw new CartException("CartService에서 DB예외 전달.", e);
        } catch (Exception e) {
            throw new CartException("CartService.getGroupedCartList 에러! byr_id=" + byr_id, e);
        }
    }
    
    public boolean updateCartQuantity(int cart_id, int qty) {
        try {
            return cartDAO.updateCartQuantity(cart_id, qty) > 0; // 업데이트된 행 수가 1 이상이면 성공
        } catch (DBException e) {
        	throw new CartException("CartService에서 DB예외 전달.", e);
        } catch (Exception e) {
            throw new CartException("CartService.updateCartQuantity 에러! cart_id=" + cart_id + ", qty=" + qty, e);
        }
    }

    public boolean deleteCartItem(int cart_id) {
    	try {
    		return cartDAO.deleteCartItem(cart_id) > 0;  // 성공하면 true, 실패하면 false
        } catch (DBException e) {
        	throw new CartException("CartService에서 DB예외 전달.", e);
        } catch (Exception e) {
            throw new CartException("CartService.updateCartQuantity 에러! cart_id=" + cart_id, e);
        }
    }   
}