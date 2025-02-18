package com.spring.FoodMate.recipe.dao;



import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.FoodMate.recipe.dto.RecipeDTO;
import com.spring.FoodMate.recipe.dto.RecipeIngredientDTO;
import com.spring.FoodMate.recipe.dto.RecipeStepDTO;

public interface RecipeDAO {

    // 레시피 등록
    void insertRecipe(RecipeDTO recipe) throws Exception;

    // 레시피 ID 반환 (마지막으로 삽입된 레시피 ID)
    int selectLastInsertedRecipeId() throws Exception;

    // 재료 삽입
    void insertRecipeIngredients(RecipeIngredientDTO ingredient) throws Exception;

    // 단계 삽입
    void insertRecipeSteps(RecipeStepDTO step) throws Exception;

    // 레시피 목록 조회
    List<RecipeDTO> selectRecipeList() throws Exception;
    
    // 레시피 아이디 목록 조회
    List<RecipeDTO> selectRecipeListByrID(String byr_Id) throws Exception;
    
    // 레시피 상세 조회
    RecipeDTO selectRecipeDetail(int rcp_Id) throws Exception;
    List<RecipeIngredientDTO> selectIngredientDetail(int rcp_Id) throws DataAccessException;
    List<RecipeStepDTO> selectStepDetail(int rcp_Id) throws DataAccessException;
    
}