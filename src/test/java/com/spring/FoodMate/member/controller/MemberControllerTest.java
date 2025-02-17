package com.spring.FoodMate.member.controller;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.ArgumentMatchers.anyMap;
import static org.mockito.Mockito.when;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

import com.spring.FoodMate.member.service.MemberService;
import com.spring.FoodMate.member.dto.BuyerDTO;

@ExtendWith(MockitoExtension.class)
public class MemberControllerTest {

    @InjectMocks
    private MemberController memberController;

    @Mock
    private MemberService memberService;

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    @Mock
    private HttpSession session;

    @Mock
    private Model model;

    @Mock
    private BuyerDTO memberVO;

    @BeforeEach
    public void setUp() {
        // 테스트 전에 세션 mock 설정
        when(request.getSession()).thenReturn(session);
    }

    @Test
    public void testLogin_Success() throws Exception {
        // given: 유효한 로그인 정보
        Map<String, String> loginMap = new HashMap<>();
        loginMap.put("byr_Id", "qwer12");
        loginMap.put("pw", "1234");

        // memberService의 login 메서드가 정상적인 MemberVO를 반환하도록 설정
        when(memberService.login(anyMap())).thenReturn(memberVO);
        when(memberVO.getByr_Id()).thenReturn("qwer12");

        // when: 로그인 요청 처리
        ResponseEntity<String> result = memberController.login(loginMap, request, response);

        // then: 로그인 성공 시 응답 메시지가 있어야 함
        assertNotNull(result);
        System.out.println(result.getBody());  // 결과 메시지 출력
    }
/*
    @Test
    public void testLogin_Failure() throws Exception {
        // given: 잘못된 로그인 정보
        Map<String, String> loginMap = new HashMap<>();
        loginMap.put("byr_Id", "wrongUser");
        loginMap.put("pw", "wrongPassword");

        // memberService의 login 메서드가 null을 반환하도록 설정
        when(memberService.login(anyMap())).thenReturn(null);

        // when: 로그인 실패 처리
        ResponseEntity<String> result = memberController.login(loginMap, request, response);

        // then: 로그인 실패 시 응답 메시지가 있어야 함
        assertNotNull(result);
        System.out.println(result.getBody());  // 결과 메시지 출력
    }
*/
}
