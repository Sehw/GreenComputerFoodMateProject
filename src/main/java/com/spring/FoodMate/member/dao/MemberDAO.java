package com.spring.FoodMate.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.FoodMate.member.vo.BuyerVO;
import com.spring.FoodMate.member.vo.SellerVO;

@Repository("memberDAO")
public class MemberDAO {
	@Autowired
	private SqlSession sqlSession;	
	
	
	public BuyerVO login(Map loginMap) throws DataAccessException{
		BuyerVO buyer=(BuyerVO)sqlSession.selectOne("mapper.member.login",loginMap);
	   return buyer;
	}
	
	public SellerVO loginslr(Map loginMap) throws DataAccessException{
		SellerVO seller=(SellerVO)sqlSession.selectOne("mapper.member.loginslr",loginMap);
	   return seller;
	}
	
	public String selectOverlappedBuyerID(String id) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.member.selectOverlappedBuyerID",id);
		return result;
	}
	public String selectOverlappedSellerID(String id) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.member.selectOverlappedSellerID",id);
		return result;
	}
	
	public void insertNewBuyer(BuyerVO memberVO) throws DataAccessException{
		sqlSession.insert("mapper.member.insertNewBuyer",memberVO);
	}
	
	public void insertNewSeller(SellerVO sellerVO) throws DataAccessException{
		sqlSession.insert("mapper.member.insertNewSeller",sellerVO);
	}
}
