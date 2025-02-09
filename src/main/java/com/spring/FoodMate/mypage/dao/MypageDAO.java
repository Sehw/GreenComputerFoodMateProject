package com.spring.FoodMate.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.FoodMate.order.dto.OrderDTO;

@Repository("mypageDAO")
public class MypageDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<Integer> getOrdIdById(String id) throws DataAccessException{
		List<Integer> list = sqlSession.selectList("mapper.order.OrdIdById", id);
		return list;
	}
	
	public List<OrderDTO> getAllOrdByOrdIds(List<Integer> ord_idList) throws DataAccessException {
	    List<OrderDTO> orderDetails = sqlSession.selectList("mapper.order.AllOrdByOrdIds", ord_idList);
	    return orderDetails;
	}
	
}