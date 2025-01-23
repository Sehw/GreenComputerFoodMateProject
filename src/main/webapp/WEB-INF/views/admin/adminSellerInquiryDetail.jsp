<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <meta charset="UTF-8">
    <title>상품 수정 요청 상세 정보</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container1 {
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

        .response-section {
            margin-top: 30px;
        }

        .response-section textarea {
            width: 100%;
            height: 150px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 1rem;
        }

        .response-section button {
            background-color: #28a745;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            border: none;
            margin-top: 10px;
        }

        .response-section button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container1">
        <div class="header">
            <h2>상품 수정 요청 상세 정보</h2>
            <a href="${contextPath}/admin/productRequestList.jsp" class="btn-back">목록으로 돌아가기</a>
        </div>

        <div class="detail-section">
            <h3>수정 요청 정보</h3>
            <ul class="detail-list">
                <li><span>요청일:</span> 2025-01-12</li>
                <li><span>상품명:</span> 칸예 고사리</li>
                <li><span>판매자:</span> 칸예</li>
                <li><span>수정 요청 내용:</span> 가격 수정 요청 (현재 가격: 10,000원 → 수정된 가격: 12,000원)</li>
                <li><span>요청 상태:</span> 승인 대기</li>
            </ul>
        </div>

        <div class="response-section">
            <h3>관리자 답변</h3>
            <form action="${contextPath}/admin/responseProductRequest" method="post">
                <textarea name="response" placeholder="관리자의 답변을 입력하세요..." required></textarea>
                <button type="submit">답변 제출</button>
            </form>
        </div>
    </div>
</body>
</html>
