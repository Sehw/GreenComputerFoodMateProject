package com.spring.FoodMate.recipe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.FoodMate.recipe.dao.RecipeDAO;
import com.spring.FoodMate.recipe.dto.RecipeDTO;
import com.spring.FoodMate.recipe.dto.RecipeIngredientDTO;
import com.spring.FoodMate.recipe.dto.RecipeStepDTO;

@Service
@Transactional
public class RecipeServiceImpl implements RecipeService {

    @Autowired
    private RecipeDAO recipeDAO;
   

    // 레시피 등록 후 recipeId 반환
    @Override
    public int addRecipe(RecipeDTO recipe, String byrId) throws Exception {
        // 레시피 등록
        recipeDAO.insertRecipe(recipe);

        // 레시피 ID 반환
        return recipeDAO.selectLastInsertedRecipeId();
    }

    // 재료 삽입
    @Override
    public void insertRecipeIngredients(List<RecipeIngredientDTO> ingredients) throws Exception {
        for (RecipeIngredientDTO ingredient : ingredients) {
            recipeDAO.insertRecipeIngredients(ingredient);  // 재료 삽입
        }
    }

    // 단계 삽입
    @Override
    public void insertRecipeSteps(List<RecipeStepDTO> steps) throws Exception {
        for (RecipeStepDTO step : steps) {
            recipeDAO.insertRecipeSteps(step);  // 단계 삽입
        }
    }

    // 레시피 목록 조회
    @Override
    public List<RecipeDTO> selectRecipeList() throws Exception {
        return recipeDAO.selectRecipeList();  // 레시피 목록 조회
    }
    
    @Override
    public List<RecipeDTO> selectRecipeListByrID(String byr_Id) throws Exception {
        return recipeDAO.selectRecipeListByrID(byr_Id);  // 레시피 목록 조회
    }
    
 
    // 레시피 상세 조회
    @Override
    public Map<String, Object> selectRecipeDetail(int rcp_id) throws Exception {
        Map<String, Object> recipeDetail = new HashMap<>();

        RecipeDTO recipe = recipeDAO.selectRecipeDetail(rcp_id);
        recipeDetail.put("recipe", recipe);

        List<RecipeIngredientDTO> ingredientList = recipeDAO.selectIngredientDetail(rcp_id);
        recipeDetail.put("ingredients", ingredientList);

        List<RecipeStepDTO> stepList = recipeDAO.selectStepDetail(rcp_id);
        recipeDetail.put("steps", stepList);

        return recipeDetail;
    }
}
