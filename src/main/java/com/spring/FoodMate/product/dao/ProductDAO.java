package com.spring.FoodMate.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.FoodMate.product.dto.CategoryDTO;
import com.spring.FoodMate.product.dto.ProductDTO;

@Repository("productDAO")
public class ProductDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<ProductDTO> pdtSearchList(String keyword) throws DataAccessException {
		List<ProductDTO> searchList = sqlSession.selectList("mapper.product.searchlist", keyword);
		return searchList;
	}
	
	public List<ProductDTO> pdtAllList() throws DataAccessException {
		List<ProductDTO> searchList = sqlSession.selectList("mapper.product.alllist");
		return searchList;
	}
	
	public ProductDTO select1Pdt(String pdt_id) throws DataAccessException {
		ProductDTO searchVO = sqlSession.selectOne("mapper.product.getPdt", pdt_id);
		return searchVO;
	}
	
	public List<CategoryDTO> getCategoryStep(int category_id) throws DataAccessException {
		List<CategoryDTO> list = sqlSession.selectList("mapper.product.getCategoryStep", category_id);
		return list;
	}
	
	public String getNameById(int pdt_id) throws DataAccessException {
		String pdt_name = sqlSession.selectOne("mapper.product.getNameById", pdt_id);
		return pdt_name;
	}
}
