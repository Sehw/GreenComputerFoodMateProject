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
    <title>관리자 상세 정보</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            margin: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .header h2 {
            margin: 0;
            font-size: 1.8rem;
        }

        .header .btn-back {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
        }

        .header .btn-back:hover {
            background-color: #0056b3;
        }

        .detail-section {
            margin-bottom: 20px;
        }

        .detail-section h3 {
            color: #333;
            font-size: 1.5rem;
        }

        .detail-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .detail-list li {
            background-color: #f9f9f9;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
        }

        .detail-list li span {
            font-weight: bold;
        }

        .status-section {
            margin-top: 30px;
        }

        .status-section select {
            padding: 10px;
            font-size: 1rem;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .status-section button {
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            border: none;
            margin-top: 10px;
        }

        .status-section button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>관리자 상세 정보</h2>
            <a href="${contextPath}/admin/allAdmins.jsp" class="btn-back">목록으로 돌아가기</a>
        </div>

        <div class="detail-section">
            <h3>관리자 정보</h3>
            <ul class="detail-list">
                <li><span>관리자 이름:</span> 관리자 1</li>
                <li><span>이메일:</span> admin1@example.com</li>
                <li><span>역할:</span> 슈퍼 관리자</li>
                <li><span>상태:</span> 활동 중</li>
            </ul>
        </div>

        <div class="status-section">
            <h3>관리자 상태 변경</h3>
            <form action="${contextPath}/admin/updateAdminStatus" method="post">
                <label for="status">새 상태:</label>
                <select id="status" name="status">
                    <option value="활동 중">활동 중</option>
                    <option value="로그아웃">로그아웃</option>
                    <option value="정지">정지</option>
                </select>
                <button type="submit">상태 변경</button>
            </form>
        </div>

        <div class="status-section">
            <h3>관리자 삭제</h3>
            <form action="${contextPath}/admin/deleteAdmin" method="post">
                <input type="hidden" name="adminId" value="1"> <!-- 관리자의 고유 ID -->
                <button type="submit" style="background-color: #dc3545;">관리자 삭제</button>
            </form>
        </div>
    </div>
</body>
</html>
