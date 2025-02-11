package com.spring.FoodMate.cart.dao;

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
}