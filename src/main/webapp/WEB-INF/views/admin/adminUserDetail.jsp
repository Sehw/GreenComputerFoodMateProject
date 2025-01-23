<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용자 상세 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        /* 본문 스타일 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* 본문 전용 container 스타일 */
        .custom-container {
            width: 80%; /* 너비 설정 */
            margin: 20px auto; /* 가운데 정렬 */
            background-color: white; /* 배경색 */
            padding: 20px; /* 패딩 */
            border-radius: 8px; /* 모서리 둥글게 */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        }

        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }

        .profile-header img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 20px;
        }

        .profile-header h2 {
            margin: 0;
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

        .list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .list li {
            background-color: #f9f9f9;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
        }

        .list li a {
            text-decoration: none;
            color: #007bff;
        }

    </style>
</head>
<body>
    <!-- 본문 내용 -->
    <div class="custom-container">
        <div class="profile-header">
            <img src="${contextPath}/resources/images/example1.jpg" alt="프로필 이미지">
            <div>
                <h2>홍길동</h2>
                <p>Email: honggildong@example.com</p>
                <p>전화번호: 010-1234-5678</p>
                <p>주소: 서울시 강남구</p>
                <p>가입일자: 2025-01-01</p>
            </div>
        </div>

        <div class="section">
            <h3>작성한 레시피 목록</h3>
            <ul class="list">
                <li><a href="#">조회</a></li>
            </ul>
        </div>

        <div class="section">
            <h3>작성한 댓글 목록</h3>
            <ul class="list">
                <li><a href="#">조회</a></li>
            </ul>
        </div>

        <div class="section">
            <h3>구매한 상품 목록</h3>
            <ul class="list">
                <li><a href="#">조회</a></li>
            </ul>
        </div>

        <div class="section">
            <h3>신고 내역</h3>
            <ul class="list">
                <li><a href="#">조회</a></li>
            </ul>
        </div>

        <div class="section">
            <h3>문의 내역</h3>
            <ul class="list">
                <li><a href="#">조회</a></li>
            </ul>
        </div>
    </div>
</body>
</html>
