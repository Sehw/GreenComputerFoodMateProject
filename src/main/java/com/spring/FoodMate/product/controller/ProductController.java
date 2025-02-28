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

}