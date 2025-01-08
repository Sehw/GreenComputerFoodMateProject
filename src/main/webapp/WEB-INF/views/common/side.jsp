<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<head>
<meta charset="UTF-8">
<title>사이드 메뉴</title>
</head>
    <style>
        .sidebar {
            background-color: #f8f9fa;
            height: 100%;
            padding: 20px;
            border-right: 1px solid #ddd;
        }
        .sidebar h3 {
            color: #007bff;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .sidebar a {
            display: block;
            margin: 10px 0;
            color: #007bff;
            text-decoration: none;
        }
        .sidebar a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>
<body>
    <div class="sidebar">
        <h3>사이드 메뉴</h3>
        <a href="${contextPath}/member/listMembers.do">회원 관리</a>
        <a href="${contextPath}/board/listArticles.do">게시판 관리</a>
        <a href="#">상품 관리</a>
    </div>
</body>
</html>