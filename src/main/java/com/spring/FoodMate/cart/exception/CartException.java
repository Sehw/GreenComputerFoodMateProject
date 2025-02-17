package com.spring.FoodMate.cart.exception;

public class CartException extends RuntimeException {
	private static final long serialVersionUID = 2L;
	
	private int errorCode;
	
	public int getErrorCode() {
		return errorCode;
	}
	
    public CartException(int errorCode) {
        this.errorCode = errorCode;
    }

    public CartException(String message, Throwable cause) {
        super(message, cause);
    }
}