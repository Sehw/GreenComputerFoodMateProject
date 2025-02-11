package com.spring.FoodMate.mypage.service;

import java.util.ArrayList;
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
		
		// 주문목록이 없을경우 빈리스트를 반환해서 페이지 500에러 방지
		if (list == null || list.isEmpty()) {
		    return new ArrayList<>(); // 빈 리스트 반환하여 SQL 오류 방지
		}
		
		List<OrderDTO> list_2 = mypageDAO.getAllOrdByOrdIds(list);
		return list_2;
	}
	
}
