package com.spring.FoodMate.common.exception;

public class UnhandledException extends RuntimeException {
	private static final long serialVersionUID = 5L;
    public UnhandledException(String message) {
    	super("FoodMate - UnhandledException : \n" + message);
    }

    public UnhandledException(String message, Throwable cause) {
    	super("FoodMate - UnhandledException : \n" + message, cause);
    }
}