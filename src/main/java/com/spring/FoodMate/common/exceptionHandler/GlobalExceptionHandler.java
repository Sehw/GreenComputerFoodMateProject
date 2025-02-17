package com.spring.FoodMate.common.exceptionHandler;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.spring.FoodMate.common.exception.JjamException;
import com.spring.FoodMate.common.exception.UnauthorizedException;
import com.spring.FoodMate.common.exception.UnhandledException;
import com.spring.FoodMate.product.exception.ProductException;

@ControllerAdvice
public class GlobalExceptionHandler {
    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    private boolean isAjaxRequest(HttpServletRequest request) {
        String ajaxHeader = request.getHeader("X-Requested-With");
        return "XMLHttpRequest".equals(ajaxHeader);
    }

    private ModelAndView getErrorModelAndView(String errorMessage) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("common/layout");
        mav.addObject("showNavbar", true);
        mav.addObject("title", "오류 페이지");
        mav.addObject("body", "/WEB-INF/views/error/errorPage.jsp");
        mav.addObject("errorMessage", errorMessage);
        return mav;
    }

 // 로그인 관련 예외 처리
    @ExceptionHandler(UnauthorizedException.class)
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    @ResponseBody
    public Object handleUnauthorizedException(HttpServletRequest request, HttpServletResponse response, UnauthorizedException ex) {
        boolean ajax = isAjaxRequest(request);
        logger.error("권한오류, 이 요청은 Ajax 요청이 " + ajax + "입니다. " + ex.getMessage(), ex);
        HttpSession session = request.getSession();

        String alertMsg = "로그인이 필요한 서비스입니다.";
        
        switch (ex.getErrorCode()) {
            case 101:
                alertMsg = "로그인이 필요한 서비스입니다.";
                break;
            case 102:
                alertMsg = "구매자 " + alertMsg;
                break;
            case 103:
                alertMsg = "판매자 " + alertMsg;
                break;
            case 104:
                alertMsg = "관리자 " + alertMsg;
                break;
            case 105:
                session.invalidate();
                alertMsg = "비정상적인 로그인이 감지되었습니다. 다시 로그인해 주세요.";
                break;
        }

        if (ajax) {
            // Ajax 요청이면 JSON 응답 반환하되 에러난건 아니라고 알려줘야함
        	response.setStatus(HttpServletResponse.SC_OK); // 이렇게 에러는 아니라고 해야
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("success", false);
            errorResponse.put("alertMsg", alertMsg + " 로그인 화면으로 이동하시겠습니까?");
            return errorResponse;
        } else {
            try {
                session.setAttribute("alertMsg", alertMsg);
                response.sendRedirect(request.getContextPath() + "/member/loginForm");
            } catch (IOException ioEx) {
                logger.error("IOException 발생: " + ioEx.getMessage(), ioEx);
            }
            return false;
        }
    }

    // 장바구니 예외 처리
    @ExceptionHandler(CartException.class)
    @ResponseBody
    public Object handleCartException(HttpServletRequest request, CartException ex) {
        logger.error("CartException 발생: " + ex.getMessage(), ex);
        return handleException(request, ex.getMessage());
    }
    
    // 상품 예외 처리
    @ExceptionHandler(ProductException.class)
    @ResponseBody
    public Object handleProductException(HttpServletRequest request, ProductException ex) {
        logger.error("ProductException 발생: " + ex.getMessage(), ex);
        return handleException(request, ex.getMessage());
    }

    // DB 예외 처리
    @ExceptionHandler(DBException.class)
    @ResponseBody
    public Object handleDBException(HttpServletRequest request, DBException ex) {
        logger.error("DBException 발생: " + ex.getMessage(), ex);
        return handleException(request, ex.getMessage());
    }
    
    // 나중에 처리할 예외는 따로 처리
    @ExceptionHandler(JjamException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Object handleLaterHandledException(HttpServletRequest request, JjamException ex) {
        logger.error("귀찮아서 짬때린 예외 발생: " + ex.getMessage(), ex);
        return handleException(request, "귀찮아서 짬때린 예외입니다");
    }

    // 모든 예외를 처리하는 공통 예외 처리기
    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Object handleGenericException(HttpServletRequest request, Exception ex) {
        logger.error("예상하지 못한 예외 발생: " + ex.getMessage(), ex);
        return handleException(request, "서버 내부 오류가 발생했습니다.");
    }
    
 // 예상하지 못한 예외
    @ExceptionHandler(UnhandledException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Object handleUnhandledException(HttpServletRequest request, UnhandledException ex) {
        logger.error("예상치 못한 예외 발생: " + ex.getMessage(), ex);
        return handleException(request, "예상치 못한 예외입니다.");
    }

    // 예외에 대한 공통 처리 로직
    private Object handleException(HttpServletRequest request, String errorMessage) {
        if (isAjaxRequest(request)) {
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", errorMessage);
            return response;
        } else {
            return getErrorModelAndView(errorMessage);
        }
    }
}