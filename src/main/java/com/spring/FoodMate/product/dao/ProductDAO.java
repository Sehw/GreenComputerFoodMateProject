package com.spring.FoodMate.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.FoodMate.common.exception.DBException;
import com.spring.FoodMate.product.dto.CategoryDTO;
import com.spring.FoodMate.product.dto.ProductDTO;

@Repository("productDAO")
public class ProductDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<ProductDTO> pdtSearchList(String keyword) {
		try {
			List<ProductDTO> searchList = sqlSession.selectList("mapper.product.searchlist", keyword);
			return searchList;
		} catch (DataAccessException e) {
			throw new DBException("ProductDAO.pdtSerachList 에러! 검색어 : '" + keyword + "'", e);
		}	
	}
	
	public List<ProductDTO> pdtAllList() {
		try {
			List<ProductDTO> searchList = sqlSession.selectList("mapper.product.alllist");
			return searchList;
		} catch (DataAccessException e) {
			throw new DBException("ProductDAO.pdtAllList 에러!", e);
		}
	}
	
	public List<ProductDTO> pdtListBySlrId(String slr_id) {
		try {
			List<ProductDTO> searchList = sqlSession.selectList("mapper.product.listBySlrSelf", slr_id);
			return searchList;
		} catch (DataAccessException e) {
			throw new DBException("ProductDAO.pdtListBySlrId 에러! 판매자 id : '" + slr_id + "'", e);
		}
	}
	
	public ProductDTO select1Pdt(int pdt_id) {
		try {
			ProductDTO searchDTO = sqlSession.selectOne("mapper.product.getPdt", pdt_id);
			return searchDTO;
		} catch (DataAccessException e) {
			throw new DBException("ProductDAO.select1Pdt 에러! pdt_id = '" + pdt_id + "'", e);
		}
	}
	
	public List<CategoryDTO> getGrandCategoryList() {
		try {
			List<CategoryDTO> list = sqlSession.selectList("mapper.product.getGrandCategory");
			return list;
		} catch (DataAccessException e) {
			throw new DBException("ProductDAO.getGrandCategoryList 에러!", e);
		}
	}
	
	public List<CategoryDTO> getChildCategoryList(int parent_id) {
		try {
			List<CategoryDTO> list = sqlSession.selectList("mapper.product.getChildCategory", parent_id);
			return list;
		} catch (DataAccessException e) {
			throw new DBException("ProductDAO.getChildCategoryList 에러! parent_id = '" + parent_id + "'", e);
		}
	}
	
	public List<CategoryDTO> getCategoryStep(int category_id) {
		try {
			List<CategoryDTO> list = sqlSession.selectList("mapper.product.getCategoryStep", category_id);
			return list;
		} catch (DataAccessException e) {
			throw new DBException("ProductDAO.getCategoryStep 에러! category_id = '" + category_id + "'", e);
		}
	}
	
	public String getNameById(int pdt_id) {
		try {
			String pdt_name = sqlSession.selectOne("mapper.product.getNameById", pdt_id);
			return pdt_name;
		} catch (DataAccessException e) {
			throw new DBException("ProductDAO.getNameById 에러! pdt_id = '" + pdt_id + "'", e);
		}
	}
	
	public int insertNewProduct(ProductDTO newPdt) {
		try {
			int result = sqlSession.insert("mapper.product.newPdt", newPdt);
			return result;
		} catch (DataAccessException e) {
			throw new DBException("ProductDAO.insertNewProduct 에러!" + newPdt.toLogString(), e);
		}
	}
	
	public int updateProduct(ProductDTO editPdt) {
		try {
			int result = sqlSession.update("mapper.product.editPdt", editPdt);
			return result;
		} catch (DataAccessException e) {
			throw new DBException("ProductDAO.updateProduct 에러!" + editPdt.toLogString(), e);
		}
	}
	
	public int deleteProduct(int pdt_id) {
		try {
			int result = sqlSession.delete("mapper.product.deletePdt", pdt_id);
			return result;
		} catch (DataAccessException e) {
			throw new DBException("ProductDAO.deleteProduct 에러! pdt_id = " + pdt_id, e);
		}
	}
	
}