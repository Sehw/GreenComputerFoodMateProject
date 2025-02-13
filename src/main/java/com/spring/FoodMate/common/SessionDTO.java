package com.spring.FoodMate.common;

public class SessionDTO {
    private String userId;
    private String userName;
    private String userRole;
    private String msg;

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }
    public String getUserRole() { return userRole; }
    public void setUserRole(String userRole) { this.userRole = userRole; }
    public String getMsg() { return msg; }
    public void setMsg(String msg) { this.msg = msg; }
}