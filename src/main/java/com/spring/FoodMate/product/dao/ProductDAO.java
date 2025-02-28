package com.spring.FoodMate.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.FoodMate.common.exception.DBException;
import com.spring.FoodMate.product.dto.CategoryDTO;
import com.spring.FoodMate.product.dto.ProductDTO;
import com.spring.FoodMate.product.dto.ProductQnaDTO;
import com.spring.FoodMate.product.dto.ProductRatingDTO;

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
	
	
	// 상품 후기 등록
    public int insertProductRating(ProductRatingDTO newProductRating) {
        try {
            int result = sqlSession.insert("mapper.product.insertProductRating", newProductRating);
            return result;
        } catch (DataAccessException e) {
            throw new DBException("ProductDAO.insertProductRating 에러!" + newProductRating.toLogString(), e);
        }
    }

    // 상품 후기 조회 (상품 ID에 해당하는 후기들)
    public List<ProductRatingDTO> getProductRatings(int pdt_id) {
        try {
            List<ProductRatingDTO> ratingsList = sqlSession.selectList("mapper.product.getProductRatings", pdt_id);
            return ratingsList;
        } catch (DataAccessException e) {
            throw new DBException("ProductDAO.getProductRatings 에러! pdt_id = '" + pdt_id + "'", e);
        }
    }

    // 상품 후기 삭제
    public int deleteProductRating(int cmt_pdt_rating_id) {
        try {
            int result = sqlSession.delete("mapper.product.deleteProductRating", cmt_pdt_rating_id);
            return result;
        } catch (DataAccessException e) {
            throw new DBException("ProductDAO.deleteProductRating 에러! cmt_pdt_rating_id = '" + cmt_pdt_rating_id + "'", e);
        }
    }

    // 상품 후기 수정
    public int updateProductRating(ProductRatingDTO productRatingDTO) {
        try {
            int result = sqlSession.update("mapper.product.updateProductRating", productRatingDTO);
            return result;
        } catch (DataAccessException e) {
            throw new DBException("ProductDAO.updateProductRating 에러!" + productRatingDTO.toLogString(), e);
        }
    }
    
    // 상품 후기 ID로 조회하는 메소드
    public ProductRatingDTO getProductRatingById(int rating_id) {
        try {
            return sqlSession.selectOne("mapper.product.getProductRatingById", rating_id);
        } catch (DataAccessException e) {
            throw new DBException("ProductDAO.getProductRatingById 에러! rating_id = " + rating_id, e);
        }
    }
    
    // 상품 문의 등록
    public int insertProductQna(ProductQnaDTO newProductQna) {
        try {
            int result = sqlSession.insert("mapper.product.insertProductQna", newProductQna);
            return result;
        } catch (DataAccessException e) {
            throw new DBException("ProductDAO.insertProductQna 에러!" + newProductQna.toLogString(), e);
        }
    }

    // 상품 문의 조회 (상품 ID에 해당하는 문의들)
    public List<ProductQnaDTO> getProductQna(int pdt_id) {
        try {
            List<ProductQnaDTO> qnaList = sqlSession.selectList("mapper.product.getProductQna", pdt_id);
            return qnaList;
        } catch (DataAccessException e) {
            throw new DBException("ProductDAO.getProductQna 에러! pdt_id = '" + pdt_id + "'", e);
        }
    }
    
 // 상품 문의 ID로 단일 문의 조회
    public ProductQnaDTO getProductQnaById(int qna_id) {
        try {
            // MyBatis의 selectOne을 사용해서 하나의 결과를 조회
            ProductQnaDTO productQna = sqlSession.selectOne("mapper.product.getProductQnaById", qna_id);
            return productQna;
        } catch (DataAccessException e) {
            throw new DBException("ProductDAO.getProductQnaById 에러! qna_id = '" + qna_id + "'", e);
        }
    }

    // 상품 문의 삭제
    public int deleteProductQna(int cmt_pdt_qna_id) {
        try {
            int result = sqlSession.delete("mapper.product.deleteProductQna", cmt_pdt_qna_id);
            return result;
        } catch (DataAccessException e) {
            throw new DBException("ProductDAO.deleteProductQna 에러! cmt_pdt_qna_id = '" + cmt_pdt_qna_id + "'", e);
        }
    }

    // 상품 문의 수정
    public int updateProductQna(ProductQnaDTO productQnaDTO) {
        try {
            int result = sqlSession.update("mapper.product.updateProductQna", productQnaDTO);
            return result;
        } catch (DataAccessException e) {
            throw new DBException("ProductDAO.updateProductQna 에러!" + productQnaDTO.toLogString(), e);
        }
    }
    
    
	
}