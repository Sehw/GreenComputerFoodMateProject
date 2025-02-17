package com.spring.FoodMate.common.exception;

public class UnauthorizedException extends RuntimeException {
    private static final long serialVersionUID = 4L;
    
    private int errorCode;
    // 101 : 세션에 sessionDTO 자체가 없는 오류
    // 102 : sessionDTO의 userRole이 구매자가 아님
    // 103 : sessionDTO의 userRole이 판매자가 아님
    // 104 : sessionDTO의 userRole이 관리자가 아님
    // 105 : sessionDTO의 userId가 없음 (비정상적 로그인?)

    public int getErrorCode() {
        return errorCode;
    }

    public UnauthorizedException(int errorCode) {
        this.errorCode = errorCode;
    }
}
