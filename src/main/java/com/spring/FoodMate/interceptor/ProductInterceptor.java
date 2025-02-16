package com.spring.FoodMate.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FoodMate.common.SessionDTO;

public class ProductInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        SessionDTO sessionInfo = (SessionDTO) session.getAttribute("sessionDTO");

        // 로그인 안 되어 있을 때
        if (sessionInfo == null) {
            session.setAttribute("alertMsg", "판매자 로그인이 필요한 서비스입니다.");
            response.sendRedirect(request.getContextPath() + "/member/loginForm");
            return false;
        }

        // 판매자 권한이 아닐 때
        if (!"seller".equals(sessionInfo.getUserRole())) {
            session.setAttribute("alertMsg", "판매자 로그인이 필요한 서비스입니다.");
            response.sendRedirect(request.getContextPath() + "/member/loginForm");
            return false;
        }

        // 판매자 ID가 없을 때
        if (sessionInfo.getUserId() == null) {
            session.invalidate();
            session.setAttribute("alertMsg", "로그인 정보가 유효하지 않습니다. 다시 로그인해 주세요.");
            response.sendRedirect(request.getContextPath() + "/member/loginForm");
            return false;
        }

        return true; // 정상적인 경우 컨트롤러 실행
    }
    
 // 컨트롤러가 호출된 후, 뷰가 렌더링되기 전에 호출
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        // 예: 모델에 추가 작업을 할 때
        System.out.println("postHandle: 컨트롤러 후, 뷰 렌더링 전에 실행됩니다.");
    }

    // 요청 처리 후, 뷰가 렌더링된 후에 호출
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // 예: 리소스 정리, 로그 기록
        System.out.println("afterCompletion: 요청 처리 후, 뷰 렌더링 후에 실행됩니다.");
    }
    
}
