package com.spring.FoodMate.common.exception;

public class ApiException extends RuntimeException {
	private static final long serialVersionUID = 1L;
    public ApiException(String message) {
        super("FoodMate - ApiException : \n" + message);
    }

    public ApiException(String message, Throwable cause) {
        super("FoodMate - ApiException : \n" + message, cause);
    }
}