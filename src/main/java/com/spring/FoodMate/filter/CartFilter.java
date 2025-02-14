package com.spring.FoodMate.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spring.FoodMate.common.SessionDTO;
import com.spring.FoodMate.member.dto.BuyerDTO;

@WebFilter("/cart/*")
public class CartFilter implements Filter {
    
    @Override
    public void doFilter(javax.servlet.ServletRequest request, javax.servlet.ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
        
        String ajaxRequest = httpRequest.getHeader("X-Requested-With");
        // 일단 Ajax 요청인지부터 확인하고
        
        SessionDTO sessionDTO = (SessionDTO) session.getAttribute("sessionDTO");
        // 세션에서 세션DTO를 가져온다

        if (sessionDTO == null) {
        // 로그인 안해서 세션DTO 자체가 없으면
            if ("XMLHttpRequest".equals(ajaxRequest)) {
            // Ajax 요청일 경우 예) 상품 페이지에서 장바구니 추가 요청하는 경우
                httpResponse.setContentType("application/json; charset=UTF-8");
                // 응답의 인코딩을 UTF-8로 설정하고
                response.setContentType("application/json");
                // JSON 형식으로 응답
                response.getWriter().write("{\"success\": false, \"message\": \"구매자 로그인이 필요한 서비스입니다.\"}");
            } else {
                session.setAttribute("alertMsg", "구매자 로그인이 필요한 서비스입니다.");
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/member/loginForm");
                // 일반적인 요청은 세션에 메시지 넣고 리디렉션함
            }
            return;
        } 
        
        String userRole = sessionDTO.getUserRole();
        // 세션DTO에서 유저 자격을 꺼낸다
        
        if (!userRole.equals("buyer")) {
        // 유저가 구매자가 아닌데 장바구니로 이동했을 경우 (판매자, 관리자는 장바구니를 쓸 일이 없음)
        	session.setAttribute("alertMsg", "구매자 로그인이 필요한 서비스입니다.");
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/member/loginForm");
            // 직접 주소표시줄에 http 요청하는 경우밖에 없으니깐 그냥 로그인폼으로 보냄
            return;
        }
        
        // 로그인된 경우 필터 체인 계속 진행
        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 필터 초기화 작업
    }

    @Override
    public void destroy() {
        // 필터 종료 작업
    }
}