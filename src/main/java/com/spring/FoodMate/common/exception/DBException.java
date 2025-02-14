package com.spring.FoodMate.common.exception;

public class DBException extends RuntimeException {
    private static final long serialVersionUID = 2L;
    public DBException(String message) {
        super("DBException - FoodMate : \n" + message);
    }

    public DBException(String message, Throwable cause) {
        super("FoodMate - DBException : \n" + message, cause);
    }
}
