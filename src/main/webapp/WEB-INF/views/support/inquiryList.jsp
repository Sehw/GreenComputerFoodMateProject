<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의 목록</title>
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
            max-width: 1000px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            font-size: 2.5rem;
            color: #f39c12;
            margin-bottom: 40px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .list-table {
            width: 95%;
            border-collapse: collapse;
            margin: 0 auto 20px auto;
            table-layout: auto;
        }

        .list-table th, .list-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .list-table th {
            background-color: #f39c12;
            color: white;
            font-weight: 800;
            font-size:20px;
        }

        .list-table td {
            background-color: #fff;
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

        .button-container a {
            text-decoration: none;
            color: white;
        }

        .list-table a {
            text-decoration: none;
            color: black; 
            font-weight: bold; 
        }

        
        a:hover {
            color: #f39c12;
        }
  
    </style>
</head>
<body>

    <div class="container">
        <h1>📜내 문의 내역</h1><br><br>
        <table class="list-table">
            <thead>
                <tr>
                    <th>문의 제목</th>
                    <th>문의 종류</th>
                    <th>작성일</th>
                    <th>상태</th>
                    <th>비고</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><span><a href="${contextPath}/support/inquiryDetail.do">상품 배송 관련</a></span></td>
                    <td>배송</td>
                    <td>2025-01-10</td>
                    <td>답변 대기</td>
                    <td class="button-container">
                        <button onclick="window.location.href='inquiryEdit'">수정</button>
                    </td>
                </tr>
                <tr>
                    <td><span><a href="view.html">결제 오류 문의</a></span></td>
                    <td>결제</td>
                    <td>2025-01-08</td>
                    <td>답변 완료</td>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                    <td><span><a href="view.html">반품 절차 문의</a></span></td>
                    <td>반품</td>
                    <td>2025-01-12</td>
                    <td>답변 대기</td>
                    <td class="button-container">
                        <button onclick="window.location.href='inquiryEdit'">수정</button>
                    </td>
                </tr>
                <tr>
                    <td><span><a href="view.html">회원 가입 관련</a></span></td>
                    <td>회원</td>
                    <td>2025-01-14</td>
                    <td>답변 완료</td>
                    <td>
                      
                    </td>
                </tr>
                <tr>
                    <td><span><a href="view.html">상품 품절 문의</a></span></td>
                    <td>상품</td>
                    <td>2025-01-09</td>
                    <td>답변 대기</td>
                    <td class="button-container">
                        <button onclick="window.location.href='inquiryEdit'">수정</button>
                    </td>
                </tr>
            </tbody>
        </table>
        
        <div class="button-container">
            <button onclick="window.location.href='inquiryWrite'">글쓰기</button>
        </div>
    </div>

</body>
</html>
