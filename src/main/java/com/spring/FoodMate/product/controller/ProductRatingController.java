package com.spring.FoodMate.product.controller;

import java.io.PrintWriter;
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

import com.spring.FoodMate.product.dto.ProductRatingDTO;
import com.spring.FoodMate.product.service.ProductService;

@Controller
@RequestMapping("/product/rating")
public class ProductRatingController {

    @Autowired
    private ProductService productService;  // ProductService 사용

    // 상품 후기 리스트 조회 (상품에 대한 모든 후기)
    @RequestMapping(value="/list/{pdt_id}", method=RequestMethod.GET)
    public String getProductRatingList(@PathVariable("pdt_id") int pdt_id, HttpServletRequest request) throws Exception {
        List<ProductRatingDTO> ratingList = productService.getProductRatings(pdt_id);  // ProductService로 호출
        request.setAttribute("ratingList", ratingList);  // 후기 목록을 JSP로 전달
        return "/product/productRatingList";  // 상품 후기 목록을 보여줄 JSP로 이동
    }

    // 상품 후기 작성 폼
    @RequestMapping(value="/add/{pdt_id}", method=RequestMethod.GET)
    public String showAddRatingForm(@PathVariable("pdt_id") int pdt_id, HttpServletRequest request) {
        request.setAttribute("pdt_id", pdt_id);
        return "/product/productRatingForm";  // 상품 후기 작성 폼으로 이동
    }

    // 상품 후기 작성 처리
    @RequestMapping(value="/add", method=RequestMethod.POST)
    public void addProductRating(@ModelAttribute ProductRatingDTO productRating, HttpServletResponse response, HttpSession session) throws Exception {
        String userId = (String) session.getAttribute("userId");
        productRating.setUserId(userId);  // 상품 후기 작성자의 ID를 설정

        productService.insertProductRating(productRating);  // ProductService로 호출하여 상품 후기 등록

        // 후기 등록 후 페이지 리디렉션 (알림 처리)
        PrintWriter out = response.getWriter();
        response.setContentType("text/html; charset=UTF-8");
        out.println("<script type='text/javascript'>");
        out.println("alert('상품 후기가 등록되었습니다.');");
        out.println("window.location.href='/product/rating/list/" + productRating.getPdt_id() + "';");
        out.println("</script>");
    }

    // 상품 후기 수정 폼
    @RequestMapping(value="/edit/{rating_id}", method=RequestMethod.GET)
    public String showEditRatingForm(@PathVariable("rating_id") int rating_id, HttpServletRequest request) throws Exception {
        ProductRatingDTO rating = productService.getProductRatingById(rating_id);  // ProductService로 호출
        request.setAttribute("rating", rating);
        return "/product/productRatingEditForm";  // 상품 후기 수정 폼으로 이동
    }

    // 상품 후기 수정 처리
    @RequestMapping(value="/edit", method=RequestMethod.POST)
    public void editProductRating(@ModelAttribute ProductRatingDTO productRating, HttpServletResponse response) throws Exception {
        productService.updateProductRating(productRating);  // ProductService로 호출하여 상품 후기 수정
        // 수정 후 알림 처리
        PrintWriter out = response.getWriter();
        response.setContentType("text/html; charset=UTF-8");
        out.println("<script type='text/javascript'>");
        out.println("alert('상품 후기가 수정되었습니다.');");
        out.println("window.location.href='/product/rating/list/" + productRating.getPdt_id() + "';");
        out.println("</script>");
    }

    // 상품 후기 삭제
    @RequestMapping(value="/delete/{rating_id}", method=RequestMethod.GET)
    public void deleteProductRating(@PathVariable("rating_id") int rating_id, HttpServletResponse response) throws Exception {
        productService.deleteProductRating(rating_id);  // ProductService로 호출하여 상품 후기 삭제
        // 삭제 후 알림 처리
        PrintWriter out = response.getWriter();
        response.setContentType("text/html; charset=UTF-8");
        out.println("<script type='text/javascript'>");
        out.println("alert('상품 후기가 삭제되었습니다.');");
        out.println("window.location.href='/product/rating/list';");
        out.println("</script>");
    }
}
