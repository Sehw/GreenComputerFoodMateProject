package com.spring.FoodMate.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class MyInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
    	// 클라이언트의 요청이 컨트롤러로 전달되기 전에 실행됨
        // true를 반환하면 요청이 정상적으로 진행되고, false를 반환하면 요청이 중단됨
    	
		/*
		 * HttpSession session = request.getSession(); Object user =
		 * session.getAttribute("loginUser");
		 * 
		 * // 요청이 AJAX인지 확인 boolean isAjax =
		 * "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
		 * 
		 * if (user == null) { // 로그인 안 된 경우 if (isAjax) { // JSON 형식으로 응답
		 * response.setContentType("application/json");
		 * response.setCharacterEncoding("UTF-8");
		 * response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
		 * response.getWriter().write("{\"error\":\"로그인이 필요합니다.\"}"); } else { // 로그인
		 * 페이지로 리다이렉트 response.sendRedirect("/login"); } return false; }
		 */
    	System.out.println("실험용 마이인터셉터 실행중");
        return true;
        // true일 경우 계속 진행(컨트롤러로 ㄱㄱ)
        // false일 경우 요청을 중단, 여기서 어디로 보낼지 정해야함. ajax요청이면 메시지 주고, 일반 요청이면 어딘가로 리다이렉트하면될듯
    }
    

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, org.springframework.web.servlet.ModelAndView modelAndView) throws Exception {
        // 컨트롤러에서 처리가 끝난 후, 뷰를 렌더링하기 전에 실행됨
        // 이 시점에서는 모델과 뷰 정보에 접근할 수 있음
    	// 이때 mav.addObject(shownavbar, true) 이런거 해줄수있음. 여기서 하면 controller 메서드마다 길이 줄어들고좋을듯?
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