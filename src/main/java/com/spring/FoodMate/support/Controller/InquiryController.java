package com.spring.FoodMate.support.Controller;

import com.spring.FoodMate.support.Service.InquiryService;
import com.spring.FoodMate.support.DTO.InquiryDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.spring.FoodMate.member.dto.BuyerDTO;
import com.spring.FoodMate.order.service.OrderService;
import com.spring.FoodMate.product.dto.ProductDTO;

import java.util.List;

@Controller
public class InquiryController {

    private final InquiryService inquiryService;
    private final OrderService orderService;

    @Autowired
    public InquiryController(OrderService orderService, InquiryService inquiryService) {
        this.orderService = orderService;
        this.inquiryService = inquiryService;
    }

    // 상품 문의 작성 페이지로 이동
    @RequestMapping("/support/inquiryProduct")
    public ModelAndView productInquiryForm(HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        // 로그인 상태 체크
        if (session == null || session.getAttribute("isBuyerLogOn") == null || !(Boolean) session.getAttribute("isBuyerLogOn")) {
            return new ModelAndView("redirect:/member/loginForm");  // 로그인되지 않으면 로그인 페이지로 리다이렉트
        }

        // 세션에서 구매자 정보 가져오기
        BuyerDTO loggedInUser = (BuyerDTO) session.getAttribute("buyerInfo");
        if (loggedInUser == null) {
            return new ModelAndView("redirect:/member/loginForm");  // 세션에 구매자 정보가 없으면 로그인 페이지로 리다이렉트
        }

        // 주문한 상품 목록 가져오기
        List<ProductDTO> orderedProducts = orderService.getOrderedProducts(loggedInUser.getByr_id());  // 주문한 상품 리스트

     // 디버깅용: 콘솔에 출력
        System.out.println("주문한 상품 개수: " + orderedProducts.size());  // 리스트의 크기 확인
        for (ProductDTO product : orderedProducts) {
            System.out.println("상품 ID: " + product.getPdt_id() + ", 상품 이름: " + product.getName());  // 상품 ID와 이름 출력
        }

        // 구매자 정보와 문의 타입 설정
        ModelAndView mav = new ModelAndView("support/inquiryProduct");  // 상품 문의 작성 폼 JSP 페이지로 이동
        mav.setViewName("common/layout");
        mav.addObject("showNavbar", true);
        mav.addObject("title", "푸드 메이트");
        mav.addObject("body", "/WEB-INF/views/support/inquiryProduct.jsp");
        mav.addObject("buyerId", loggedInUser.getByr_id());
        mav.addObject("inquiryType", 1); // 상품 문의 타입으로 설정 (1)
        mav.addObject("orderedProducts", orderedProducts);  // 주문한 상품 리스트를 JSP로 전달

        return mav;
    }


    // 기타 문의 작성 페이지로 이동
    @RequestMapping("/support/inquiryService")
    public ModelAndView generalInquiryForm(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        
        // 로그인 상태 체크
        if (session == null || session.getAttribute("isBuyerLogOn") == null || !(Boolean) session.getAttribute("isBuyerLogOn")) {
            return new ModelAndView("redirect:/member/loginForm");  // 로그인되지 않으면 로그인 페이지로 리다이렉트
        }

        // 세션에서 구매자 정보 가져오기
        BuyerDTO loggedInUser = (BuyerDTO) session.getAttribute("buyerInfo");
        if (loggedInUser == null) {
            return new ModelAndView("redirect:/member/loginForm");  // 세션에 구매자 정보가 없으면 로그인 페이지로 리다이렉트
        }

        // 구매자 정보와 문의 타입 설정
        ModelAndView mav = new ModelAndView("support/inquiryService");  // 기타 문의 작성 폼 JSP 페이지로 이동
        mav.setViewName("common/layout");
        mav.addObject("showNavbar", true);
        mav.addObject("title", "푸드 메이트");
        mav.addObject("body", "/WEB-INF/views/support/inquiryService.jsp");
        mav.addObject("buyerId", loggedInUser.getByr_id());
        mav.addObject("inquiryType", 2); // 기타 문의 타입으로 설정 (2)

        return mav;
    }

