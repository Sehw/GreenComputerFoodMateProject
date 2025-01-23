<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 로그인</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f1f1f1;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        .login-container h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 30px;
        }
        .login-container input {
            width: 100%;
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        .login-container input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            font-size: 18px;
        }
        .login-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .login-container .forgot-password {
            text-align: center;
            margin-top: 10px;
        }
        .login-container .forgot-password a {
            color: #007bff;
            text-decoration: none;
        }
        .login-container .forgot-password a:hover {
            text-decoration: underline;
        }
        .register-btn {
            display: block;
            width: 100%;
            padding: 15px;
            margin-top: 15px;
            background-color: #28a745;
            color: white;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
        }
        .register-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>관리자 로그인</h2>
        <form action="${contextPath}/admin/loginAction.do" method="POST">
            <input type="text" name="adminId" placeholder="아이디" required />
            <input type="password" name="adminPassword" placeholder="비밀번호" required />
            <input type="submit" value="로그인" />
        </form>
        <div class="forgot-password">
            <a href="#">비밀번호 찾기</a>
        </div>
        <a href="${contextPath}/admin/adminSignUp.do" class="register-btn">회원가입</a> <!-- 회원가입 페이지로 이동 -->
    </div>
</body>
</html>
