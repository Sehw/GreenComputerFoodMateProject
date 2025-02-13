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

@WebFilter(urlPatterns = {"/product/pdteditform", "/product/pdtaddform"})
public class ProductFilter implements Filter {
    
    @Override
    public void doFilter(javax.servlet.ServletRequest request, javax.servlet.ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
        
        SessionDTO sessionInfo = (SessionDTO) session.getAttribute("sessionDTO");

        // Ajax 요청인지 확인하는 그건데, 지금은 판매자로 Ajax요청 보내는게 딱히 없으니
        // 만약 필요하게 되면 카트필터 확인 ㄱㄱ
//        String ajaxRequest = httpRequest.getHeader("X-Requested-With");
        
        // 세션에 세션DTO자체가 없으면
        if (sessionInfo == null) {
			session.setAttribute("alertMsg", "로그인이 필요한 서비스입니다.");
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/member/loginForm");
			return;
        }
        
        // 세션에 세션DTO가 있더라도 판매자 자격이 없으면
        if (!sessionInfo.getUserRole().equals("seller")) {
        	session.setAttribute("alertMsg", "판매자 로그인이 필요한 서비스입니다.");
        	httpResponse.sendRedirect(httpRequest.getContextPath() + "/member/loginForm");
        }

        // 세션에 세션DTO가 있고 판매자 자격도 있는데 판매자 ID가 없으면
        if (sessionInfo.getUserId() == null) {
        	session.invalidate();
        	session.setAttribute("alertMsg", "로그인 정보가 유효하지 않습니다. 다시 로그인해 주세요.");
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/member/loginForm");
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