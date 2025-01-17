<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의 상세 정보</title>
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

        .detail-box {
            margin-bottom: 20px;
        }

        .detail-box span {
            font-weight: bold;
            color: #555;
        }

        .detail-box p {
            font-size: 1.1rem;
            color: #777;
            line-height: 1.6;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
            font-size: 1rem;
        }

        table th {
            background-color: #f4f4f4;
            font-weight: bold;
        }

        .button-container {
            text-align: center;
            margin-top: 30px;
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

        .response-container {
            margin-top: 40px;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .response-container h3 {
            font-size: 1.8rem;
            margin-bottom: 20px;
            color: #f39c12;
        }

        .response-container p {
            font-size: 1.1rem;
            color: #777;
            line-height: 1.6;
        }

    </style>
</head>
<body>

    <div class="container">
        <h1>📝문의 상세 내용</h1>

        <!-- 문의 정보 표 -->
        <table>
            <tr>
                <th>문의 제목</th>
                <td>상품 배송 관련</td>
            </tr>
            <tr>
                <th>작성일</th>
                <td>2025-01-10</td>
            </tr>
            <tr>
                <th>문의 종류</th>
                <td>배송</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>홍길동</td>
            </tr>
            <tr>
                <th>문의 내용</th>
                <td>상품 배송 상태가 이상합니다. 확인 부탁드립니다.</td>
            </tr>
        </table>

        <!-- 답변 내용 -->
        <div class="response-container">
            <h3>📬답변 내용</h3>
            <hr>
            <p><span>담당자:</span> 김관리자</p>
            <p>문의하신 사항에 대해 확인해본 결과, 배송 상태는 정상적으로 처리되었습니다. 추가적으로 문의사항이 있으시면 언제든지 연락 주세요.</p>
        </div>

        <!-- 돌아가기 버튼 -->
        <div class="button-container">
            <button onclick="window.location.href='main10.do'">목록으로 돌아가기</button>
        </div>
    </div>

</body>
</html>
