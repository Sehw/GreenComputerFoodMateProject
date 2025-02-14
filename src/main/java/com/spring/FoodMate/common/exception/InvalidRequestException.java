package com.spring.FoodMate.common.exception;

public class InvalidRequestException extends RuntimeException {
	private static final long serialVersionUID = 3L;
    public InvalidRequestException(String message) {
        super("FoodMate - InvalidRequestException : \n" + message);
    }

    public InvalidRequestException(String message, Throwable cause) {
    	super("FoodMate - InvalidRequestException : \n" + message, cause);
    }
}