package com.spring.FoodMate.product.exception;

public class ProductException extends RuntimeException {
	private static final long serialVersionUID = 10L;
	
	private String errorMessage;
	private int errorCode;
	// 201 = 없는 상품 정보를 달라고 했을 때
	// 202 = 상품 추가 실패?
	// 203 = 상품 등록자와 다른 판매자가 수정, 삭제하려고 하면
	// 204 = 상품 수정 실패?
	// 205 = 상품 삭제 실패?
	
	public String message() {
		return errorMessage;
	}
	public int getErrorCode() {
		return errorCode;
	}
	
    public ProductException(int errorCode) {
        this.errorCode = errorCode;
    }

    public ProductException(String message, int errorCode) {
        this.errorMessage = message;
        this.errorCode = errorCode;
    }
    
    public ProductException(String message, Throwable cause) {
    	super(message, cause);
    }
}