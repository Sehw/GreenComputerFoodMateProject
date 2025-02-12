package com.spring.FoodMate.cart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.FoodMate.cart.dto.CartDTO;

@Repository("cartDAO")
public class CartDAO {
    @Autowired
	private SqlSession sqlSession;
	
	public boolean insertCartItem(CartDTO cartItem) {
        try {
            int result = sqlSession.insert("mapper.cart.addPdt", cartItem);
            return result > 0;
        } catch (DataAccessException e) {
            // 예외 로그 기록
        	e.printStackTrace();
            return false; // 실패하면 false 반환
        }
    }
	
	public List<CartDTO> getCartListById(String byr_id) {
		// 구매자 ID를 받아온다.
		try {
			List<CartDTO> list = sqlSession.selectList("mapper.cart.getCartList", byr_id);
			// DB에 구매자 ID를 주면서 구매자의 cartDTO 리스트를 요청한다.
			return list;
		} catch (DataAccessException e) {
        	e.printStackTrace();
            // 예외 로그 콘솔에 출력. 나중에 로그 기록하는 뭐시기 만들어야 할듯.
            return null; // 실패하면 null 반환
        }
	}
	
	public CartDTO isInMyCart(CartDTO cartDTO) {
		try {
			CartDTO resultDTO = sqlSession.selectOne("mapper.cart.isInMyCart", cartDTO);
			return resultDTO;
		} catch (DataAccessException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public int updateCartQuantity(int cart_id, int qty) {
		try {
			Map<String, Object> params = new HashMap<>();
	        params.put("cart_id", cart_id);
	        params.put("qty", qty);
	        int result = sqlSession.update("mapper.cart.updateCartQuantity", params);
	        return result;
		} catch (DataAccessException e) {
			e.printStackTrace();
			return -1;
		}   
    }
	
	public int deleteCartItem(int cart_id) {
		try {
			return sqlSession.delete("mapper.cart.deleteCartItem", cart_id);
		} catch (DataAccessException e) {
			e.printStackTrace();
			return -1;
		}
    }
}