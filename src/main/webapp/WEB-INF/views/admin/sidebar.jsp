<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
<meta charset="UTF-8">
<title>상단부</title>
</head>
<!-- sidebar.jsp -->
<div class="sidebar">
    <h2>관리자 메뉴</h2>
    <div class="admin-area">
        <h5><strong>계정 관리</strong></h5>
        <ul>
            <li><a href="#">전체 사용자</a></li>
            <li><a href="#">탈퇴 신청 사용자</a></li>
            <li><a href="#">휴면 상태 사용자</a></li>
            <li><a href="#">전체 판매자</a></li>
        </ul>
    </div>

    <div class="admin-area">
        <h5><strong>신고/ 문의 관리</strong></h5>
        <ul>
            <li><a href="#">사용자 신고 내역</a></li>
            <li><a href="#">판매자 신고 내역</a></li>
            <li><a href="#">레시피 신고 내역</a></li>
            <li><a href="#">상품 신고 내역</a></li>
            <li><a href="#">댓글 신고 내역</a></li>
            <li><a href="#">1:1 문의</a></li>
        </ul>
    </div>

    <div class="admin-area">
        <h5><strong>레시피/상품 관리</strong></h5>
        <ul>
            <li><a href="#">등록된 레시피</a></li>
            <li><a href="#">등록된 상품</a></li>
        </ul>
    </div>

    <div class="admin-area">
        <h5><strong>결제 내역 관리</strong></h5>
        <ul>
            <li><a href="#">전체 결제 내역</a></li>
            <li><a href="#">결제 금액 관리</a></li>
            <li><a href="#">환불 관리</a></li>
        </ul>
    </div>

    <div class="admin-area">
        <h5><strong>관리자 관리</strong></h5>
        <ul>
            <li><a href="#">전체 관리자</a></li>
            <li><a href="#">관리자 회원가입</a></li>
        </ul>
    </div>
</div>

</html>