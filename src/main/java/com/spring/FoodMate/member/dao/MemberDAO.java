package com.spring.FoodMate.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.FoodMate.member.vo.BuyerVO;

@Repository("memberDAO")
public class MemberDAO {
	@Autowired
	private SqlSession sqlSession;	
	
	
	public BuyerVO login(Map loginMap) throws DataAccessException{
		BuyerVO member=(BuyerVO)sqlSession.selectOne("mapper.member.login",loginMap);
	   return member;
	}
	
	public String selectOverlappedBuyerID(String id) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.member.selectOverlappedBuyerID",id);
		return result;
	}
	
	public void insertNewBuyer(BuyerVO memberVO) throws DataAccessException{
		sqlSession.insert("mapper.member.insertNewBuyer",memberVO);
	}
}
