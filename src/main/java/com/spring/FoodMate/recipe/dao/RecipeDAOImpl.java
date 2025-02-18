package com.spring.FoodMate.recipe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.FoodMate.recipe.dto.RecipeDTO;
import com.spring.FoodMate.recipe.dto.RecipeIngredientDTO;
import com.spring.FoodMate.recipe.dto.RecipeStepDTO;

@Repository
public class RecipeDAOImpl implements RecipeDAO {

    @Autowired
    private SqlSession sqlSession;

    // 레시피 등록
    @Override
    public void insertRecipe(RecipeDTO recipe) throws Exception {
        sqlSession.insert("mapper.recipe.insertRecipe", recipe);  // 레시피 삽입
    }

    // 레시피 ID 반환
    @Override
    public int selectLastInsertedRecipeId() throws Exception {
        return sqlSession.selectOne("mapper.recipe.selectLastInsertedRecipeId");  // 마지막 삽입된 레시피 ID 조회
    }

    // 재료 삽입
    @Override
    public void insertRecipeIngredients(RecipeIngredientDTO ingredient) throws Exception {
        sqlSession.insert("mapper.recipe.insertRecipeIngredients", ingredient);  // 재료 삽입
    }

    // 단계 삽입
    @Override
    public void insertRecipeSteps(RecipeStepDTO step) throws Exception {
        sqlSession.insert("mapper.recipe.insertRecipeSteps", step);  // 단계 삽입
    }

    // 레시피 목록 조회
    @Override
    public List<RecipeDTO> selectRecipeList() throws Exception {
        return sqlSession.selectList("mapper.recipe.selectRecipeList");  // 레시피 목록 조회
    }
    
    @Override
    // 레시피 목록 조회 회원ID로
    public List<RecipeDTO> selectRecipeListByrID(String byr_Id) throws Exception {
        return sqlSession.selectList("mapper.recipe.selectRecipeListByrID", byr_Id);  // 레시피 목록 조회
    }
    
    // 레시피 상세 조회
    @Override
    public RecipeDTO selectRecipeDetail(int rcp_Id) throws Exception {   
    	RecipeDTO recipeVO=(RecipeDTO)sqlSession.selectOne("mapper.recipe.selectRecipeDetail",rcp_Id);
    	return recipeVO;
    }
	
	@Override
	public List<RecipeIngredientDTO> selectIngredientDetail(int rcp_id) throws DataAccessException {
		List<RecipeIngredientDTO> ingredientVO = sqlSession.selectList("mapper.recipe.selectIngredientDetail",rcp_id);
		return ingredientVO;
	}
	
	@Override
	public List<RecipeStepDTO> selectStepDetail(int rcp_id) throws DataAccessException {
		List<RecipeStepDTO> stepVO = sqlSession.selectList("mapper.recipe.selectStepDetail",rcp_id);
		return stepVO;
	}
    
    
}

