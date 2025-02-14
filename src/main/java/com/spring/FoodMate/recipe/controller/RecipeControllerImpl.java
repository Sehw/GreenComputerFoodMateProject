package com.spring.FoodMate.recipe.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.common.Util;
import com.spring.FoodMate.member.dto.BuyerDTO;
import com.spring.FoodMate.recipe.service.RecipeService;
import com.spring.FoodMate.recipe.vo.RecipeIngredientVO;
import com.spring.FoodMate.recipe.vo.RecipeStepVO;
import com.spring.FoodMate.recipe.vo.RecipeVO;
import com.spring.FoodMate.common.Util;

@Controller
public class RecipeControllerImpl implements RecipeController {

    @Autowired
    private RecipeService recipeService;

    
    // 레시피 목록 조회
    @RequestMapping(value = "/recipe/recipe_list", method = RequestMethod.GET)
    public ModelAndView selectRecipeList(HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView();
        mav.addObject("recipeList", recipeService.selectRecipeList()); //서비스에 selectRecipeList메소드있어야함
        mav.setViewName("common/layout");
        mav.addObject("showNavbar", true);
        mav.addObject("title","레시피 목록");
        mav.addObject("body", "/WEB-INF/views/recipe/recipe_list.jsp");
        return mav;
    }
    
    //레시피 상세조회
    @RequestMapping(value = "/recipe/recipe_Detail", method = RequestMethod.GET)
    public ModelAndView selectRecipeDetail(@RequestParam("rcp_Id") String rcp_Id, 
    								HttpServletRequest request) throws Exception {
    	String viewName=(String)request.getAttribute("viewName");
    	HttpSession session=request.getSession();
    	Map recipeMap = recipeService.selectRecipeDetail(rcp_Id);
        ModelAndView mav = new ModelAndView(viewName);
        mav.setViewName("common/layout");
        mav.addObject("recipeMap", recipeMap);
        RecipeVO recipeVO=(RecipeVO)recipeMap.get("recipeVO");
        RecentRecipeView(rcp_Id,recipeVO,session);
        
        mav.addObject("recipeVO", recipeMap.get("recipeVO"));
        mav.addObject("ingredientsList", recipeMap.get("ingredientsList"));
        mav.addObject("stepList", recipeMap.get("stepList"));
        mav.addObject("showNavbar", true);
        mav.addObject("title", "레시피 상세");
        mav.addObject("body", "/WEB-INF/views/recipe/recipe_Detail.jsp");
        return mav;
    }
    
    //최근 본 레시피
    private void RecentRecipeView(String rcp_Id, RecipeVO recipeVO, HttpSession session) {
        boolean alreadyExisted = false;
        List<RecipeVO> recentRecipeList = (List<RecipeVO>) session.getAttribute("recentRecipeList");

        // 최근 본 레시피가 이미 세션에 저장되어 있는지 확인
        if (recentRecipeList != null) {
            // 최근 본 레시피 리스트에서 해당 레시피가 있는지 확인
            for (int i = 0; i < recentRecipeList.size(); i++) {
                RecipeVO _recipe = recentRecipeList.get(i);
                if (rcp_Id.equals(_recipe.getRcp_Id())) {
                    alreadyExisted = true;
                    break;
                }
            }

            // 이미 최근 본 리스트에 없으면 추가
            if (!alreadyExisted) {
                if (recentRecipeList.size() < 5) { // 최대 5개까지만 저장하도록 설정
                    recentRecipeList.add(recipeVO);
                } else {
                    recentRecipeList.remove(0); // 가장 오래된 항목을 제거하고 새 레시피 추가
                    recentRecipeList.add(recipeVO);
                }
            }

        } else {
            // 리스트가 없다면 새로 생성하고 추가
            recentRecipeList = new ArrayList<RecipeVO>();
            recentRecipeList.add(recipeVO);
        }

        // 세션에 최근 본 레시피 리스트를 저장
        session.setAttribute("recentRecipeList", recentRecipeList);
        session.setAttribute("recentRecipeListNum", recentRecipeList.size());
    }

    

     
    //검색 기능 수정 필요
    @RequestMapping(value = "/recipe/search_recipe_list", method = RequestMethod.GET)
    public ModelAndView searchList(HttpServletRequest request) throws Exception {
        
        String searchKeyword = request.getParameter("searchKeyword");

        ModelAndView mav = new ModelAndView();
        
       
        mav.addObject("recipeList", recipeService.selectRecipeList()); 
        mav.setViewName("common/layout");
        mav.addObject("showHeadermenu", true);
        mav.addObject("title", "레시피 목록");
        mav.addObject("body", "/WEB-INF/views/recipe/recipe_list.jsp");
        
        return mav;
    }
    // 레시피 작성 폼으로 이동
	@RequestMapping(value="/recipe/recipe_Add", method=RequestMethod.GET)
	public ModelAndView addRecipeForm(@RequestParam(value="result", required=false) String result, @RequestParam(value="action",required=false) String action, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = Util.getViewName(request);
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("common/layout");
		 mav.addObject("showHeadermenu", true);
		mav.addObject("title", "푸드 메이트");
		mav.addObject("body", "/WEB-INF/views" + viewName + ".jsp");
		return mav;
	}
	
