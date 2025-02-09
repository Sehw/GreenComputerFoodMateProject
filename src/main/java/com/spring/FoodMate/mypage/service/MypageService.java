package com.spring.FoodMate.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FoodMate.mypage.dao.MypageDAO;
import com.spring.FoodMate.order.dto.OrderDTO;

@Service("MypageService")
public class MypageService {		
	@Autowired
	private MypageDAO mypageDAO;
	
	public List<OrderDTO> getOrderById(String id) throws Exception {
		List<Integer> list = mypageDAO.getOrdIdById(id);
		List<OrderDTO> list_2 = mypageDAO.getAllOrdByOrdIds(list);
		return list_2;
	}
	
}
