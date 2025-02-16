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
//			session.setAttribute("alertMsg", "구매자 로그인이 필요한 서비스입니다.");
//			response.sendRedirect(request.getContextPath() + "/member/loginForm");
//			return false;
            throw new UnauthorizedException(101);
        }

        // 구매자 권한이 아닐 때
        if (!"buyer".equals(sessionInfo.getUserRole())) {
			
//			session.setAttribute("alertMsg", "장바구니를 이용하려면 구매자로 로그인해야 합니다.");
//			response.sendRedirect(request.getContextPath() + "/member/loginForm");
//			return false;
			 
            throw new UnauthorizedException(102);
        }

        // 구매자 ID가 없을 때
        if (sessionInfo.getUserId() == null) {
//            session.invalidate();
//            session.setAttribute("alertMsg", "로그인 정보가 유효하지 않습니다. 다시 로그인해 주세요.");
//            response.sendRedirect(request.getContextPath() + "/member/loginForm");
//            return false;
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
    }
    
}
