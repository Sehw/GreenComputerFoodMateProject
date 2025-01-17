<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 & 상품 업데이트</title>
    <link rel="stylesheet" href="styles.css">
    <style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}


body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f9;
    color: #333;
}


header {
    color: white;
    padding: 20px;
    text-align: center;
}

.header-content {
 	background-color: #333;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header-content h1 {
    font-size: 2rem;
    margin-right: 20px;
}

.category-select {
    padding: 10px;
    font-size: 1rem;
    border: 1px solid #ccc;
    border-radius: 5px;
    cursor: pointer;
}


main {
    padding: 40px;
    max-width: 1200px;
    margin: 0 auto;
}


.board-section {
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
    overflow-x: auto;
}

.notice-table {
    width: 100%;
    border-collapse: collapse;
    font-size: 1rem;
}

.notice-table th, .notice-table td {
    padding: 12px 15px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

.notice-table th {
    background-color: #333;
    color: white;
}

.notice-table td a {
    color: #007BFF;
    text-decoration: none;
}

.notice-table td a:hover {
    text-decoration: underline;
}



    
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <h1>공지사항 & 상품 업데이트</h1>
            <select class="category-select">
                <option value="notice">공지사항</option>
                <option value="product-update">상품 업데이트</option>
            </select>
        </div>
    </header>

    <main>
        <section class="board-section">
            <table class="notice-table">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td><a href="#">공지사항 제목 1</a></td>
                        <td>2025-01-10</td>
                        <td>120</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><a href="#">공지사항 제목 2</a></td>
                        <td>2025-01-09</td>
                        <td>90</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td><a href="#">상품 업데이트 소식 1</a></td>
                        <td>2025-01-05</td>
                        <td>150</td>
                    </tr>
                </tbody>
            </table>
        </section>
    </main>

</body>
</html>
