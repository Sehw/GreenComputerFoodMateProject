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
    <meta charset="UTF-8">
    <title>유저 문의 관리</title>
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
        <h2>유저 문의 관리</h2>

        <!-- 탭 UI -->
        <div class="tabs">
            <div class="tab-item active" data-tab="userReport">사용자 신고</div>
            <div class="tab-item" data-tab="recipeReport">레시피 작성글 신고</div>
            <div class="tab-item" data-tab="productReport">상품 신고</div>
            <div class="tab-item" data-tab="sellerReport">상품 판매자 신고</div>
            <div class="tab-item" data-tab="commentReport">댓글 신고</div>
            <div class="tab-item" data-tab="inquiry">1대1 문의</div>
        </div>
		
		<!-- 검색 기능 -->
        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="검색어를 입력하세요" />
            <select id="searchFilter">
            	<option value="title">신고자</option>
                <option value="title">레시피 제목</option>
                <option value="author">작성자</option>
                <option value="date">등록일</option>
            </select>
            <button onclick="searchRecipes()">검색</button>
        </div>
        
        <!-- 탭 내용 -->
        <div class="tab-content">
            <!-- 사용자 신고 -->
            <div id="userReport" class="tab-pane active">
                <h3>사용자 신고</h3>
                <table class="report-list">
                    <thead>
                        <tr>
                            <th>신고일</th>
                            <th>신고자</th>
                            <th>신고 대상</th>
                            <th>신고 항목</th>
                            <th>상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2025-01-10</td>
                            <td>김철수</td>
                            <td>사용자 A</td>
                            <td>댓글 신고</td>
                            <td><a href="${contextPath}/admin/adminInquiryDetail.do" class="btn-detail">상세보기</a></td>
                        </tr>
                        <tr>
                            <td>2025-01-11</td>
                            <td>이영희</td>
                            <td>사용자 B</td>
                            <td>레시피 신고</td>
                            <td><a href="${contextPath}/inquiry/detail?id=1" class="btn-detail">상세보기</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 레시피 작성글 신고 -->
            <div id="recipeReport" class="tab-pane">
                <h3>레시피 작성글 신고</h3>
                <table class="report-list">
                    <thead>
                        <tr>
                            <th>신고일</th>
                            <th>신고자</th>
                            <th>레시피 제목</th>
                            <th>신고 내용</th>
                            <th>신고 당한 사용자</th>
                            <th>상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2025-01-08</td>
                            <td>최정은</td>
                            <td>레시피 A</td>
                            <td>허위 정보 포함</td>
                            <td>박서준</td>
                            <td><a href="${contextPath}/report/recipeDetail?id=1" class="btn-detail">상세보기</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 상품 신고 -->
            <div id="productReport" class="tab-pane">
                <h3>상품 신고</h3>
                <table class="report-list">
                    <thead>
                        <tr>
                            <th>신고일</th>
                            <th>신고자</th>
                            <th>상품명</th>
                            <th>신고 내용</th>
                            <th>신고 당한 판매자</th>
                            <th>상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2025-01-09</td>
                            <td>박민영</td>
                            <td>상품 A</td>
                            <td>가짜 상품</td>
                            <td>판매자 A</td>
                            <td><a href="${contextPath}/report/productDetail?id=1" class="btn-detail">상세보기</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 상품 판매자 신고 -->
            <div id="sellerReport" class="tab-pane">
                <h3>상품 판매자 신고</h3>
                <table class="report-list">
                    <thead>
                        <tr>
                            <th>신고일</th>
                            <th>신고자</th>
                            <th>상품 판매자</th>
                            <th>신고 내용</th>
                            <th>상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2025-01-07</td>
                            <td>장미진</td>
                            <td>판매자 B</td>
                            <td>판매자 규정 위반</td>
                            <td><a href="${contextPath}/report/sellerDetail?id=1" class="btn-detail">상세보기</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 댓글 신고 -->
            <div id="commentReport" class="tab-pane">
                <h3>댓글 신고</h3>
                <table class="report-list">
                    <thead>
                        <tr>
                            <th>신고일</th>
                            <th>신고자</th>
                            <th>레시피 제목</th>
                            <th>신고 내용</th>
                            <th>신고 당한 사용자</th>
                            <th>상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2025-01-06</td>
                            <td>이소연</td>
                            <td>레시피 A</td>
                            <td>비방 글</td>
                            <td>장동민</td>
                            <td><a href="${contextPath}/report/commentDetail?id=1" class="btn-detail">상세보기</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 1대1 문의 -->
            <div id="inquiry" class="tab-pane">
                <h3>1대1 문의</h3>
                <table class="report-list">
                    <thead>
                        <tr>
                            <th>문의일</th>
                            <th>문의자</th>
                            <th>문의 내용</th>
                            <th>상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2025-01-05</td>
                            <td>송지민</td>
                            <td>결제 문제</td>
                            <td><a href="${contextPath}/inquiry/detail?id=1" class="btn-detail">상세보기</a></td>
                        </tr>
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
