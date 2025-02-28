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

import com.spring.FoodMate.product.dto.ProductQnaDTO;
import com.spring.FoodMate.product.service.ProductService;

@Controller
@RequestMapping("/product/qna")
public class ProductQnaController {

    @Autowired
    private ProductService productService;  // ProductService 사용

    // 상품 문의 리스트 조회 (상품에 대한 모든 문의)
    @RequestMapping(value="/list/{pdt_id}", method=RequestMethod.GET)
    public String getProductQnaList(@PathVariable("pdt_id") int pdt_id, HttpServletRequest request) throws Exception {
        List<ProductQnaDTO> qnaList = productService.getProductQna(pdt_id);  // ProductService로 호출
        request.setAttribute("qnaList", qnaList);  // 상품 문의 목록을 JSP로 전달
        return "/product/productQnaList";  // 상품 문의 목록을 보여줄 JSP로 이동
    }

    // 상품 문의 작성 폼
    @RequestMapping(value="/add/{pdt_id}", method=RequestMethod.GET)
    public String showAddQnaForm(@PathVariable("pdt_id") int pdt_id, HttpServletRequest request) {
        request.setAttribute("pdt_id", pdt_id);
        return "/product/productQnaForm";  // 상품 문의 작성 폼으로 이동
    }

    // 상품 문의 작성 처리
    @RequestMapping(value="/add", method=RequestMethod.POST)
    public void addProductQna(@ModelAttribute ProductQnaDTO productQna, HttpServletResponse response, HttpSession session) throws Exception {
        String userId = (String) session.getAttribute("userId");
        productQna.setUser_id(userId);  // 상품 문의 작성자의 ID를 설정

        productService.insertProductQna(productQna);  // ProductService로 호출하여 상품 문의 등록

        // 상품 문의 등록 후 페이지 리디렉션 (알림 처리)
        PrintWriter out = response.getWriter();
        response.setContentType("text/html; charset=UTF-8");
        out.println("<script type='text/javascript'>");
        out.println("alert('상품 문의가 등록되었습니다.');");
        out.println("window.location.href='/product/qna/list/" + productQna.getPdt_id() + "';");
        out.println("</script>");
    }

    // 상품 문의 수정 폼
    @RequestMapping(value="/edit/{qna_id}", method=RequestMethod.GET)
    public String showEditQnaForm(@PathVariable("qna_id") int qna_id, HttpServletRequest request) throws Exception {
        ProductQnaDTO qna = productService.getProductQnaById(qna_id);  // ProductService로 호출
        request.setAttribute("qna", qna);
        return "/product/productQnaEditForm";  // 상품 문의 수정 폼으로 이동
    }

    // 상품 문의 수정 처리
    @RequestMapping(value="/edit", method=RequestMethod.POST)
    public void editProductQna(@ModelAttribute ProductQnaDTO productQna, HttpServletResponse response) throws Exception {
        productService.updateProductQna(productQna);  // ProductService로 호출하여 상품 문의 수정
        // 수정 후 알림 처리
        PrintWriter out = response.getWriter();
        response.setContentType("text/html; charset=UTF-8");
        out.println("<script type='text/javascript'>");
        out.println("alert('상품 문의가 수정되었습니다.');");
        out.println("window.location.href='/product/qna/list/" + productQna.getPdt_id() + "';");
        out.println("</script>");
    }

    // 상품 문의 삭제
    @RequestMapping(value="/delete/{qna_id}", method=RequestMethod.GET)
    public void deleteProductQna(@PathVariable("qna_id") int qna_id, HttpServletResponse response) throws Exception {
        productService.deleteProductQna(qna_id);  // ProductService로 호출하여 상품 문의 삭제
        // 삭제 후 알림 처리
        PrintWriter out = response.getWriter();
        response.setContentType("text/html; charset=UTF-8");
        out.println("<script type='text/javascript'>");
        out.println("alert('상품 문의가 삭제되었습니다.');");
        out.println("window.location.href='/product/qna/list';");
        out.println("</script>");
    }
}