    // 상품 문의 작성 처리
    @RequestMapping(value = "/support/submitProductInquiry", method = RequestMethod.POST)
    public ModelAndView submitProductInquiry(@ModelAttribute InquiryDTO inquiryDTO, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        
        // 로그인 상태 체크
        if (session == null || session.getAttribute("isBuyerLogOn") == null || !(Boolean) session.getAttribute("isBuyerLogOn")) {
            return new ModelAndView("redirect:/member/loginForm");  // 로그인되지 않으면 로그인 페이지로 리다이렉트
        }

        // 세션에서 구매자 정보 가져오기
        BuyerDTO loggedInUser = (BuyerDTO) session.getAttribute("buyerInfo");
        if (loggedInUser == null) {
            return new ModelAndView("redirect:/member/loginForm");  // 세션에 구매자 정보가 없으면 로그인 페이지로 리다이렉트
        }
        
        // 상품 문의 정보에 구매자 ID 설정
        inquiryDTO.setBuyerId(loggedInUser.getByr_id());

        // 상품 문의 저장
        inquiryService.submitProductInquiry(inquiryDTO);

        return new ModelAndView("redirect:/support/inquiryLists");  // 문의 목록 페이지로 리다이렉트
    }

    // 기타 문의 작성 처리
    @RequestMapping(value = "/support/submitGeneralInquiry", method = RequestMethod.POST)
    public ModelAndView submitGeneralInquiry(@ModelAttribute InquiryDTO inquiryDTO, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        
        // 로그인 상태 체크
        if (session == null || session.getAttribute("isBuyerLogOn") == null || !(Boolean) session.getAttribute("isBuyerLogOn")) {
            return new ModelAndView("redirect:/member/loginForm");  // 로그인되지 않으면 로그인 페이지로 리다이렉트
        }

        // 세션에서 구매자 정보 가져오기
        BuyerDTO loggedInUser = (BuyerDTO) session.getAttribute("buyerInfo");
        if (loggedInUser == null) {
            return new ModelAndView("redirect:/member/loginForm");  // 세션에 구매자 정보가 없으면 로그인 페이지로 리다이렉트
        }

        // 기타 문의 정보에 구매자 ID 설정
        inquiryDTO.setBuyerId(loggedInUser.getByr_id());

        // 기타 문의 저장
        inquiryService.submitGeneralInquiry(inquiryDTO);

        return new ModelAndView("redirect:/support/inquiryLists");  // 문의 목록 페이지로 리다이렉트
    }

    // 사용자 문의 내역 조회
    @RequestMapping("/support/inquiryLists")
    public ModelAndView getUserInquiries(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        
        // 로그인 상태 체크
        if (session == null || session.getAttribute("isBuyerLogOn") == null || !(Boolean) session.getAttribute("isBuyerLogOn")) {
            return new ModelAndView("redirect:/member/loginForm");  // 로그인되지 않으면 로그인 페이지로 리다이렉트
        }

        // 세션에서 구매자 정보 가져오기
        BuyerDTO loggedInUser = (BuyerDTO) session.getAttribute("buyerInfo");
        if (loggedInUser == null) {
            return new ModelAndView("redirect:/member/loginForm");  // 세션에 구매자 정보가 없으면 로그인 페이지로 리다이렉트
        }

        String buyerId = loggedInUser.getByr_id();  // 세션에서 구매자 ID 가져오기

        // 서비스 호출하여 해당 사용자에 대한 문의 내역 가져오기
        List<InquiryDTO> inquiries = inquiryService.getUserInquiriesWithResponses(buyerId);

        // ModelAndView 객체 생성
        ModelAndView mav = new ModelAndView("support/inquiryLists");  // 뷰 이름
        mav.setViewName("common/layout");
        mav.addObject("inquiries", inquiries);  // 데이터 전달
        mav.addObject("showNavbar", true);
        mav.addObject("title", "푸드 메이트");
        mav.addObject("body", "/WEB-INF/views/support/inquiryLists.jsp");

        return mav;
    }
    
 // FAQ 페이지로 이동
    @RequestMapping("/support/faq")
    public ModelAndView faqPage() {
        // ModelAndView 객체 생성
        ModelAndView mav = new ModelAndView("support/faq");  // faq.jsp로 연결
        mav.setViewName("common/layout");
        mav.addObject("showNavbar", true);
        mav.addObject("title", "푸드 메이트 - 자주 묻는 질문");
        mav.addObject("body", "/WEB-INF/views/support/faq.jsp");  // faq.jsp 경로 지정

        return mav;
    }
}
