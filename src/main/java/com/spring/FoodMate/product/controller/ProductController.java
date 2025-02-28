package com.spring.FoodMate.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.FoodMate.product.dto.CategoryDTO;
import com.spring.FoodMate.product.dto.ProductDTO;
import com.spring.FoodMate.product.dto.ProductQnaDTO;
import com.spring.FoodMate.product.dto.ProductRatingDTO;

public interface ProductController {

    ModelAndView pdtList(String keyword, HttpServletRequest request) throws Exception;

    ModelAndView msPdtList(HttpServletRequest request, HttpSession session) throws Exception;

    ModelAndView pdtDetail(int pdt_id, HttpServletRequest request, HttpServletResponse response) throws Exception;

    ModelAndView pdtAddForm(HttpServletRequest request, HttpServletResponse response) throws Exception;

    ModelAndView pdtEditForm(int pdt_id, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception;

    void pdtAdd(ProductDTO newPdt, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception;

    void pdtEdit(ProductDTO editPdt, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception;
    
    String pdtDelete(int pdt_id, HttpSession session, RedirectAttributes redirectAttributes) throws Exception;
    
    List<CategoryDTO> getSubCategories(int category_id) throws Exception;

    ModelAndView compare(HttpServletRequest request, HttpServletResponse response) throws Exception;
    
    // 상품 후기 리스트 조회
    public List<ProductRatingDTO> getProductRatings(int pdtId) throws Exception;

    // 상품 후기 작성 폼 조회
    public void showAddRatingForm(int pdtId) throws Exception;

    // 상품 후기 작성 처리
    public void insertProductRating(ProductRatingDTO productRating) throws Exception;

    // 상품 후기 수정 폼 조회
    public ProductRatingDTO getProductRatingById(int ratingId) throws Exception;

    // 상품 후기 수정 처리
    public void updateProductRating(ProductRatingDTO productRating) throws Exception;

    // 상품 후기 삭제
    public void deleteProductRating(int ratingId) throws Exception;

    // 상품 문의 리스트 조회
    public List<ProductQnaDTO> getProductQna(int pdtId) throws Exception;

    // 상품 문의 작성 폼 조회
    public void showAddQnaForm(int pdtId) throws Exception;

    // 상품 문의 작성 처리
    public void insertProductQna(ProductQnaDTO productQna) throws Exception;

    // 상품 문의 수정 폼 조회
    public ProductQnaDTO getProductQnaById(int qnaId) throws Exception;

    // 상품 문의 수정 처리
    public void updateProductQna(ProductQnaDTO productQna) throws Exception;

    // 상품 문의 삭제
    public void deleteProductQna(int qnaId) throws Exception;

}