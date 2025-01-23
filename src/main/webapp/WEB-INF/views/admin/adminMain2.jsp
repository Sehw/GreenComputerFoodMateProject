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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <meta charset="UTF-8">
    <title>관리자 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
        }

        .container {
            display: flex;
            width: 100%;
        }

        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: #fff;
            padding: 20px;
            height: 100vh; /* 화면 전체 높이 */
            position: fixed;
            top: 0;
            left: 0;
            box-sizing: border-box;
        }

        .sidebar h2 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 30px;
        }

        .admin-area {
            margin-bottom: 30px;
        }

        .admin-area h5 {
            font-size: 18px;
            margin-bottom: 10px;
            text-transform: uppercase;
        }

        .admin-area ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .admin-area ul li {
            margin-bottom: 10px;
        }

        .admin-area ul li a {
            text-decoration: none;
            color: #fff;
            font-size: 16px;
            display: block;
            padding: 8px;
            background-color: #34495e;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .admin-area ul li a:hover {
            background-color: #16a085;
        }

        .main-content {
            margin-left: 250px; /* 사이드바 크기만큼 여백을 둔다 */
            padding: 20px;
            flex-grow: 1;
        }

        /* 대시보드 요약 */
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

        /* 그래프 영역 */
        .chart-container {
            margin-top: 30px;
        }

        .chart {
            width: 100%;
            height: 400px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 사이드바 -->
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

        <!-- 메인 콘텐츠 영역 -->
        <div class="main-content">
            <h1>관리자 대시보드</h1>

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

            <!-- 그래프 영역 -->
            <div class="chart-container">
                <h2>방문자 수 및 매출 변화</h2>
                
                <!-- 방문자 수 변화 라인 차트 -->
                <canvas id="visitorChart" class="chart"></canvas>

                <!-- 총 매출 변화 막대 차트 -->
                <canvas id="salesChart" class="chart"></canvas>
            </div>

        </div>
    </div>

    <!-- Chart.js 스크립트 -->
    <script>
        // 방문자 수 라인 차트
        var ctx1 = document.getElementById('visitorChart').getContext('2d');
        var visitorChart = new Chart(ctx1, {
            type: 'line',
            data: {
                labels: ['1월', '2월', '3월', '4월', '5월', '6월'],
                datasets: [{
                    label: '방문자 수',
                    data: [1200, 1500, 1700, 1600, 1900, 2200],
                    fill: false,
                    borderColor: 'rgba(75, 192, 192, 1)',
                    tension: 0.1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    title: {
                        display: true,
                        text: '방문자 수 변화 (2025년)'
                    }
                }
            }
        });

        // 총 매출 변화 막대 차트
        var ctx2 = document.getElementById('salesChart').getContext('2d');
        var salesChart = new Chart(ctx2, {
            type: 'bar',
            data: {
                labels: ['1월', '2월', '3월', '4월', '5월', '6월'],
                datasets: [{
                    label: '총 매출 (₩)',
                    data: [1000000, 1200000, 1300000, 1100000, 1400000, 1500000],
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    title: {
                        display: true,
                        text: '총 매출 변화 (2025년)'
                    }
                }
            }
        });
    </script>
</body>
</html>
