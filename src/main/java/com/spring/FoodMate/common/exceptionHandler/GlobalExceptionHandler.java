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
import org.springframework.web.servlet.NoHandlerFoundException;

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
                alertMsg = "로그인이 필요한 서비스입니다."; break;
            case 102:
                alertMsg = "구매자 " + alertMsg; break;                
            case 103:
                alertMsg = "판매자 " + alertMsg; break;
            case 104:
                alertMsg = "관리자 " + alertMsg; break;
            case 105:
                session.invalidate();
                alertMsg = "비정상적인 로그인이 감지되었습니다. 다시 로그인해 주세요."; break;
        }

        if (ajax) {
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

    // 상품 예외 처리
    @ExceptionHandler(ProductException.class)
    @ResponseBody
    public Object handleProductException(HttpServletRequest request, HttpServletResponse response, ProductException ex) {
        boolean ajax = isAjaxRequest(request);
        logger.error("상품 관련 오류, 이 요청은 Ajax 요청이 " + ajax + "입니다. " + ex.getMessage(), ex);
        String alertMsg = "상품 오류입니다.";
        
        switch (ex.getErrorCode()) {
            case 201:
                alertMsg = "존재하지 않는 상품입니다."; break;
            case 202:
                alertMsg = "상품 추가 중 오류가 발생하였습니다."; break;
            case 203:
                alertMsg = "상품 정보 수정 권한이 없습니다."; break;
            case 204:
                alertMsg = "미할당된 오류 메시지 204."; break;
            case 205:
                alertMsg = "미할당된 오류 메시지 205."; break;
            case 206:
                alertMsg = "미할당된 오류 메시지 206."; break;
            case 207:
                alertMsg = "미할당된 오류 메시지 207."; break;
            case 208:
                alertMsg = "미할당된 오류 메시지 208."; break;
            case 209:
                alertMsg = "미할당된 오류 메시지 209."; break;
        }

        if (ajax) { // Ajax 요청이면 404, success : false, alertMsg를 반환함.
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            Map<String, Object> errorResponse = new HashMap<>();
            errorResponse.put("alertMsg", alertMsg);
            return errorResponse;
        } else { // Ajax 요청이 아니면 오류 페이지로 보내버림.
            try {
            	return handleException(request, alertMsg);
            } catch (Exception _ex) {
                logger.error("예외 처리기에서 또 예외 발생: " + _ex.getMessage(), _ex);
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
    
    // DB 예외 처리
    @ExceptionHandler(DBException.class)
    @ResponseBody
    public Object handleDBException(HttpServletRequest request, DBException ex) {
        logger.error("DBException 발생: " + ex.getMessage(), ex);
        return handleException(request, ex.getMessage());
    }
    
    // 되도않는주소로 요청할때 처리
    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseBody
    public Object handleNoHandlerFoundException(HttpServletRequest request, NoHandlerFoundException ex) {
        // 404 오류 처리
        logger.error("존재하지 않는 페이지 요청: " + ex.getMessage(), ex);
        return handleException(request, "그런페이지 준비 안해놨음 수구");
    }
    
    // 예상하지 못한 예외
    @ExceptionHandler(UnhandledException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Object handleUnhandledException(HttpServletRequest request, UnhandledException ex) {
        logger.error("예상치 못한 예외 발생: " + ex.getMessage(), ex);
        return handleException(request, "예상치 못한 예외입니다.");
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
        logger.error("종류도 안정하고 받는 예외 발생: " + ex.getMessage(), ex);
        return handleException(request, "뭔지도 모르겠는 오류가 발생하였습니다.");
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