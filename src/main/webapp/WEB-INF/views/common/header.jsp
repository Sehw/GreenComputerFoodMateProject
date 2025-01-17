<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
<style>
.container1 {
    width: 900px;
    height: 120px;
    margin: 0 auto;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

#sitelogo {
    width: 120px;
}

.search-bar {
    flex: 1;
    margin: 0 20px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.search-bar input[type="text"] {
    width: 50%;
    height: 40px;
    padding: 0 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.search-bar button {
    height: 40px;
    width: 50px;
    background-color: #fa9820;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
}

.action-buttons {
    display: flex;
    gap: 10px;
    align-items: center;
}

.action-buttons a {
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 1px solid #ccc;
    border-radius: 50%;
    text-decoration: none;
    color: black;
    font-size: 18px;
    background-color: #f9f9f9;
}
</style>
</head>
<body>
<div class="container1">
    <a href="${contextPath}/main.do"><img id="sitelogo" src="${contextPath}/resources/images/foodmatelogo.png" alt="푸드메이트로고"></a>

    <div class="search-bar">
        <input type="text" placeholder="레시피나 재료를 검색해 보세요.">
        <button><i class="fas fa-search"></i></button>
    </div>

    <div class="action-buttons">
        <a href="${contextPath}/member/loginForm.do" title="로그인 및 마이페이지">
            <i class="fas fa-user"></i>
        </a>
        <a href="${contextPath}/product_add" title="레시피 작성">
            <i class="fas fa-pen"></i>
        </a>
        <a href="${contextPath}/cart" title="장바구니">
            <i class="fas fa-shopping-cart"></i>
        </a>
    </div>
</div>
</body>
</html>
