package com.spring.FoodMate.recipe.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

public interface RecipeController {

 
    // 레시피 작성 폼
    ModelAndView addRecipeForm(HttpServletRequest request) throws Exception;

    // 레시피 등록
    ResponseEntity<Map<String, Object>> addNewRecipe(
            String title, String foodName, String reqTime, String description,
            MultipartFile mainImg, List<String> ingredientsNames,
            List<Integer> ingredientsQty, List<String> ingredientsUnits,
            List<Integer> stepNumbers, List<String> stepDescriptions,
            List<MultipartFile> stepImages, HttpSession session
        ) throws Exception;

    // 레시피 목록 조회
    ModelAndView selectRecipeList(HttpServletRequest request) throws Exception;
    
     // 레시피 상세 조회
    ModelAndView selectRecipeDetail(int rcp_Id, HttpServletRequest request) throws Exception;
    
    //레시피 수정
    ModelAndView RecipeEditForm(HttpServletRequest request) throws Exception;
    }



    
    


