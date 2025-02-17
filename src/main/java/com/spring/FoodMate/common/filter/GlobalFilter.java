package com.spring.FoodMate.common.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter("/*")  // 모든 URL 패턴에 대해 필터 적용
public class GlobalFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 필터 초기화 작업
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
    	System.out.print("UTF-8 설정");
        request.setCharacterEncoding("UTF-8");  // 요청 인코딩 설정
        response.setCharacterEncoding("UTF-8");  // 응답 인코딩 설정
        chain.doFilter(request, response);  // 필터 체인 계속 진행
        
        // 지금은 utf-8 설정만 하고있으나 다른 기능 필요하면 필터 이름 바꾸고 추가할것
    }

    @Override
    public void destroy() {
        // 필터 종료 작업
    }
}