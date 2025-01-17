<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의 작성</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            font-size: 2.5rem;
            color: #333;
            margin-bottom: 40px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 12px;
            font-size: 1rem;
            border-radius: 6px;
            border: 1px solid #ddd;
            margin-bottom: 10px;
        }

        .form-group textarea {
            height: 200px;
            resize: vertical;
        }

        .form-group input[type="file"] {
            border: none;
            padding: 10px;
            background-color: #f9f9f9;
            cursor: pointer;
            font-size: 1rem;
        }

        .button-container {
            text-align: center;
        }

        .button-container button {
            padding: 12px 25px;
            background-color: #f39c12;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .button-container button:hover {
            background-color: #e67e22;
        }

        .back-button {
            margin-top: 20px;
            display: inline-block;
            text-decoration: none;
            padding: 12px 20px;
            background-color: #ddd;
            border-radius: 6px;
            color: #333;
            font-size: 1rem;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>✏️1:1 문의 작성</h1>
        <form action="#" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="title">문의 제목</label>
                <input type="text" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="category">문의 종류</label>
                <select id="category" name="category" required>
                    <option value="배송">배송</option>
                    <option value="결제">결제</option>
                    <option value="상품">상품</option>
                    <option value="기타">기타</option>
                </select>
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="tel" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="message">문의 내용</label>
                <textarea id="message" name="message" required></textarea>
            </div>
            <div class="form-group">
                <label for="attachment">첨부파일</label>
                <input type="file" id="attachment" name="attachment">
            </div>
          	<div class="button-container">
			    <button type="submit" class="submit-button">작성하기</button>
			    <button type="button" class="back-button">목록으로 돌아가기</button>
			</div>
        </form>
        		
    </div>

</body>
</html>
