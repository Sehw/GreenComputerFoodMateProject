package com.spring.FoodMate.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.FoodMate.mypage.dao.ProfileDAO;

@Service("profileService")
//@Transactional(propagation=Propagation.REQUIRED)
public class ProfileService {
//	@Autowired
//	private ProfileDAO profileDAO;
	
	public void addNewProfile(String id) throws Exception{
		
//		profileDAO.insertNewBuyer(profileVO);
	}
}
