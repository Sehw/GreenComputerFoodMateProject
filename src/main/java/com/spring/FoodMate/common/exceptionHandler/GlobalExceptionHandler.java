package com.spring.FoodMate.common.exceptionHandler;

import java.util.HashMap;
import java.util.Map;

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
import com.spring.FoodMate.common.exception.UnhandledException;

@ControllerAdvice
// 이 어노테이션은 클래스에 적용되어 모든 컨트롤러에서 발생하는 예외를 처리할 수 있게 해줍니다.
// 기본적으로 해당 클래스는 전역 예외 처리기로 동작합니다.
public class GlobalExceptionHandler {	
    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    // 장바구니 예외 처리 메서드
    @ExceptionHandler(CartException.class)
    @ResponseBody
    public Map<String, Object> handleDBException(DBException ex) {
        logger.error("DBException 발생: " + ex.getMessage(), ex);
        Map<String, Object> response = new HashMap<>();
        response.put("success", false);
        response.put("message", ex.getMessage());
        return response;
    }
    
    // 다른 예외 처리 메서드
    @ExceptionHandler(UnhandledException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public ModelAndView handleGenericException(Exception ex) {
    	logger.error("예상하지 못한 예외 발생: " + ex.getMessage(), ex);
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("common/layout_Regacy");
		mav.addObject("showNavbar", true);
		mav.addObject("title","오류 페이지");
		mav.addObject("body", "/WEB-INF/views/error/errorPage.jsp");
		mav.addObject("errorMessage", ex);
		return mav;
    }
}
