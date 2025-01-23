package com.spring.FoodMate.post.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.FoodMate.post.vo.postVO;


@Repository("postDAO")
public class PostDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public postVO selectsigungu(String postVO) throws DataAccessException {
		postVO result = (postVO)sqlSession.selectOne("mapper.post.selectPostBysigungu",postVO);
		return result;
	}
	
	public postVO selectdoro(String postVO) throws DataAccessException {
		postVO result = (postVO)sqlSession.selectOne("mapper.post.selectPostBydoro",postVO);
		return result;
	}
	
	public postVO selectdong(String postVO) throws DataAccessException {
		postVO result = (postVO)sqlSession.selectOne("mapper.post.selectPostBydong",postVO);
		return result;
	}
}
