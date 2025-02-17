package com.spring.FoodMate.cart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.FoodMate.cart.dto.CartDTO;
import com.spring.FoodMate.common.exception.DBException;

@Repository("cartDAO")
public class CartDAO {
    @Autowired
	private SqlSession sqlSession;
	
	public boolean insertCartItem(CartDTO cartDTO) {
        try {
            int result = sqlSession.insert("mapper.cart.addPdt", cartDTO);
            return result > 0;
            // result 는 insert 한 행 수를 표시하므로 성공하면 1 이상, 실패하면 0이다.
        } catch (DataAccessException e) {
        	throw new DBException("CartDAO.insertCartItem 에러!" + cartDTO.toLogString(), e);
        }
    }
	
	public List<CartDTO> getCartListById(String byr_id) {
		// 구매자 ID를 받아온다.
		try {
			List<CartDTO> list = sqlSession.selectList("mapper.cart.getCartList", byr_id);
			// DB에 구매자 ID를 주면서 구매자의 cartDTO 리스트를 요청한다.
			return list;
		} catch (DataAccessException e) {
            throw new DBException("CartDAO.getCartListById 에러! byr_id=" + byr_id, e);
        }
	}
	
	// 카트 검사해서 
	public CartDTO isInMyCart(int pdt_id, String byr_id) {
		try {
			CartDTO cartDTO = new CartDTO(pdt_id, byr_id);
			CartDTO resultDTO = sqlSession.selectOne("mapper.cart.isInMyCart", cartDTO);
			return resultDTO;
		} catch (DataAccessException e) {
			throw new DBException("CartDAO.inInMyCart 에러! pdt_id =" + pdt_id + ", byr_id = " + byr_id , e);
		}
	}
	
	public int updateCartQuantity(int cart_id, int qty) {
	    Map<String, Object> params = new HashMap<>();
	    try {
	        params.put("cart_id", cart_id);
	        params.put("qty", qty);
	        return sqlSession.update("mapper.cart.updateCartQuantity", params);
	    } catch (DataAccessException e) {
	        throw new DBException("CartDAO.updateCartQuantity 에러!" + params.toString(), e);
	    }
	}
	
	public int deleteCartItem(int cart_id) {
		try {
			return sqlSession.delete("mapper.cart.deleteCartItem", cart_id);
		} catch (DataAccessException e) {
			throw new DBException("CartDAO.deleteCartItem 에러! cart_id=" + cart_id, e);
		}
    }
}