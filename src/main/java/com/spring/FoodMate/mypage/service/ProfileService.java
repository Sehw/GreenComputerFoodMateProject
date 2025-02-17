package com.spring.FoodMate.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.FoodMate.mypage.dao.ProfileDAO;
import com.spring.FoodMate.mypage.dto.ProfileDTO;

@Service("profileService")
//@Transactional(propagation=Propagation.REQUIRED)
public class ProfileService {
	@Autowired
	private ProfileDAO profileDAO;
	
	public void addNewBuyerProfile(String id) throws Exception{		
		ProfileDTO _profileDTO = new ProfileDTO(id);
		_profileDTO.setNickname("MateMember");
		_profileDTO.setImg_path("profile/defaultimg.jpg");
		_profileDTO.setBIO("");
		profileDAO.insertNewBuyerProfile(_profileDTO);
	}
	
	public ProfileDTO getBuyerProfile(String id) throws Exception{
		return profileDAO.getBuyerProfile(id);
	}
	
	public boolean updateUserProfile(ProfileDTO _profileDTO) throws Exception{	
		if(profileDAO.updateUserProfile(_profileDTO) == 1) {
			return true;
		}
		return false;
	}
}
