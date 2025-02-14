package com.spring.FoodMate.cart.exception;

public class CartException extends RuntimeException {
	private static final long serialVersionUID = 2L;
    public CartException(String message) {
        super(message);
    }

    public CartException(String message, Throwable cause) {
        super(message, cause);
    }
}