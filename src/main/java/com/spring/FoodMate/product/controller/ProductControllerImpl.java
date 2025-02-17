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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	    @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword, HttpServletRequest request) throws Exception {
	    List<ProductDTO> searchList = productService.pdtList(keyword);
	    
	    ModelAndView mav = new ModelAndView();
        mav.setViewName("common/layout");
        mav.addObject("title", "FoodMate-상품 검색창");
        mav.addObject("showNavbar", true);
        mav.addObject("body", "/WEB-INF/views" + UtilMethod.getViewName(request) + ".jsp");
	    mav.addObject("list", searchList);
	    // Service 에 keyword(검색어)를 주고 해당하는 상품VO들의 List를 받아옴.
	    // 검색어 없을땐 전체 상품리스트 갖고옴.
	    return mav;
	}
	
	@Override
	@RequestMapping(value="/mypage_seller/ms_pdtlist", method=RequestMethod.GET)
	public ModelAndView msPdtList(HttpServletRequest request, HttpSession session) throws Exception {
		    SessionDTO sellerInfo = (SessionDTO)session.getAttribute("sessionDTO");
		    List<ProductDTO> searchList = productService.ms_pdtList(sellerInfo.getUserId());
		    
		    ModelAndView mav = new ModelAndView();
            mav.setViewName("common/layout");
            mav.addObject("title", "FoodMate-상품 검색창");
            mav.addObject("showNavbar", true);
            mav.addObject("body", "/WEB-INF/views" + UtilMethod.getViewName(request) + ".jsp");
		    mav.addObject("list", searchList);
		    // Service 에 판매자 ID를 주고 해당하는 상품VO들의 List를 받아옴.
		    return mav;
	}
	
	@Override
	@RequestMapping(value="/product/pdtdetail", method=RequestMethod.GET)
	public ModelAndView pdtDetail(
			@RequestParam(value = "pdt_id", required = true) int pdt_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {		
		ProductDTO product = productService.select1PdtByPdtId(pdt_id); // pdt_id로 pdt 전체행 받아옴
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/layout");
        mav.addObject("title", "제품 상세정보");
        mav.addObject("showNavbar", true);
        mav.addObject("body", "/WEB-INF/views" + UtilMethod.getViewName(request) + ".jsp");
        
		if(product.getCategory_id() != null) {
			List<CategoryDTO> categoryStep = productService.categoryStep(product.getCategory_id());
			Collections.reverse(categoryStep); // 이걸로 배열 안 뒤집으면 카테고리 순서가 거꾸로 나옴
			mav.addObject("category", categoryStep);
		}
		// pdt의 카테고리id 받아서 최상위 부모카테고리까지 싹 받아옴
		mav.addObject("pdt", product);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/product/pdtaddform", method=RequestMethod.GET)
	public ModelAndView pdtAddForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<CategoryDTO> categories = productService.getGrandCategoryList();
		
		mav.setViewName("common/layout");
		mav.addObject("title", "상품 등록");
        mav.addObject("showNavbar", true);
        mav.addObject("body", "/WEB-INF/views" + UtilMethod.getViewName(request) + ".jsp");
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
	    
	    productService.insertNewProduct(newPdt);
	    
	    PrintWriter out = null;
    	// 상품 추가 성공 시 JavaScript로 알림 및 페이지 이동 처리
        response.setContentType("text/html; charset=UTF-8");
        out = response.getWriter();
        out.println("<script type='text/javascript'>");
        out.println("alert('상품이 추가되었습니다. 상품 관리 페이지로 이동합니다.');");
        out.println("window.location.href='"+request.getContextPath()+"/mypage_seller/ms_pdtlist';");
        out.println("</script>");
	}
	
	@Override
	@RequestMapping(value="/product/pdteditform", method=RequestMethod.GET)
	public ModelAndView pdtEditForm(@RequestParam(value = "pdt_id", required = false, defaultValue = "0") int pdt_id,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {		
		if(pdt_id<=0) {
			throw new ProductException(201);
		}
		
		ProductDTO needEdit = productService.select1PdtByPdtId(pdt_id);
		// 받은 pdt_id로 상품 테이블 뒤져서 있는지 확인하고 (없으면 Service에서 오류 던질거임)
		SessionDTO sellerInfo = (SessionDTO)session.getAttribute("sessionDTO");
		// 등록한놈이랑 다른놈이 수정하려고하면
		if( !sellerInfo.getUserId().equals( needEdit.getSlr_id() ) ) {
			throw new ProductException(203);
		}
		
		List<CategoryDTO> categories = productService.getGrandCategoryList();
		
		ModelAndView mav = new ModelAndView();
        mav.setViewName("common/layout");
        mav.addObject("title", needEdit.getName()+" 상품정보 수정");
        mav.addObject("showNavbar", true);
        mav.addObject("body", "/WEB-INF/views" + UtilMethod.getViewName(request) + ".jsp");
		mav.addObject("categories", categories); // 카테고리 대분류 띄워주기
		mav.addObject("ProductDTO", needEdit);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/product/pdtedit", method=RequestMethod.POST)
	public void pdtEdit(@ModelAttribute ProductDTO editPdt,
	        HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		int oldPdt_id = editPdt.getPdt_id();
		
		// 만약 사진첨부를 안했으면 다시 이미지 경로 갖고와서 넣어
		if(editPdt.getPdt_img() == null || editPdt.getPdt_img().isEmpty()) {
			System.out.println("이새끼사진첨부안함");
			editPdt.setImg_path(productService.select1PdtByPdtId(oldPdt_id).getImg_path());
		} else {
		// 사진첨부 했으면 사진 넣어, 나중에 옛날사진 삭제하는 기능 넣어
			System.out.println("사진첨부했음");
			String imagePath = UtilMethod.savePdtImage(request, editPdt.getPdt_img()); // 유틸메서드로 일단 경로에 이미지 저장해
			editPdt.setImg_path(imagePath);
		}
		
		// 만약 카테고리id가 널로 들어왔으면 예전꺼 넣어
		if(editPdt.getCategory_id() == null) {
			editPdt.setCategory_id(productService.select1PdtByPdtId(oldPdt_id).getCategory_id());
		}
		
	    productService.updateProduct(editPdt);
	    // 이거 일단 boolean 반환하긴 하는데 어카노. 애초에 true 아니면 여기로 못넘어오는디.
	    
	    PrintWriter out = null;
    	// 상품 추가 성공 시 JavaScript로 알림 및 페이지 이동 처리
        response.setContentType("text/html; charset=UTF-8");
        out = response.getWriter();
        out.println("<script type='text/javascript'>");
        out.println("alert('상품 정보를 수정하였습니다. 상품 관리 페이지로 이동합니다.');");
        out.println("window.location.href='" + request.getContextPath() + "/mypage_seller/ms_pdtlist';");
        out.println("</script>");
	}

	@Override
	@RequestMapping(value="/product/pdtdelete", method=RequestMethod.POST)
	public String pdtDelete(@RequestParam(value = "pdt_id", required = true, defaultValue = "0") int pdt_id,
			HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
		// 리디렉션 하고 flashAttribue
		if(pdt_id<=0) {
			throw new ProductException(201);
		}
		
		ProductDTO needDelete = productService.select1PdtByPdtId(pdt_id);
		// 받은 pdt_id로 상품 테이블 뒤져서 있는지 확인하고
		SessionDTO sellerInfo = (SessionDTO)session.getAttribute("sessionDTO");
		// 등록한놈이랑 다른놈이 삭제하려고하면
		if( !sellerInfo.getUserId().equals( needDelete.getSlr_id() ) ) {
			throw new ProductException(203);
		}
		
		productService.deleteProduct(pdt_id);		
        redirectAttributes.addFlashAttribute("message", "상품이 성공적으로 삭제되었습니다.");
        return "redirect:/mypage_seller/ms_pdtlist";
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