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

import com.spring.FoodMate.member.dto.BuyerDTO;

@WebFilter("/cart/*")
public class CartFilter implements Filter {
    
    @Override
    public void doFilter(javax.servlet.ServletRequest request, javax.servlet.ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
        
        Boolean isBuyerLogOn = (Boolean) session.getAttribute("isBuyerLogOn");

        // Ajax 요청인지 확인
        String ajaxRequest = httpRequest.getHeader("X-Requested-With");

        if (isBuyerLogOn == null || !isBuyerLogOn) {
        	// 구매자 로그인이 안 되어 있는 상태면
            if ("XMLHttpRequest".equals(ajaxRequest)) {
            	// Ajax 요청일 경우, 응답의 인코딩을 UTF-8로 설정하고 JSON 형식으로 응답
                httpResponse.setContentType("application/json; charset=UTF-8");
                response.setContentType("application/json");
                response.getWriter().write("{\"success\": false, \"alertMsg\": \"구매자 로그인이 필요한 서비스입니다.\"}");
            } else {
                // 일반적인 요청은 리디렉션
                session.setAttribute("alertMsg", "구매자 로그인이 필요한 서비스입니다.");
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/member/loginForm");
            }
            return;
        } else {
        
	        BuyerDTO buyerInfo = (BuyerDTO) session.getAttribute("buyerInfo");
	        //이즈바이어로그온을 뚫었더라도 바이어인포가 없으면
	        if (buyerInfo == null) {
	        	session.setAttribute("alertMsg", "로그인 정보가 유효하지 않습니다. 다시 로그인해 주세요.");
	            httpResponse.sendRedirect(httpRequest.getContextPath() + "/member/loginForm");
		        return;
	        }
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