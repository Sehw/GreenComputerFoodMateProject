<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>오류 발생</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #721c24;
            padding: 20px;
        }
        .error-message {
            padding: 15px;
            border: 1px solid #f5c6cb;
            background-color: #f8d7da;
            border-radius: 5px;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <h1>오류가 발생했습니다!</h1>
    <div class="error-message">
        <strong>오류 메시지:</strong> ${errorMessage}
    </div>
    <a href="${pageContext.request.contextPath}/">홈으로 돌아가기</a>
</body>
</html>
