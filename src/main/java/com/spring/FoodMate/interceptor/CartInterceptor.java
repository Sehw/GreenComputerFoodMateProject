package com.spring.FoodMate.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.common.SessionDTO;
import com.spring.FoodMate.common.UtilMethod;
import com.spring.FoodMate.common.exception.UnauthorizedException;

public class CartInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        SessionDTO sessionInfo = (SessionDTO) session.getAttribute("sessionDTO");
        
        // 로그인 안 되어 있을 때
        if (sessionInfo == null) {
            throw new UnauthorizedException(101);
        }

        // 구매자 권한이 아닐 때
        if (!"buyer".equals(sessionInfo.getUserRole())) {
            throw new UnauthorizedException(102);
        }

        // 구매자 ID가 없을 때
        if (sessionInfo.getUserId() == null) {
            throw new UnauthorizedException(105);
        }

        return true; // 정상적인 경우 컨트롤러 실행
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        if (modelAndView != null) {
            modelAndView.setViewName("common/layout");
            modelAndView.addObject("showNavbar", true);
            modelAndView.addObject("title", "장바구니");
            modelAndView.addObject("body", "/WEB-INF/views" + UtilMethod.getViewName(request) + ".jsp");
        }
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    	// 요청 처리 후, 뷰 렌더링이 끝난 후 실행됨
        // 주로 로깅이나 자원 해제를 처리하는 데 사용// 세션에서 임시로 저장한 속성을 제거하는 예
        // HttpSession session = request.getSession();
        // session.removeAttribute("msg");
    	// seesion.invalidate? 머 이런식으로 화면 표시된후에 jsp에서 그 데이터써먹게한다음 세션 날려줄 수 있음
    }
    
}