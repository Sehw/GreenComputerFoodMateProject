package com.spring.FoodMate.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.spring.FoodMate.common.SessionDTO;
import com.spring.FoodMate.common.UtilMethod;

public class MypageInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
    	// 여기서 로그인 권한 확인하던거 없애고,
    	// BuyerInterceptor 에서 /mypage/* 담당
    	// SellerInterceptor 에서 /mypage_seller/* 담당

        return true; // 정상적인 경우 컨트롤러 실행
    }
    

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, org.springframework.web.servlet.ModelAndView modelAndView) throws Exception {
        if (modelAndView != null) {
        	HttpSession session = request.getSession(); // 여기까지 왔으면 당연히 sessionDTO에 로그인정보가 담겨있을것임 그래서 오류처리는 딱히 안함
        	SessionDTO userInfo = (SessionDTO)session.getAttribute("sessionDTO");
        	String userRole = userInfo.getUserRole();
        	if(userRole.equals("buyer")) {        		
        		modelAndView.addObject("sidebar","/WEB-INF/views/mypage/side.jsp");
        		modelAndView.addObject("title", "FoodMate - 마이페이지");
        	} else if(userRole.equals("seller")) {        	
        		modelAndView.addObject("sidebar","/WEB-INF/views/mypage_seller/side_selr.jsp");
        	}
            modelAndView.setViewName("common/layout");
            modelAndView.addObject("showNavbar", true);
            modelAndView.addObject("showSidebar",true);            
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