package com.spring.FoodMate.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FoodMate.common.exception.DBException;
import com.spring.FoodMate.product.dao.ProductDAO;
import com.spring.FoodMate.product.dto.CategoryDTO;
import com.spring.FoodMate.product.dto.ProductDTO;
import com.spring.FoodMate.product.exception.ProductException;

@Service("productService")
public class ProductService {
	@Autowired
	private ProductDAO productDAO;
	
	public List<ProductDTO> pdtList(String keyword) {
		try {
			if(keyword.equals("")) {
				return productDAO.pdtAllList();
			} else {
				return productDAO.pdtSearchList(keyword);
			}
		} catch (DBException e) {
			throw new ProductException("ProductService에서 DB예외 전달.", e);
		} catch (Exception e) {
			throw new ProductException("ProductService.pdtList 에러! keyword = '" + keyword + "'", e);
		}
	}
	
	public List<ProductDTO> ms_pdtList(String slr_id) {
		try {
			return productDAO.pdtListBySlrId(slr_id);
		} catch (DBException e) {
			throw new ProductException("ProductService에서 DB예외 전달.", e);
		} catch (Exception e) {
			throw new ProductException("ProductService.ms_pdtList 에러! slr_id = '" + slr_id + "'", e);
		}
	}
	
	public ProductDTO select1PdtByPdtId(int pdt_id) {
		try {
			return productDAO.select1Pdt(pdt_id);
		} catch (DBException e) {
			throw new ProductException("ProductService에서 DB예외 전달.", e);
		} catch (Exception e) {
			throw new ProductException("ProductService.select1PdtByPdtId 에러! pdt_id = '" + pdt_id + "'", e);
		}
	}
	
	public List<CategoryDTO> getGrandCategoryList() {
		try {
			return productDAO.getGrandCategoryList();
		} catch (DBException e) {
			throw new ProductException("ProductService에서 DB예외 전달.", e);
		} catch (Exception e) {
			throw new ProductException("ProductService.getGrandCategoryList 에러!", e);
		}
	}
	
	public List<CategoryDTO> getChildCategoryList(int category_id) {
		try {
			return productDAO.getChildCategoryList(category_id);
		} catch (DBException e) {
			throw new ProductException("ProductService에서 DB예외 전달.", e);
		} catch (Exception e) {
			throw new ProductException("ProductService.getChildCategoryList 에러! category_id = '" + category_id + "'", e);
		}
	}
	
	public List<CategoryDTO> categoryStep(int category_id) {
		try {
			return productDAO.getCategoryStep(category_id);
		} catch (DBException e) {
			throw new ProductException("ProductService에서 DB예외 전달.", e);
		} catch (Exception e) {
			throw new ProductException("ProductService.categoryStep 에러! category_id = '" + category_id + "'", e);
		}
	}
	
	public int insertNewProduct(ProductDTO newpdt) {
		try {
			return productDAO.insertNewProduct(newpdt);
		} catch (DBException e) {
			throw new ProductException("ProductService에서 DB예외 전달.", e);
		} catch (Exception e) {
			throw new ProductException("ProductService.insertNewProduct 에러!" + newpdt.toLogString(), e);
		}
	}
}