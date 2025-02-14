package com.spring.FoodMate.recipe.dao;



import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.FoodMate.recipe.vo.RecipeIngredientVO;
import com.spring.FoodMate.recipe.vo.RecipeStepVO;
import com.spring.FoodMate.recipe.vo.RecipeVO;

@Repository
public class RecipeDAOImpl implements RecipeDAO {

    @Autowired
    private SqlSession sqlSession;

    // 레시피 등록
    @Override
    public void insertRecipe(RecipeVO recipe) throws Exception {
        sqlSession.insert("mapper.recipe.insertRecipe", recipe);  // 레시피 삽입
    }

    // 레시피 ID 반환
    @Override
    public int selectLastInsertedRecipeId() throws Exception {
        return sqlSession.selectOne("mapper.recipe.selectLastInsertedRecipeId");  // 마지막 삽입된 레시피 ID 조회
    }

    // 재료 삽입
    @Override
    public void insertRecipeIngredients(RecipeIngredientVO ingredient) throws Exception {
        sqlSession.insert("mapper.recipe.insertRecipeIngredients", ingredient);  // 재료 삽입
    }

    // 단계 삽입
    @Override
    public void insertRecipeSteps(RecipeStepVO step) throws Exception {
        sqlSession.insert("mapper.recipe.insertRecipeSteps", step);  // 단계 삽입
    }

    // 레시피 목록 조회
    @Override
    public List<RecipeVO> selectRecipeList() throws Exception {
        return sqlSession.selectList("mapper.recipe.selectRecipeList");  // 레시피 목록 조회
    }
    
    @Override
    // 레시피 목록 조회 회원ID로
    public List<RecipeVO> selectRecipeListByrID(String byr_Id) throws Exception {
        return sqlSession.selectList("mapper.recipe.selectRecipeList", byr_Id);  // 레시피 목록 조회
    }
    
    // 레시피 상세 조회
    @Override
    public RecipeVO selectRecipeDetail(String rcp_Id) throws Exception {   
    	RecipeVO recipeVO=(RecipeVO)sqlSession.selectOne("mapper.recipe.selectRecipeDetail",rcp_Id);
    	return recipeVO;
    }
	
	@Override
	public List<RecipeIngredientVO> selectIngredientDetail(String rcp_Id) throws DataAccessException {
		List<RecipeIngredientVO> ingredientVO =(ArrayList)sqlSession.selectList("mapper.recipe.selectIngredientDetail",rcp_Id);
		return ingredientVO;
	}
	
	@Override
	public List<RecipeStepVO> selectStepDetail(String rcp_Id) throws DataAccessException {
		List<RecipeStepVO> stepVO =(ArrayList)sqlSession.selectList("mapper.recipe.selectStepDetail",rcp_Id);
		return stepVO;
	}
    
    
}

