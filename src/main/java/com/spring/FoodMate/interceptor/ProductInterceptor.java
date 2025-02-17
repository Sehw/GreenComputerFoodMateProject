package com.spring.FoodMate.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.common.SessionDTO;
import com.spring.FoodMate.common.UtilMethod;
import com.spring.FoodMate.common.exception.UnauthorizedException;

public class ProductInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        SessionDTO sessionInfo = (SessionDTO) session.getAttribute("sessionDTO");

        // 로그인 안 되어 있을 때
        if (sessionInfo == null) {
        	throw new UnauthorizedException(101);
        }

        // 판매자 권한이 아닐 때
        if (!"seller".equals(sessionInfo.getUserRole())) {
        	throw new UnauthorizedException(103);
        }

        // 판매자 ID가 없을 때
        if (sessionInfo.getUserId() == null) {
        	throw new UnauthorizedException(105);
        }

        return true; // 정상적인 경우 컨트롤러 실행
    }
    
 // 컨트롤러가 호출된 후, 뷰가 렌더링되기 전에 호출
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) throws Exception {
	    if (mav != null) {
	    	mav.setViewName("common/layout");
		    mav.addObject("showNavbar", true);
		    mav.addObject("body", "/WEB-INF/views" + UtilMethod.getViewName(request) + ".jsp");
        }	    
    }

    // 요청 처리 후, 뷰가 렌더링된 후에 호출
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // 예: 리소스 정리, 로그 기록
        System.out.println("afterCompletion: 요청 처리 후, 뷰 렌더링 후에 실행됩니다.");
    }
    
}
