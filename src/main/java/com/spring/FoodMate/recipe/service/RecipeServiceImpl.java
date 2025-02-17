package com.spring.FoodMate.recipe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.FoodMate.recipe.dao.RecipeDAO;
import com.spring.FoodMate.recipe.vo.RecipeIngredientVO;
import com.spring.FoodMate.recipe.vo.RecipeStepVO;
import com.spring.FoodMate.recipe.vo.RecipeVO;

@Service
@Transactional
public class RecipeServiceImpl implements RecipeService {

    @Autowired
    private RecipeDAO recipeDAO;
   

    // 레시피 등록 후 recipeId 반환
    @Override
    public int addRecipe(RecipeVO recipe, String byrId) throws Exception {
        // 레시피 등록
        recipeDAO.insertRecipe(recipe);

        // 레시피 ID 반환
        return recipeDAO.selectLastInsertedRecipeId();
    }

    // 재료 삽입
    @Override
    public void insertRecipeIngredients(List<RecipeIngredientVO> ingredients) throws Exception {
        for (RecipeIngredientVO ingredient : ingredients) {
            recipeDAO.insertRecipeIngredients(ingredient);  // 재료 삽입
        }
    }

    // 단계 삽입
    @Override
    public void insertRecipeSteps(List<RecipeStepVO> steps) throws Exception {
        for (RecipeStepVO step : steps) {
            recipeDAO.insertRecipeSteps(step);  // 단계 삽입
        }
    }

    // 레시피 목록 조회
    @Override
    public List<RecipeVO> selectRecipeList() throws Exception {
        return recipeDAO.selectRecipeList();  // 레시피 목록 조회
    }
    
 
    // 레시피 상세 조회
    @Override
    public Map selectRecipeDetail(String rcp_Id) throws Exception {
    	Map recipeMap = new HashMap();
    	
    	RecipeVO recipeVO = recipeDAO.selectRecipeDetail(rcp_Id);
    	recipeMap.put("recipeVO", recipeVO);
    	
    	List<RecipeIngredientVO> ingredientVO =recipeDAO.selectIngredientDetail(rcp_Id);
    	recipeMap.put("ingredientVO", ingredientVO);
    	
    	List<RecipeStepVO> stepVO =recipeDAO.selectStepDetail(rcp_Id);
    	recipeMap.put("stepVO", stepVO);
    	System.out.println(recipeMap);
    	return recipeMap;
    	
    }
    
}
