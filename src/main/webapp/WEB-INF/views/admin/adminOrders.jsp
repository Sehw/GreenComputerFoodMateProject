<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>결제 내역 관리</title>
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
        border-bottom: 2px solid #ddd;
    }

    .tab-item {
        padding: 10px 20px;
        background-color: #f4f4f4;
        border-radius: 5px 5px 0 0;
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

    /* 결제 내역 테이블 스타일 */
    table {
        width: 100%;
        border-collapse: collapse; /* 경계선 병합 */
        margin-top: 20px;
    }

    th, td {
        padding: 12px 20px;
        text-align: left;
        border-bottom: 1px solid #ddd; /* 하단 경계선 추가 */
    }

    th {
        background-color: #f4f4f4;
        color: #333;
        font-weight: bold;
    }

    td {
        background-color: #ffffff;
        color: #555;
    }

    tr:hover td {
        background-color: #f1f1f1;
    }

    /* 버튼 스타일 */
    .btn {
        padding: 8px 16px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .btn:hover {
        background-color: #0056b3;
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

    /* 탭 콘텐츠 기본 숨김 */
    .tab-pane {
        display: none;
    }

    /* active 클래스를 가진 탭 콘텐츠는 보이도록 설정 */
    .tab-pane.active {
        display: block;
    }
</style>



    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
        <!-- 탭 메뉴 -->
        <div class="tabs">
            <div class="tab-item active" data-tab="paymentHistory">전체 결제 내역</div>
            <div class="tab-item" data-tab="paymentStats">결제 금액 관리</div>
            <div class="tab-item" data-tab="refundManagement">환불 관리</div>
        </div>
        <!-- 검색 기능 -->
        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="검색어를 입력하세요" />
            <select id="searchFilter">
            	<option value="title">사용자 이름</option>
                <option value="title">레시피 제목</option>
                <option value="author">작성자</option>
                <option value="date">등록일</option>
            </select>
            <button onclick="searchRecipes()">검색</button>
        </div>

        <!-- 탭 내용 -->
        <!-- 전체 결제 내역 -->
        <div id="paymentHistory" class="tab-pane active">
            <h2>전체 결제 내역</h2>
            <table>
                <thead>
                    <tr>
                        <th>결제 날짜</th>
                        <th>사용자 이름</th>
                        <th>결제 금액</th>
                        <th>배송 상태</th>
                        <th>상세</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>2025-01-01</td>
                        <td>사용자 1</td>
                        <td>₩100,000</td>
                        <td><button class="btn">구매 확정</button></td>
                        <td><a href="${contextPath}/admin/adminOrderDetail.do">상세 보기</a></td>                        
                    </tr>
                    <tr>
                        <td>2025-01-02</td>
                        <td>사용자 2</td>
                        <td>₩50,000</td>
                        <td><button class="btn">구매 확정</button></td>
                        <td><button class="btn">상세 보기</button></td>
                    </tr>
                    <tr>
                        <td>2025-01-03</td>
                        <td>사용자 3</td>
                        <td>₩150,000</td>
                        <td><button class="btn">배송 중</button></td>
                        <td><button class="btn">상세 보기</button></td>
                    </tr>
                    <tr>
                        <td>2025-01-04</td>
                        <td>사용자 4</td>
                        <td>₩200,000</td>
                        <td><button class="btn">배송 준비 중</button></td>
                        <td><button class="btn">상세 보기</button></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 결제 금액 관리 -->
        <div id="paymentStats" class="tab-pane">
            <h2>결제 금액 관리</h2>
            <table>
                <thead>
                    <tr>
                        <th>기간</th>
                        <th>총 결제 금액</th>
                        <th>결제 건수</th>
                        <th>상세</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>2024-11-01 ~ 2025-11-30</td>
                        <td>₩500,000</td>
                        <td>4건</td>
                        <td><button class="btn">상세 보기</button></td>
                    </tr>
                    <tr>
                        <td>2024-12-01 ~ 2024-12-31</td>
                        <td>₩300,000</td>
                        <td>3건</td>
                        <td><button class="btn">상세 보기</button></td>
                    </tr>
                    <tr>
                        <td>2025-01-01 ~ 2025-01-31</td>
                        <td>₩400,000</td>
                        <td>5건</td>
                        <td><button class="btn">상세 보기</button></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 환불 관리 -->
        <div id="refundManagement" class="tab-pane">
            <h2>환불 관리</h2>
            <table>
                <thead>
                    <tr>
                        <th>환불 요청 날짜</th>
                        <th>사용자 이름</th>
                        <th>환불 금액</th>
                        <th>환불 상태</th>
                        <th>상세</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>2025-01-03</td>
                        <td>사용자 3</td>
                        <td>₩20,000</td>
                        <td>처리 중</td>
                        <td><button class="btn">상세 보기</button></td>
                    </tr>
                    <tr>
                        <td>2025-01-04</td>
                        <td>사용자 4</td>
                        <td>₩30,000</td>
                        <td>완료</td>
                        <td><button class="btn">상세 보기</button></td>
                    </tr>
                    <tr>
                        <td>2025-01-05</td>
                        <td>사용자 5</td>
                        <td>₩15,000</td>
                        <td>대기</td>
                        <td><button class="btn">상세 보기</button></td>
                    </tr>
                </tbody>
            </table>
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
        $(document).ready(function() {
            // 탭 클릭 시 해당 탭으로 이동
            $(".tab-item").on("click", function() {
                var tabId = $(this).data("tab");
                
                // 탭 항목과 탭 내용의 active 클래스를 업데이트
                $(".tab-item").removeClass("active");
                $(this).addClass("active");
                $(".tab-pane").removeClass("active");
                $("#" + tabId).addClass("active");
            });
        });
    </script>
</body>
</html>
