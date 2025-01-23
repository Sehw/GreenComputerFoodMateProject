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
    <title>상품 관리</title>
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
        
         /* 검색창 스타일 */
        .search-bar {
            display: flex;
            margin-bottom: 20px;
        }
        .search-bar input {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            flex: 1;
        }
        .search-bar select {
            padding: 8px 12px;
            margin-left: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .search-bar button {
            padding: 8px 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            margin-left: 10px;
            cursor: pointer;
        }
        .search-bar button:hover {
            background-color: #0056b3;
        }

        /* 표 스타일 */
        .report-list {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .report-list th,
        .report-list td {
            padding: 12px 20px;
            text-align: left;
        }

        /* 표 제목(헤더) 부분 스타일 */
        .report-list th {
            background-color: #f4f4f4;  /* 상단 제목은 회색 */
            color: #333;
            font-weight: bold;
            border-top: 2px solid #ddd;
        }

        /* 표 본문 부분 스타일 */
        .report-list td {
            background-color: #ffffff;  /* 본문은 흰색 */
            border-top: 1px solid #ddd;
            color: #555;
        }        

        /* 마우스 오버 시 색상 변경 */
        .report-list tr:hover td {
            background-color: #f1f1f1;
        }

        /* 버튼 스타일 */
        .btn-detail {
            color: #007bff;
            text-decoration: none;
        }
        .btn-detail:hover {
            text-decoration: underline;
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
        
        /* 테이블 본문에 마지막 행 밑줄 추가 */
        .report-list tr:last-child td {
            border-bottom: 1px solid #ddd; /* 마지막 행에만 밑줄 추가 */
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>상품 관리</h2>

        <!-- 탭 UI -->
        <div class="tabs">
            <div class="tab-item active" data-tab="selling">판매 중인 상품</div>
            <div class="tab-item" data-tab="unapproved">신고 처리 상품</div>
            <div class="tab-item" data-tab="stopped">판매 중지 상품</div>
        </div>
        
        <!-- 검색 기능 -->
        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="검색어를 입력하세요" />
            <select id="searchFilter">
            	<option value="title">상품명 + 판매자</option>
                <option value="title">상품명</option>
                <option value="author">판매자</option>
                <option value="date">등록일</option>
            </select>
            <button onclick="searchRecipes()">검색</button>
        </div>

        <!-- 탭 내용 -->
        <div class="tab-content">
            <!-- 판매 중인 상품 -->
            <div id="selling" class="tab-pane active">
                <h3>판매 중인 상품</h3>
                <table class="report-list">
                    <thead>
                        <tr>
                            <th>이미지</th>
                            <th>상품명</th>
                            <th>판매자</th>
                            <th>가격</th>
                            <th>별점</th>
                            <th>재고</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example.png" alt="상품 1" style="width: 100px; height: 100px;object-fit: cover;
            border-radius: 5px;"></td>
                            <td><a href="#" class="btn-detail">상품 1</a></td>
                            <td>회사 A</td>
                            <td>50,000원</td>
                            <td>4.5</td>
                            <td>20개</td>
                            <td>2025-01-01</td>
                        </tr>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example.png" alt="상품 2" style="width: 100px; height: 100px;object-fit: cover;
            border-radius: 5px;"></td>
                            <td><a href="#" class="btn-detail">상품 2</a></td>
                            <td>회사 B</td>
                            <td>35,000원</td>
                            <td>4.0</td>
                            <td>50개</td>
                            <td>2025-01-02</td>
                        </tr>
                        <!-- 추가 상품 카드들... -->
                    </tbody>
                </table>
            </div>

            <!-- 미승인 상품 -->
            <div id="unapproved" class="tab-pane">
                <h3>신고 처리 중 상품</h3>
                <table class="report-list">
                    <thead>
                        <tr>
                            <th>이미지</th>
                            <th>상품명</th>
                            <th>판매자</th>
                            <th>가격</th>
                            <th>신청일</th>
                            <th>처리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example.png" alt="상품 A" style="width: 100px; height: 100px;object-fit: cover;
            border-radius: 5px;"></td>
                            <td><a href="#" class="btn-detail">상품 A</a></td>
                            <td>회사 A</td>
                            <td>10,000원</td>
                            <td>2025-01-10</td>
                            <td><button class="btn btn-primary">처리</button></td>
                        </tr>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example.png" alt="상품 B" style="width: 100px; height: 100px;object-fit: cover;
            border-radius: 5px;"></td>
                            <td><a href="#" class="btn-detail">상품 B</a></td>
                            <td>회사 B</td>
                            <td>30,000원</td>
                            <td>2025-01-10</td>
                            <td><button class="btn btn-primary">처리</button></td>
                        </tr>
                        <!-- 추가 미승인 상품 카드들... -->
                    </tbody>
                </table>
            </div>

            <!-- 판매 중지 상품 -->
            <div id="stopped" class="tab-pane">
                <h3>판매 중지 상품</h3>
                <table class="report-list">
                    <thead>
                        <tr>
                            <th>이미지</th>
                            <th>상품명</th>
                            <th>판매자</th>
                            <th>가격</th>
                            <th>등록일</th>
                            <th>판매 재개</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example.png" alt="상품 X" style="width: 100px; height: 100px;object-fit: cover;
            border-radius: 5px;"></td>
                            <td><a href="#" class="btn-detail">상품 X</a></td>
                            <td>회사 X</td>
                            <td>90,000원</td>
                            <td>2025-01-10</td>
                            <td><button class="btn btn-warning">판매 재개</button></td>
                        </tr>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example.png" alt="상품 Y" style="width: 100px; height: 100px;object-fit: cover;
            border-radius: 5px;"></td>
                            <td><a href="#" class="btn-detail">상품 Y</a></td>
                            <td>칸예</td>
                            <td>189,000원</td>
                            <td>2025-01-10</td>
                            <td><button class="btn btn-warning">판매 재개</button></td>
                        </tr>
                        <!-- 추가 판매 중지 상품 카드들... -->
                    </tbody>
                </table>
            </div>
        </div>

        <!-- 페이지네이션 -->
        <div class="pagination">
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">...</a>
            <a href="#">다음</a>
        </div>
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
    </script>
</body>
</html>
