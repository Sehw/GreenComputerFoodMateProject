package com.spring.FoodMate.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.FoodMate.cart.dto.CartDTO;
import com.spring.FoodMate.member.dto.BuyerDTO;
import com.spring.FoodMate.member.dto.SellerDTO;

@Repository("orderDAO")
public class OrderDAO {
	@Autowired
	private SqlSession sqlSession;	
	
    public List<CartDTO> getCartItemsByIds(List<Integer> cartIdList) {
        return sqlSession.selectList("mapper.order.getCartItemsByIds", cartIdList);
    }
}
