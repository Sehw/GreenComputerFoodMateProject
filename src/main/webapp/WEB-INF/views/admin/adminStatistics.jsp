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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="<c:url value='/resources/css/dashboard.css' />" rel="stylesheet">
    <meta charset="UTF-8">
    <title>관리자 통계 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            margin: 20px;
        }

        /* 탭 스타일 */
        .tabs {
            display: flex;
            cursor: pointer;
            margin-bottom: 20px;
        }
        .tab-item {
            padding: 10px 20px;
            background-color: #f4f4f4;
            border-radius: 5px;
            margin-right: 10px;
            transition: background-color 0.3s;
        }
        .tab-item:hover {
            background-color: #007bff;
            color: #fff;
        }
        .tab-item.active {
            background-color: #007bff;
            color: #fff;
        }

        /* 통계 카드 스타일 */
        .stat-card {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            padding: 15px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .stat-card .info {
            flex-grow: 1;
        }
        .stat-card h5 {
            margin: 0;
            font-size: 18px;
            color: #007bff;
        }
        .stat-card p {
            font-size: 14px;
            color: #555;
        }

        /* 그래프 */
        .chart {
            margin-bottom: 20px;
        }

        /* 차트 크기 조정 */
        .chart canvas {
            width: 50% !important;
            height: 300px !important; /* 차트의 높이를 설정 */
        }

        /* 페이지네이션 */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .pagination a {
            padding: 8px 16px;
            margin: 0 5px;
            background-color: #f4f4f4;
            border-radius: 5px;
            color: #007bff;
            text-decoration: none;
        }
        .pagination a.active {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>관리자 통계 관리</h2>

        <!-- 탭 UI -->
        <div class="tabs">
            <div class="tab-item active" data-tab="general">일반 통계</div>
            <div class="tab-item" data-tab="users">사용자 통계</div>
            <div class="tab-item" data-tab="sales">매출 통계</div>
        </div>

        <!-- 탭 내용 -->
        <div class="tab-content">
            <!-- 일반 통계 -->
            <div id="general" class="tab-pane active">
                <div class="stat-card">
                    <div class="info">
                        <h5>전체 사용자 수</h5>
                        <p>1,200명</p>
                    </div>
                    <div class="info">
                        <h5>전체 게시글 수</h5>
                        <p>500개</p>
                    </div>
                    <div class="info">
                        <h5>전체 댓글 수</h5>
                        <p>2,300개</p>
                    </div>
                </div>

                <!-- 그래프 (예시) -->
                <div class="chart">
                    <h4>일일 방문자 수</h4>
                    <canvas id="visitorChart"></canvas> <!-- 차트 삽입 영역 -->
                </div>
            </div>

            <!-- 사용자 통계 -->
            <div id="users" class="tab-pane">
                <div class="stat-card">
                    <div class="info">
                        <h5>신규 사용자</h5>
                        <p>150명</p>
                    </div>
                    <div class="info">
                        <h5>활성 사용자</h5>
                        <p>1,100명</p>
                    </div>
                    <div class="info">
                        <h5>비활성 사용자</h5>
                        <p>100명</p>
                    </div>
                </div>

                <!-- 그래프 (예시) -->
                <div class="chart">
                    <h4>연령대별 사용자 분포</h4>
                    <canvas id="ageChart"></canvas> <!-- 차트 삽입 영역 -->
                </div>
            </div>

            <!-- 매출 통계 -->
            <div id="sales" class="tab-pane">
                <div class="stat-card">
                    <div class="info">
                        <h5>오늘의 매출</h5>
                        <p>5,000,000원</p>
                    </div>
                    <div class="info">
                        <h5>이번 달 매출</h5>
                        <p>50,000,000원</p>
                    </div>
                    <div class="info">
                        <h5>전체 매출</h5>
                        <p>500,000,000원</p>
                    </div>
                </div>

                <!-- 그래프 (예시) -->
                <div class="chart">
                    <h4>월별 매출 추이</h4>
                    <canvas id="salesChart"></canvas> <!-- 차트 삽입 영역 -->
                </div>
            </div>
        </div>

        <!-- 페이지네이션 
        <div class="pagination">
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">...</a>
            <a href="#">다음</a>
        </div>
        -->
    </div>

    <script>
        // 탭 클릭 시 해당 탭으로 이동
        $(".tab-item").on("click", function() {
            var tabId = $(this).data("tab");
            $(".tab-item").removeClass("active");
            $(this).addClass("active");
            $(".tab-pane").removeClass("active");
            $("#" + tabId).addClass("active");
        });

        // 예시 차트 초기화 (Chart.js 사용 예)
        var ctx = document.getElementById('visitorChart').getContext('2d');
        var visitorChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['1일', '2일', '3일', '4일', '5일'],
                datasets: [{
                    label: '방문자 수',
                    data: [200, 300, 250, 450, 500],
                    borderColor: '#007bff',
                    fill: false
                }]
            }
        });

        var ageCtx = document.getElementById('ageChart').getContext('2d');
        var ageChart = new Chart(ageCtx, {
            type: 'pie',
            data: {
                labels: ['10대', '20대', '30대', '40대', '50대 이상'],
                datasets: [{
                    label: '연령대 분포',
                    data: [15, 35, 25, 10, 15],
                    backgroundColor: ['#ff6384', '#36a2eb', '#cc65fe', '#ffce56', '#ff9f40']
                }]
            }
        });

        var salesCtx = document.getElementById('salesChart').getContext('2d');
        var salesChart = new Chart(salesCtx, {
            type: 'bar',
            data: {
                labels: ['1월', '2월', '3월', '4월', '5월'],
                datasets: [{
                    label: '매출',
                    data: [1000000, 2000000, 1500000, 3000000, 2500000],
                    backgroundColor: '#36a2eb'
                }]
            }
        });
    </script>
</body>
</html>
