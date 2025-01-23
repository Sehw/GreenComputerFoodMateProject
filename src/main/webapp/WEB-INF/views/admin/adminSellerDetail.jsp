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
    <title>판매자 상세 정보</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .custom-container {
            margin: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }

        .profile-header img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 20px;
        }

        .profile-header h2 {
            margin: 0;
            font-size: 1.8rem;
        }

        .profile-header p {
            margin: 5px 0;
            color: #777;
        }

        .section {
            margin-bottom: 30px;
        }

        .section h3 {
            color: #333;
            font-size: 1.5rem;
        }

        .details-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .details-list li {
            background-color: #f9f9f9;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
        }

        .details-list li span {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="custom-container">
        <h2>판매자 상세 정보</h2>

        <div class="profile-header">
            <img src="${contextPath}/resources/images/example1.png" alt="판매자 이미지">
            <div>
                <h2>판매자 1</h2>
                <p><span>이메일:</span> seller1@example.com</p>
                <p><span>전화번호:</span> 010-1234-5678</p>
                <p><span>주소:</span> 서울시 강남구 삼성로 85길 15</p>
                <p><span>가입일자:</span> 2022-05-20</p>
            </div>
        </div>

        <div class="section">
            <h3>판매자 정보</h3>
            <ul class="details-list">
                <li><span>판매 상품 수:</span> 20개</li>
                <li><span>총 매출:</span> 500,000원</li>
                <li><span>상태:</span> 활동 중</li>
            </ul>
        </div>

        <div class="section">
            <h3>상세 기록</h3>
            <ul class="details-list">
                <li><span>최근 판매 일자:</span> 2024-01-10</li>
                <li><span>최근 리뷰 점수:</span> 4.5점</li>
            </ul>
        </div>

        <div class="section">
            <h3>판매자 변경 사항</h3>
            <ul class="details-list">
                <li><span>마지막 로그인:</span> 2024-01-15</li>
                <li><span>등록된 상품 수:</span> 15개</li>
                <li><span>정지 상태:</span> 없음</li>
            </ul>
        </div>

        <a href="판매자목록페이지.jsp">목록으로 돌아가기</a>
    </div>
</body>
</html>
