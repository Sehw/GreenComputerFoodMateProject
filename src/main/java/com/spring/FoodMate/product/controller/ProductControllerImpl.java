package com.spring.FoodMate.product.controller;

import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.common.SessionDTO;
import com.spring.FoodMate.common.UtilMethod;
import com.spring.FoodMate.product.dto.CategoryDTO;
import com.spring.FoodMate.product.dto.ProductDTO;
import com.spring.FoodMate.product.exception.ProductException;
import com.spring.FoodMate.product.service.ProductService;

@Controller
public class ProductControllerImpl implements ProductController {
	@Autowired
	private ProductService productService;
	
	// nav 의 "식료품" 눌렀을 때나 식재료 검색했을 때 
	@Override
	@RequestMapping(value="/product/pdtlist", method=RequestMethod.GET)
	public ModelAndView pdtList(
	    @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
	    //keyword=검색어, 없으면 빈문자열로 바꿔줌
	    HttpServletRequest request
	) throws Exception {
	    
	    ModelAndView mav = new ModelAndView();
	    List<ProductDTO> searchList = productService.pdtList(keyword);
	    mav.addObject("title", "FoodMate-상품 검색창");
	    mav.addObject("list", searchList);
	    // Service 에 keyword(검색어)를 주고 해당하는 상품VO들의 List를 받아옴.
	    // 검색어 없을땐 전체 상품리스트 갖고옴.
	    return mav;
	}
	
	@Override
	@RequestMapping(value="/mypage_seller/ms_pdtlist", method=RequestMethod.GET)
	public ModelAndView msPdtList(HttpServletRequest request, HttpSession session) throws Exception {
		    ModelAndView mav = new ModelAndView();
		    SessionDTO sellerInfo = (SessionDTO)session.getAttribute("sessionDTO");
		    List<ProductDTO> searchList = productService.ms_pdtList(sellerInfo.getUserId());
		    mav.addObject("list", searchList);
		    // Service 에 판매자 ID를 주고 해당하는 상품VO들의 List를 받아옴.
		    mav.addObject("title", "FoodMate-상품 검색창");
		    return mav;
		}
	
	@Override
	@RequestMapping(value="/product/pdtdetail", method=RequestMethod.GET)
	public ModelAndView pdtDetail(
			@RequestParam(value = "pdt_id", required = true) int pdt_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		ProductDTO product = productService.select1PdtByPdtId(pdt_id); // pdt_id로 pdt 전체행 받아옴
		List<CategoryDTO> categoryStep = productService.categoryStep(product.getCategory_id());
		// pdt의 카테고리id 받아서 최상위 부모카테고리까지 싹 받아옴
		Collections.reverse(categoryStep); // 이걸로 배열 안 뒤집으면 카테고리 순서가 거꾸로 나옴
		
		mav.addObject("title", "제품 상세정보");
		mav.addObject("pdt", product);
		mav.addObject("category", categoryStep);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/product/pdtaddform", method=RequestMethod.GET)
	public ModelAndView pdtAddForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<CategoryDTO> categories = productService.getGrandCategoryList();
		mav.addObject("title", "상품 등록");
		mav.addObject("categories", categories);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/product/pdtadd", method=RequestMethod.POST)
	public void pdtAdd(@ModelAttribute ProductDTO newPdt,
	        HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
			    SessionDTO sessionDTO = (SessionDTO)session.getAttribute("sessionDTO");
	    String slr_id = sessionDTO.getUserId();
	    String imagePath = UtilMethod.savePdtImage(request, newPdt.getPdt_img()); // 유틸메서드로 일단 경로에 이미지 저장해
	    
	    newPdt.setSlr_id(slr_id);
	    newPdt.setImg_path(imagePath);
	    
	    int result = productService.insertNewProduct(newPdt);
	    
	    PrintWriter out = null;
	    if(result > 0) {
	    	// 상품 추가 성공 시 JavaScript로 알림 및 페이지 이동 처리
            response.setContentType("text/html; charset=UTF-8");
            out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('상품이 추가되었습니다. 상품 관리 페이지로 이동합니다.');");
            out.println("window.location.href='/FoodMate/mypage_seller/ms_pdtlist';");
            out.println("</script>");
	    } else {
	    	throw new ProductException(201);
	    }
	}
	
	@Override
	@RequestMapping(value="/product/pdteditform", method=RequestMethod.GET)
	public ModelAndView pdtEditForm(@RequestParam(value = "pdt_id", required = false, defaultValue = "0") int pdt_id,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		String viewName = UtilMethod.getViewName(request);
		//pdt_id값이 안들어왔을 때 오류처리를 해야함
		System.out.println("이런 pdt값 들어왔다"+pdt_id);
		
		if(pdt_id<=0) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");
		    response.setCharacterEncoding("UTF-8");
		    out.println("<script>");
		    out.println("alert('존재하지 않는 상품입니다.');");
		    out.println("history.back();");
		    out.println("</script>");
		    out.flush();
		    out.close();
		    return null; // 이후 코드 실행을 막음
		}
		
		// 받은 pdt_id로 상품 테이블 뒤져서 있는지 확인하고
		ProductDTO needEdit = productService.select1PdtByPdtId(pdt_id);
		
		// 없으면 오류처리 해야함
		SessionDTO sellerInfo = (SessionDTO)session.getAttribute("sessionDTO");
		
		// 등록한놈이랑 다른놈이 수정하려고하면
		if( !sellerInfo.getUserId().equals( needEdit.getSlr_id() ) ) {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html; charset=UTF-8");
		    response.setCharacterEncoding("UTF-8");
		    out.println("<script>");
		    out.println("alert('수정 권한이 없습니다.');");
		    out.println("history.back();");
		    out.println("</script>");
		    out.flush();
		    out.close();
		    return null; // 이후 코드 실행을 막음
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/layout");
		mav.addObject("showNavbar", true);
		mav.addObject("title", needEdit.getName()+" 상품정보 수정");
		mav.addObject("body", "/WEB-INF/views" + viewName + ".jsp");
		
		List<CategoryDTO> categories = productService.getGrandCategoryList();
		mav.addObject("categories", categories);
		// 카테고리 대분류 띄워주기
		mav.addObject("ProductDTO", needEdit);
		return mav;
	}
	
	

	@RequestMapping(value="/getSubCategories/{category_id}", method=RequestMethod.GET)
	@ResponseBody
	public List<CategoryDTO> getSubCategories(@PathVariable("category_id") int category_id) throws Exception {
	    // 데이터베이스에서 category_id에 해당하는 자식 카테고리 가져오기
	    List<CategoryDTO> subCategories = productService.getChildCategoryList(category_id);
	    return subCategories;
	}

	@RequestMapping(value="/product/compare", method=RequestMethod.GET)
	public ModelAndView compare(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = UtilMethod.getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/layout");
		mav.addObject("showNavbar", true);
		mav.addObject("title", "재료 비교");
		mav.addObject("body", "/WEB-INF/views" + viewName + ".jsp");
		return mav;
	}
}