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
			ProductDTO pdt = productDAO.select1Pdt(pdt_id);
			if(pdt != null) {
				return pdt;
			} else {
				throw new ProductException("ProductService.select1PdtByPdtId 에러!", 201);
			}
		} catch (DBException e) {
			throw new ProductException("ProductService에서 DB예외 전달.", e);
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
	
	public boolean insertNewProduct(ProductDTO newPdt) {
		try {
			int result = productDAO.insertNewProduct(newPdt);
			if(result <= 0) {
				throw new ProductException("ProductService.insertNewProduct 에러!" + newPdt.toLogString(), 202);
			}
			return result > 0;
		} catch (DBException e) {
			throw new ProductException("ProductService에서 DB예외 전달.", e);
		}
	}
	
	public boolean updateProduct(ProductDTO editPdt) {
		try {
			int result = productDAO.updateProduct(editPdt);
			if(result <= 0) {
				throw new ProductException("ProductService.updateProduct 에러!" + editPdt.toLogString(), 204);
			}
			return result > 0;
		} catch (DBException e) {
			throw new ProductException("ProductService에서 DB예외 전달.", e);
		}
	}
	
	public boolean deleteProduct(int pdt_id) {
		try {
			int result = productDAO.deleteProduct(pdt_id);
			if(result <= 0) {
				throw new ProductException("ProductService.deleteProduct 에러! pdt_id = " + pdt_id, 205);
			}
			return result > 0;
		} catch (DBException e) {
			throw new ProductException("ProductService에서 DB예외 전달.", e);
		}
	}
}