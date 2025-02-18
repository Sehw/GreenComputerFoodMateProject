<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내비게이션 바</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');

nav {
    font-family: "Noto Sans KR", sans-serif;
}

.nav_main {
    background-color: #fa9820;
    height: 50px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.nav_main ul {
    display: flex;
    padding: 0;
    margin: 0;
    list-style: none;
    flex-wrap: nowrap; /* 줄바꿈 방지 */
}

.nav_main li {
    margin: 0 100px;
    white-space: nowrap; /* 글자 줄바꿈 방지 */
}

.nav_main a {
    font-size: 1.25em;
    color: white;
    text-decoration: none;
}

.nav_main a.active {
    font-weight: bold;
}
</style>
</head>
<body>
<nav class="nav_main">
    <ul>
        <li><a class="active" href="${contextPath}/main">메인</a></li>
        <li><a href="${contextPath}/recipe/recipe_list">레시피</a></li>
        <li><a href="${contextPath}/product/pdtlist">식재료</a></li>
        <li><a href="${contextPath}/support/inquiryLists">고객센터</a></li>
    </ul>
</nav>
</body>
</html>