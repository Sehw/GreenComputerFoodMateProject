package com.spring.FoodMate.recipe.dao;



import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.FoodMate.recipe.vo.RecipeIngredientVO;
import com.spring.FoodMate.recipe.vo.RecipeStepVO;
import com.spring.FoodMate.recipe.vo.RecipeVO;

public interface RecipeDAO {

    // 레시피 등록
    void insertRecipe(RecipeVO recipe) throws Exception;

    // 레시피 ID 반환 (마지막으로 삽입된 레시피 ID)
    int selectLastInsertedRecipeId() throws Exception;

    // 재료 삽입
    void insertRecipeIngredients(RecipeIngredientVO ingredient) throws Exception;

    // 단계 삽입
    void insertRecipeSteps(RecipeStepVO step) throws Exception;

    // 레시피 목록 조회
    List<RecipeVO> selectRecipeList() throws Exception;
    
    // 레시피 상세 조회
    RecipeVO selectRecipeDetail(String rcp_Id) throws Exception;
    List<RecipeIngredientVO> selectIngredientDetail(String rcp_Id) throws DataAccessException;
    List<RecipeStepVO> selectStepDetail(String rcp_Id) throws DataAccessException;
    
}