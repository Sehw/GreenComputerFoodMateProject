package com.spring.FoodMate.common.exception;

public class UnauthorizedException extends RuntimeException {
	private static final long serialVersionUID = 4L;
    public UnauthorizedException(String message) {
    	super("FoodMate - UnauthorizedException : \n" + message);
    }

    public UnauthorizedException(String message, Throwable cause) {
    	super("FoodMate - UnauthorizedException : \n" + message, cause);
    }
}