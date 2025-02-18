package com.spring.FoodMate.recipe.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.spring.FoodMate.common.UtilMethod;
import com.spring.FoodMate.member.dto.BuyerDTO;
import com.spring.FoodMate.recipe.dto.RecipeDTO;
import com.spring.FoodMate.recipe.dto.RecipeIngredientDTO;
import com.spring.FoodMate.recipe.dto.RecipeStepDTO;
import com.spring.FoodMate.recipe.service.RecipeService;

@Controller
public class RecipeControllerImpl implements RecipeController {

    @Autowired
    private RecipeService recipeService;
    
    /*
    @RequestMapping("/recipe/selectRecipeByCategory")
    public ModelAndView selectRecipeByCategory(@RequestParam("categoryId") int categoryId, HttpServletRequest request) throws Exception {
        String viewName = (String) request.getAttribute("viewName");
        HttpSession session = request.getSession();

        // 카테고리 아이디에 맞는 레시피를 조회
        List<RecipeVO> recipeList = categoryService.getRecipesByCategory(categoryId);

        // 최근 본 레시피 리스트 갱신
        RecentRecipeView(categoryId, recipeList, session);

        // 업데이트된 recentRecipeList를 jsp에 전달
        List<RecipeVO> recentRecipeList = (List<RecipeVO>) session.getAttribute("recentRecipeList");
        ModelAndView mav = new ModelAndView(viewName);
        mav.setViewName("common/layout");
        mav.addObject("recipeList", recipeList);
        mav.addObject("recentRecipeList", recentRecipeList);
        mav.addObject("showNavbar", true);
        mav.addObject("title", "카테고리별 레시피");
        mav.addObject("body", "/WEB-INF/views/recipe/recipeList.jsp"); 
        return mav;
    }*/


