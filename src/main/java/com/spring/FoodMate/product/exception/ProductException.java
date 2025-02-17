package com.spring.FoodMate.product.exception;

public class ProductException extends RuntimeException {
	private static final long serialVersionUID = 10L;
	
	private int errorCode;
	
	public int getErrorCode() {
		return errorCode;
	}
	
    public ProductException(int errorCode) {
        this.errorCode = errorCode;
    }

    public ProductException(String message, Throwable cause) {
        super(message, cause);
    }
}