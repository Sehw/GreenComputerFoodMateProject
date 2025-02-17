package com.spring.FoodMate.common.exception;

public class JjamException extends RuntimeException {
	private static final long serialVersionUID = 5L;
    public JjamException(String message) {
    	super("FoodMate - UnhandledException : \n" + message);
    }

    public JjamException(String message, Throwable cause) {
    	super("FoodMate - UnhandledException : \n" + message, cause);
    }
}