    // 레시피 수정 폼
    @RequestMapping(value = "/recipe/recipe_Edit", method = RequestMethod.GET)
    public ModelAndView RecipeEditForm(HttpServletRequest request) throws Exception {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("common/layout");
        mav.addObject("showNavbar", true);
        mav.addObject("title","레시피 수정 페이지");
        mav.addObject("body", "/WEB-INF/views/recipe/recipe_Edit.jsp");
        return mav;
    }
    
    
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
    public ModelAndView selectRecipeDetail(@RequestParam("rcp_id") int rcp_id, HttpServletRequest request) throws Exception {
         
        HttpSession session = request.getSession();
        Map<String, Object> recipeMap = recipeService.selectRecipeDetail(rcp_id);
        
//        // 최근 본 레시피 리스트 갱신
//        // 지금 세션에 레시피DTO를 다 주고있는거같은데, 세션에는 레시피id만 주고 
//        RecipeDTO recipeDTO = (RecipeDTO) recipeMap.get("recipeDTO");
//        RecentRecipeView(rcp_id, recipeDTO, session);
//
//        // 지금 레시피 상세조회 페이지에 그냥 최근 본 레시피 파트까지 넣은거같은데, 
//        // "최근 본 레시피" 를 jsp include 하고 거기서 알아서 처리하게 하면 어떨까요?
//        // 지금 이대로면 모든 메서드마다 리센트레시피리스트관련처리를 해야하는데.
        
        ModelAndView mav = new ModelAndView();
        
        // 업데이트된 recentRecipeList를 jsp에 전달
//        mav.addObject("recentRecipeList", (List<RecipeDTO>) session.getAttribute("recentRecipeList"));
        
        // 레시피맵에서 필요한거 뿌림
        mav.addObject("recipe", recipeMap.get("recipe"));
        mav.addObject("ingredients", recipeMap.get("ingredients"));
        mav.addObject("steps", recipeMap.get("steps"));
        
        mav.setViewName("common/layout");
        mav.addObject("showNavbar", true);
        mav.addObject("title", "레시피 상세");
        mav.addObject("body", "/WEB-INF/views/" + UtilMethod.getViewName(request) + ".jsp"); 
        return mav;
    }

//    private void RecentRecipeView(int rcp_Id, RecipeDTO recipeVO, HttpSession session) {
//        // 세션에서 '최근 본 레시피' 리스트를 가져옴
//        List<RecipeDTO> recentRecipeList = (List<RecipeDTO>) session.getAttribute("recentRecipeList");
//
//        // 최근 본 레시피가 세션에 존재할 경우
//        if (recentRecipeList != null) {
//            boolean alreadyExisted = false;
//
//            // 이미 해당 레시피가 최근 본 리스트에 있는지 확인
//            for (int i = 0; i < recentRecipeList.size(); i++) {
//                RecipeDTO _recipe = recentRecipeList.get(i);
//                if (rcp_Id == _recipe.getRcp_id()) {
//                    alreadyExisted = true;
//                    // 이미 리스트에 있으면 해당 레시피를 가장 앞에 오도록 이동
//                    recentRecipeList.remove(i);  // 기존 항목 삭제
//                    recentRecipeList.add(0, _recipe);  // 최근 항목으로 추가
//                    break;
//                }
//            }
//
//            // 최근 본 레시피 리스트에 없다면
//            if (!alreadyExisted) {
//                // 리스트가 20개 이상일 경우, 가장 오래된 레시피를 제거
//                if (recentRecipeList.size() >= 20) {
//                    recentRecipeList.remove(recentRecipeList.size() - 1);  // 가장 오래된 레시피 제거
//                }
//                // 새로운 레시피를 리스트 앞에 추가
//                recentRecipeList.add(0, recipeVO);
//            }
//        } else {
//            // '최근 본 레시피' 리스트가 세션에 없으면 새로 생성
//            recentRecipeList = new ArrayList<RecipeDTO>();
//            recentRecipeList.add(recipeVO);
//        }
//        
//        // 세션에 최근 본 레시피 리스트 저장
//        session.setAttribute("recentRecipeList", recentRecipeList);
//        session.setAttribute("recentRecipeListNum", recentRecipeList.size());
//    }

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
	public ModelAndView addRecipeForm(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/layout");
		mav.addObject("showNavbar", true);
		mav.addObject("title", "FoodMate - 레시피 작성");
		mav.addObject("body", "/WEB-INF/views" +  UtilMethod.getViewName(request) + ".jsp");
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

	    String byr_Id = BuyerDTO != null ? BuyerDTO.getByr_id() : "unknownUser"; //삼항연산자  조건 ? 조건이 참일때 실행 : 조건이 거짓일때 실행
    	                //세션이데이터가잇니? , //있으면 DTO에서 가져와 , / 없으면 "unknownUser" 데이터를 담아
	    
	    // 세션에 로그인데이터가 없으면 로그인에러처리를 해야지 왜 unknownUser를 담아주나요? 
	     
	    // 레시피 객체 생성
	    RecipeDTO recipe = new RecipeDTO();
	    recipe.setTitle(title);
	    recipe.setFood_name(foodName);
	    recipe.setReq_time(reqTime);
	    recipe.setDescription(description);
	    recipe.setByr_id(byr_Id);  // 작성자 ID 추가
	    
	    // 레시피 이미지 저장 (메인 이미지)
	    if (mainImg != null && !mainImg.isEmpty()) {
	        String mainImgPath = UtilMethod.saveRecipeImage(mainImg);
	        recipe.setMainimg_path(mainImgPath);  // 이미지 경로 저장
	    }

	    // 레시피 등록 (ID 반환)
	    int recipeId = recipeService.addRecipe(recipe, byr_Id);  // 레시피 ID를 반환받음

	    // 재료 객체 생성 후 배치 삽입
	    List<RecipeIngredientDTO> ingredients = new ArrayList<>();
	    List<String> uniqueIngredients = new ArrayList<>(); // 중복 체크를 위한 리스트

	    for (int i = 0; i < ingredientsNames.size(); i++) {
	        // 중복된 재료가 이미 리스트에 있으면 추가하지 않도록 함
	        if (!uniqueIngredients.contains(ingredientsNames.get(i))) {
	            RecipeIngredientDTO ingredient = new RecipeIngredientDTO();
	            ingredient.setRcp_id(recipeId);  // 생성된 레시피 ID
	            ingredient.setIngrd_name(ingredientsNames.get(i));
	            ingredient.setIngrd_qty(ingredientsQty.get(i));
	            ingredient.setUnit(ingredientsUnits.get(i));
	            ingredients.add(ingredient);
	            uniqueIngredients.add(ingredientsNames.get(i)); // 중복 재료 체크
	        }
	    }
	    System.out.println("재료 리스트: " + ingredients);
	    recipeService.insertRecipeIngredients(ingredients);  // 재료 추가

	    // 단계 객체 생성 후 배치 삽입
	    List<RecipeStepDTO> steps = new ArrayList<>();
	    List<Integer> uniqueStepNumbers = new ArrayList<>();  // 중복 체크를 위한 단계 번호 리스트

	    for (int i = 0; i < stepNumbers.size(); i++) {
	        // 중복된 단계가 이미 리스트에 있으면 추가하지 않도록 함
	        if (!uniqueStepNumbers.contains(stepNumbers.get(i))) {
	            RecipeStepDTO step = new RecipeStepDTO();
	            step.setRcp_id(recipeId);  // 생성된 레시피 ID
	            step.setRcp_step(stepNumbers.get(i));
	            step.setStep_desc(stepDescriptions.get(i));
	            if (!stepImages.isEmpty() && stepImages.size() > i && stepImages.get(i) != null) {
	                String stepImgPath = UtilMethod.saveRecipeImage(stepImages.get(i));  // 단계 이미지 저장
	                step.setStepimg_path(stepImgPath);  // 단계 이미지 경로 저장
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