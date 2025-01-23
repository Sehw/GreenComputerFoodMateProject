<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    <link href="<c:url value='/resources/css/slide.css' />" rel="stylesheet">
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            margin: 20px;
        }
        /* 대시보드 요약 섹션 */
        .dashboard-summary {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }
        .dashboard-item {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            width: 23%;
            text-align: center;
        }
        .dashboard-item h4 {
            margin: 0;
            font-size: 24px;
            color: #007bff;
        }
        .dashboard-item p {
            font-size: 18px;
            color: #555;
        }
        /* 관리자 관리 영역 */
        .admin-section {
            display: flex;
            justify-content: space-between;
        }
        .admin-area {
            width: 30%;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .admin-area h5 {
            text-align: center;
            font-size: 20px;
            margin-bottom: 20px;
        }
        .admin-area .item {
            background-color: #fff;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 3px rgba(0,0,0,0.1);
            display: flex;
            justify-content: space-between;
        }
        .admin-area .item a {
            color: #007bff;
            text-decoration: none;
        }
        .admin-area .item a:hover {
            text-decoration: underline;
        }
        /* 카드 스타일 */
        .item-img {
            position: relative;
            overflow: hidden;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .item-title {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: rgba(0, 0, 0, 0.5);
            color: #fff;
            padding: 10px;
        }
        .item-footer {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <!-- 관리자 메인 페이지 -->
    <div class="container">

        <!-- 대시보드 요약 -->
        <div class="dashboard-summary">
            <div class="dashboard-item">
                <h4>1,234</h4>
                <p>오늘 방문자</p>
            </div>
            <div class="dashboard-item">
                <h4>45</h4>
                <p>오늘 판매된 상품</p>
            </div>
            <div class="dashboard-item">
                <h4>₩1,500,000</h4>
                <p>총 매출</p>
            </div>
            <div class="dashboard-item">
                <h4>200</h4>
                <p>총 유저 수</p>
            </div>
        </div>

        <!-- 관리자 관리 영역 -->
        <div class="admin-section">
            <!-- 계정 관리 -->
            <div class="admin-area">
                <h5><strong>계정 관리</strong></h5>
                <div class="item">
                    <span>전체 사용자</span>
                    <a href="#">보기</a>
                </div>
                <div class="item">
                    <span>탈퇴 신청 사용자</span>
                    <a href="#">보기</a>
                </div>
                <div class="item">
                    <span>휴면 상태 사용자</span>
                    <a href="#">보기</a>
                </div>
                <div class="item">
                    <span>전체 판매자</span>
                    <a href="#">보기</a>
                </div>
            </div>

            <!-- 미처리 현황 -->
            <div class="admin-area">
                <h5><strong>신고/ 문의 관리</strong></h5>
                <div class="item">
                    <span>사용자 신고 내력</span>
                    <a href="#">보기</a>
                </div>
                <div class="item">
                    <span>판매자 신고 내역</span>
                    <a href="#">보기</a>
                </div>
                <div class="item">
                    <span>레시피 신고 내역</span>
                    <a href="#">보기</a>
                </div>
                <div class="item">
                    <span>상품 신고 내역</span>
                    <a href="#">보기</a>
                </div>
                <div class="item">
                    <span>댓글 신고 내역</span>
                    <a href="#">보기</a>
                </div>
                <div class="item">
                    <span>1:1 문의</span>
                    <a href="#">보기</a>
                </div>
            </div>

            <!-- 레시피 및 상품 관리 -->
            <div class="admin-area">
                <h5><strong>레시피/상품 관리</strong></h5>
                <div class="item">
                    <span>등록된 레시피</span>
                    <a href="#">보기</a>
                </div>
                <div class="item">
                    <span>등록된 상품</span>
                    <a href="#">보기</a>
                </div>
            </div>
            
            <div class="admin-area">
                <h5><strong>결제 내역 관리</strong></h5>
                <div class="item">
                    <span>전체 결재 내역</span>
                    <a href="${contextPath}/admin/adminOrders.do">보기</a>
                </div>
                <div class="item">
                    <span>결재 금액 관리</span>
                    <a href="#">보기</a>
                </div>
                <div class="item">
                    <span>환불 관리</span>
                    <a href="#">보기</a>
                </div>                
            </div>
            
            
            <div class="admin-area">
                <h5><strong>관리자 관리</strong></h5>
                <div class="item">
                    <span>전체 관리자</span>
                    <a href="${contextPath}/admin/adminAdminControll.do">보기</a>
                </div>
                <div class="item">
                    <span>관리자 회원가입</span>
                    <a href="#">보기</a>
                </div>                
            </div>
            
        </div>        
    </div>
</body>
</html>