package com.spring.FoodMate.support.Controller;

import com.spring.FoodMate.support.Service.InquiryService;
import com.spring.FoodMate.support.DTO.InquiryDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.common.UtilMethod;
import com.spring.FoodMate.member.dto.BuyerDTO;

@Controller
public class InquiryController {

    private static final Logger logger = LoggerFactory.getLogger(InquiryController.class);

    private final InquiryService inquiryService;

    @Autowired
    public InquiryController(InquiryService inquiryService) {
        this.inquiryService = inquiryService;
    }

    // 사용자 문의 내역 조회
    @RequestMapping("/support/inquiryLists")
    public ModelAndView getUserInquiries(HttpServletRequest request) {
        logger.debug("getUserInquiries 호출됨");

        // 세션에서 로그인 정보 가져오기
        HttpSession session = request.getSession(false);
        if (session == null) {
            logger.debug("세션이 존재하지 않음");
            return new ModelAndView("redirect:/member/loginForm"); // 로그인되지 않은 상태라면 로그인 페이지로 리다이렉트
        }
        
        if (session.getAttribute("isBuyerLogOn") == null || !(Boolean) session.getAttribute("isBuyerLogOn")) {
            logger.debug("로그인되지 않은 사용자 접근");
            return new ModelAndView("redirect:/member/loginForm"); // 로그인되지 않으면 로그인 페이지로 리다이렉트
        }

        // 세션에서 buyerInfo 가져오기
        BuyerDTO loggedInUser = (BuyerDTO) session.getAttribute("buyerInfo");
        if (loggedInUser == null) {
            logger.debug("로그인된 사용자 정보가 세션에 없음");
            return new ModelAndView("redirect:/member/loginForm"); // 로그인된 사용자 정보가 세션에 없으면 로그인 페이지로 리다이렉트
        }

        String buyerId = loggedInUser.getByr_id(); // 세션에서 로그인된 사용자의 buyerId를 가져옴
        logger.debug("로그인된 사용자 ID: {}", buyerId);

        // 서비스 호출하여 해당 사용자에 대한 문의 내역 가져오기
        List<InquiryDTO> inquiries = inquiryService.getUserInquiriesWithResponses(buyerId);
        
        if (inquiries == null || inquiries.isEmpty()) {
            logger.debug("문의 내역이 없습니다.");
        } else {
            logger.debug("문의 내역이 {}건 조회됨", inquiries.size());
        }

        // ModelAndView 객체 생성하여 데이터와 뷰 이름을 함께 반환
        ModelAndView mav = new ModelAndView("support/inquiryLists");  // 뷰 이름
        mav.addObject("inquiries", inquiries);  // 데이터 전달
        mav.setViewName("common/layout");
        mav.addObject("showNavbar", true);
		mav.addObject("title", "푸드 메이트");
        mav.addObject("body", "/WEB-INF/views/support/inquiryLists.jsp");

        return mav;
    }


    @RequestMapping(value="/support/*", method=RequestMethod.GET)
	public ModelAndView newsPage(@RequestParam(value="result", required=false) String result, @RequestParam(value="action",required=false) String action, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = UtilMethod.getViewName(request);
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("common/layout");
		mav.addObject("showNavbar", true);
		mav.addObject("title", "푸드 메이트");
		mav.addObject("body", "/WEB-INF/views" + viewName + ".jsp");
		return mav;
	}
}
