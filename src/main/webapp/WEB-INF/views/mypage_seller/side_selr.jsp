<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<head>
<meta charset="UTF-8">
<title>사이드 메뉴</title>
</head>
    <style>
        .sidebar {
            background-color: #f8f9fa;
            height: 100%;
            padding: 20px;
            border-right: 1px solid #ddd;
            width: 250px;
            float: left;
        }
        .sidebar h3 {
            color: #74b243;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .sidebar h3 a {
		    color: #74b243; /* 기본 텍스트 색상 */
		    text-decoration: none; /* 링크의 밑줄 제거 */
		}
        .sidebar a {
            display: block;
            margin: 10px 0;
            color: #87c058;
            text-decoration: none;
        }
        .sidebar a:hover {
            color: #87c058;
            text-decoration: underline;
        }
    </style>
<body>
    <div class="sidebar">
        <h3><a href="${contextPath}/mypage_seller/mypage_sell_main">마이페이지</a></h3>
        <hr>
        
        <h5>상품관리</h5>
        <ul>
	        <li><a href="${contextPath}/mypage_seller/mypage_sell_productlist">내 상품</a></li>
	        <li><a href="${contextPath}/mypage_seller/mypage_sell_productamount">상품 재고관리/공개설정</a></li>
        </ul>
        <hr>
        
        <h5>내 정보관리</h5>
        <ul>
	        <li><a href="${contextPath}/mypage/myInfoManage/profileEditForm.do">프로필 수정</a></li>
	        <li><a href="${contextPath}/mypage/myInfoManage/memberEditForm.do">회원정보 수정</a></li>
        </ul>
        <hr>
        
        <h5>주문 관리</h5>
        <ul>
	        <li><a href="#">주문목록</a></li>
	        <li><a href="#">취소/반품/교환 내역</a></li>
	        <li><a href="#">환불/입금 내역</a></li>
	        <li><a href="#">매출 조회</a></li>
        </ul>
        <hr>
        
        <h5>이벤트관리</h5>
        <ul>
	        <li><a href="#">쇼핑몰할인</a></li>
	        <li><a href="#">자체할인</a></li>
        </ul>
        <hr>
        
        <h5>고객센터</h5>
        <ul>
        	<li><a href="#">자주묻는질문</a></li>
	        <li><a href="#">1:1 문의내역</a></li>
        </ul>
    </div>
</body>
</html>