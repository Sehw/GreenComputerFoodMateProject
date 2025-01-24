<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <link href="<c:url value='/resources/css/main.css' />" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
  <meta charset="UTF-8">
  <title>상단메뉴</title>
  <style>
    .container-fluid h3 a {
        text-decoration: none; /* 링크 밑줄 제거 */
        color: white; /* 텍스트 색상 */
    }

    .container-fluid h3 a:hover {
        text-decoration: underline; /* hover 상태에서 밑줄 표시 */
        transition: border-bottom 0.2s;
    }

    .dropdown-menu {
        position: absolute;
        z-index: 1000;
        display: none;
    }

    .dropdown:hover .dropdown-menu {
        display: block;
    }
  </style>
</head>
<body>
  <div class="container-fluid bg-green2 text-white py-3 d-flex align-items-center justify-content-between shadow-sm">
    <div class="d-flex justify-content-center gap-5 flex-grow-1">
        <h3><a href="${contextPath}/admin/adminRecipe.do">레시피 관리</a></h3>
        <h3><a href="${contextPath}/admin/adminIngredients.do">상품 관리</a></h3>

        <!-- 회원 관리 드롭다운 -->
        <div class="dropdown">
            <h3><a href="#" class="dropdown-toggle" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">회원 관리</a></h3>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                <li><a class="dropdown-item" href="${contextPath}/admin/adminUsers.do">사용자 관리</a></li>
                <li><a class="dropdown-item" href="${contextPath}/admin/adminSellers.do">판매자 관리</a></li>
            </ul>
        </div>
        
        <h3><a href="${contextPath}/admin/adminStatistics.do">통계</a></h3>

        <!-- 문의 내용 드롭다운 -->
        <div class="dropdown">
            <h3><a href="#" class="dropdown-toggle" id="dropdownMenuLink2" data-bs-toggle="dropdown" aria-expanded="false">문의 내용</a></h3>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink2">
                <li><a class="dropdown-item" href="${contextPath}/admin/adminUsersInquiry.do">유저 문의</a></li>
                <li><a class="dropdown-item" href="${contextPath}/admin/adminSellersInquiry.do">판매자 문의</a></li>
            </ul>
        </div>
    </div>
  </div>

  <!-- Bootstrap JS (bundle) 포함 위치를 body 끝으로 변경 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