	// 레시피 등록 처리
	@Override
	@RequestMapping(value = "/recipe/addNewRecipe", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addNewRecipe(
	    @RequestParam("title") String title,
	    @RequestParam("food_Name") String foodName,
	    @RequestParam("req_Time") String reqTime,
	    @RequestParam("description") String description,
	    @RequestParam(value = "mainImg_Path", required = false) MultipartFile mainImg,
	    @RequestParam(value = "ingrd_Name") List<String> ingredientsNames,
	    @RequestParam(value = "ingrd_Qty") List<Integer> ingredientsQty,
	    @RequestParam(value = "unit") List<String> ingredientsUnits,
	    @RequestParam(value = "rcp_Step") List<Integer> stepNumbers,
	    @RequestParam(value = "step_Desc") List<String> stepDescriptions,
	    @RequestParam(value = "stepImg_Path") List<MultipartFile> stepImages,
	    HttpSession session
	) throws Exception {

	    // 세션에서 로그인한 사용자 정보 가져오기
		BuyerDTO BuyerDTO = (BuyerDTO) session.getAttribute("buyerInfo");
	    String byrId = BuyerDTO != null ? BuyerDTO.getByr_id() : "unknownUser";
	    System.out.println(byrId);
	    System.out.println("이게 바이어 아이디임.");

	    // 레시피 객체 생성
	    RecipeVO recipe = new RecipeVO();
	    recipe.setTitle(title);
	    recipe.setFood_Name(foodName);
	    recipe.setReq_Time(reqTime);
	    recipe.setDescription(description);
	    recipe.setByr_Id(byrId);  // 작성자 ID 추가

	    // 레시피 이미지 저장 (메인 이미지)
	    if (mainImg != null && !mainImg.isEmpty()) {
	        String mainImgPath = Util.saveRecipeImage(mainImg);
	        recipe.setMainImg_Path(mainImgPath);  // 이미지 경로 저장
	    }

	    // 레시피 등록 (ID 반환)
	    int recipeId = recipeService.addRecipe(recipe, byrId);  // 레시피 ID를 반환받음

	    // 재료 객체 생성 후 배치 삽입
	    List<RecipeIngredientVO> ingredients = new ArrayList<>();
	    List<String> uniqueIngredients = new ArrayList<>(); // 중복 체크를 위한 리스트

	    for (int i = 0; i < ingredientsNames.size(); i++) {
	        // 중복된 재료가 이미 리스트에 있으면 추가하지 않도록 함
	        if (!uniqueIngredients.contains(ingredientsNames.get(i))) {
	            RecipeIngredientVO ingredient = new RecipeIngredientVO();
	            ingredient.setRcp_Id(recipeId);  // 생성된 레시피 ID
	            ingredient.setIngrd_Name(ingredientsNames.get(i));
	            ingredient.setIngrd_Qty(ingredientsQty.get(i));
	            ingredient.setUnit(ingredientsUnits.get(i));
	            ingredients.add(ingredient);
	            uniqueIngredients.add(ingredientsNames.get(i)); // 중복 재료 체크
	        }
	    }
	    System.out.println("재료 리스트: " + ingredients);
	    recipeService.insertRecipeIngredients(ingredients);  // 재료 추가

	    // 단계 객체 생성 후 배치 삽입
	    List<RecipeStepVO> steps = new ArrayList<>();
	    List<Integer> uniqueStepNumbers = new ArrayList<>();  // 중복 체크를 위한 단계 번호 리스트

	    for (int i = 0; i < stepNumbers.size(); i++) {
	        // 중복된 단계가 이미 리스트에 있으면 추가하지 않도록 함
	        if (!uniqueStepNumbers.contains(stepNumbers.get(i))) {
	            RecipeStepVO step = new RecipeStepVO();
	            step.setRcp_Id(recipeId);  // 생성된 레시피 ID
	            step.setRcp_Step(stepNumbers.get(i));
	            step.setStep_Desc(stepDescriptions.get(i));
	            if (!stepImages.isEmpty() && stepImages.size() > i && stepImages.get(i) != null) {
	                String stepImgPath = Util.saveRecipeImage(stepImages.get(i));  // 단계 이미지 저장
	                step.setStepImg_Path(stepImgPath);  // 단계 이미지 경로 저장
	            }
	            steps.add(step);
	            uniqueStepNumbers.add(stepNumbers.get(i));  // 중복 단계 체크
	        }
	    }
	    recipeService.insertRecipeSteps(steps);  // 단계 추가
	    System.out.println("조리법 리스트: " + steps);
	    Map<String, Object> response = new HashMap<>();
	    response.put("message", "레시피 등록에 성공했습니다.");
	    response.put("status", "success");
	    return new ResponseEntity<>(response, HttpStatus.OK);
	}

}

