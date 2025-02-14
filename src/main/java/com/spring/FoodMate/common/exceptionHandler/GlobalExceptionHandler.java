package com.spring.FoodMate.common.exceptionHandler;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.cart.exception.CartException;
import com.spring.FoodMate.common.exception.DBException;
import com.spring.FoodMate.common.exception.UnauthorizedException;
import com.spring.FoodMate.common.exception.UnhandledException;

@ControllerAdvice
public class GlobalExceptionHandler {    
    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    // 예외 발생 시 AJAX 요청인지 체크하는 메서드
    private boolean isAjaxRequest(HttpServletRequest request) {
        String ajaxHeader = request.getHeader("X-Requested-With");
        return "XMLHttpRequest".equals(ajaxHeader);
    }
    
    // 로그인 관련 예외 처리
    @ExceptionHandler(UnauthorizedException.class)
    @ResponseBody
    public Object handleUnauthorizedException(HttpServletRequest request, CartException ex) {
        logger.error("UnauthorizedException 발생: " + ex.getMessage(), ex);
        System.out.println("예외발생중");
        if (isAjaxRequest(request)) {
            // AJAX 요청이면 JSON 응답 반환
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", ex.getMessage());
            return response;
        } else {
            // 일반 요청이면 에러 페이지로 이동
            ModelAndView mav = new ModelAndView();
            mav.setViewName("common/layout");
            mav.addObject("showNavbar", true);
            mav.addObject("title", "오류 페이지");
            mav.addObject("body", "/WEB-INF/views/error/errorPage.jsp");
            mav.addObject("errorMessage", ex.getMessage());
            return mav;
        }
    }

    // 장바구니 예외 처리
    @ExceptionHandler(CartException.class)
    @ResponseBody
    public Object handleCartException(HttpServletRequest request, CartException ex) {
        logger.error("CartException 발생: " + ex.getMessage(), ex);
        
        Map<String, Object> response = new HashMap<>();
        response.put("success", false);
        response.put("message", ex.getMessage());
        return response;
    }

    // DB 예외 처리
    @ExceptionHandler(DBException.class)
    public Object handleDBException(HttpServletRequest request, DBException ex) {
        logger.error("DBException 발생: " + ex.getMessage(), ex);

        if (isAjaxRequest(request)) {
            // AJAX 요청이면 JSON 응답 반환
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", ex.getMessage());
            return response;
        } else {
            // 일반 요청이면 에러 페이지로 이동
            ModelAndView mav = new ModelAndView();
            mav.setViewName("common/layout");
            mav.addObject("showNavbar", true);
            mav.addObject("title", "오류 페이지");
            mav.addObject("body", "/WEB-INF/views/error/errorPage.jsp");
            mav.addObject("errorMessage", ex.getMessage());
            return mav;
        }
    }

    // 예상치 못한 예외 처리
    @ExceptionHandler(UnhandledException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public Object handleGenericException(HttpServletRequest request, Exception ex) {
        logger.error("예상하지 못한 예외 발생: " + ex.getMessage(), ex);

        if (isAjaxRequest(request)) {
            // AJAX 요청이면 JSON 응답
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", "서버 내부 오류가 발생했습니다.");
            return response;
        } else {
            // 일반 요청이면 에러 페이지 반환
            ModelAndView mav = new ModelAndView();
            mav.setViewName("common/layout");
            mav.addObject("showNavbar", true);
            mav.addObject("title", "오류 페이지");
            mav.addObject("body", "/WEB-INF/views/error/errorPage.jsp");
            mav.addObject("errorMessage", "서버 내부 오류가 발생했습니다.");
            return mav;
        }
    }
}
