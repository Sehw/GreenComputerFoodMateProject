package com.spring.FoodMate.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.FoodMate.product.vo.ProductVO;

@Repository("productDAO")
public class ProductDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<ProductVO> pdtSearchList(String keyword) throws DataAccessException {
		List<ProductVO> searchList = sqlSession.selectList("mapper.product.searchlist", keyword);
		return searchList;
	}
	
	public List<ProductVO> pdtAllList() throws DataAccessException {
		List<ProductVO> searchList = sqlSession.selectList("mapper.product.alllist");
		return searchList;
	}
	
	public ProductVO select1Pdt(String pdt_id) throws DataAccessException {
		ProductVO searchVO = sqlSession.selectOne("mapper.product.getPdt", pdt_id);
		return searchVO;
	}
	
	
}
