package com.spring.FoodMate.recipe.service;

import java.util.List;
import java.util.Map;

import com.spring.FoodMate.recipe.vo.RecipeIngredientVO;
import com.spring.FoodMate.recipe.vo.RecipeStepVO;
import com.spring.FoodMate.recipe.vo.RecipeVO;

public interface RecipeService {

    // 레시피 등록 후 레시피 ID 반환
    int addRecipe(RecipeVO recipe, String byrId) throws Exception;

    // 재료 삽입
    void insertRecipeIngredients(List<RecipeIngredientVO> ingredients) throws Exception;

    // 단계 삽입
    void insertRecipeSteps(List<RecipeStepVO> steps) throws Exception;

    // 레시피 목록 조회
    List<RecipeVO> selectRecipeList() throws Exception;
    
 // 레시피 목록 아이디 조회
    List<RecipeVO> selectRecipeListByrID(String byr_Id) throws Exception;
    
    //레시피 상세 조회
    Map selectRecipeDetail(String rcp_Id) throws Exception;
}




