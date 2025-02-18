package com.spring.FoodMate.recipe.service;

import java.util.List;
import java.util.Map;

import com.spring.FoodMate.recipe.dto.RecipeDTO;
import com.spring.FoodMate.recipe.dto.RecipeIngredientDTO;
import com.spring.FoodMate.recipe.dto.RecipeStepDTO;

public interface RecipeService {

    // 레시피 등록 후 레시피 ID 반환
    int addRecipe(RecipeDTO recipe, String byrId) throws Exception;

    // 재료 삽입
    void insertRecipeIngredients(List<RecipeIngredientDTO> ingredients) throws Exception;

    // 단계 삽입
    void insertRecipeSteps(List<RecipeStepDTO> steps) throws Exception;

    // 레시피 목록 조회
    List<RecipeDTO> selectRecipeList() throws Exception;
    
 // 레시피 목록 아이디 조회
    List<RecipeDTO> selectRecipeListByrID(String byr_Id) throws Exception;
    
    //레시피 상세 조회
    Map<String, Object> selectRecipeDetail(int rcp_Id) throws Exception;
}




