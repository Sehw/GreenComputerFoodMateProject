package com.spring.FoodMate.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.FoodMate.post.dao.PostDAO;
import com.spring.FoodMate.post.vo.postVO;

@Service("postService")
public class PostService {
	@Autowired
	private PostDAO postDAO;

	public postVO selectSigungu(String sigungu) throws DataAccessException {
		return postDAO.selectsigungu(sigungu);
	}
	
	public postVO selectDoro(String doro) throws DataAccessException {
		return postDAO.selectdoro(doro);
	}
	
	public postVO selectdong(String dong) throws DataAccessException {
		return postDAO.selectdong(dong);
	}
}
