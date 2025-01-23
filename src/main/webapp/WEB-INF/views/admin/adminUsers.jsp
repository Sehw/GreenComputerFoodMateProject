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
    <title>사용자 관리</title>
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
            background-color: #f4f4f4;
            color: #333;
            font-weight: bold;
            border-top: 2px solid #ddd;
        }

        /* 표 본문 부분 스타일 */
        .report-list td {
            background-color: #ffffff;
            border-top: 1px solid #ddd;
            color: #555;
        }

        /* 마우스 오버 시 색상 변경 */
        .report-list tr:hover td {
            background-color: #f1f1f1;
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
        <h2>사용자 관리</h2>

        <!-- 탭 UI -->
        <div class="tabs">
        
            <div class="tab-item" data-tab="all">전체 사용자</div> <!-- 전체 사용자 탭 추가 -->
            <div class="tab-item active" data-tab="active">활동 중인 사용자</div>
            <div class="tab-item" data-tab="withdrawal">탈퇴 신청 사용자</div>
            <div class="tab-item" data-tab="inactive">휴면 상태 사용자</div>
        </div>
        
        <!-- 검색 기능 -->
        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="검색어를 입력하세요" />
            <select id="searchFilter">
            	<option value="title">이름</option>
                <option value="title">레시피 제목</option>
                <option value="author">작성자</option>
                <option value="date">등록일</option>
            </select>
            <button onclick="searchRecipes()">검색</button>
        </div>

        <!-- 탭 내용 -->
        <div class="tab-content">
            <!-- 활동 중인 사용자 -->
            <div id="active" class="tab-pane active">
                <table class="report-list">
                    <thead>
                        <tr>
                            <th>이미지</th>
                            <th>사용자 이름</th>
                            <th>이메일</th>
                            <th>상태</th>
                            <th>가입일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example1.png" alt="사용자 1" width="100" height="100" style="object-fit: cover; border-radius: 8px;"></td>
                            <td><a href="${contextPath}/admin/adminUserDetail.do">사용자 1</a></td>
                            <td>user1@example.com</td>
                            <td>활동 중</td>
                            <td>2025-01-01</td>
                        </tr>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example1.png" alt="사용자 2" width="100" height="100" style="object-fit: cover; border-radius: 8px;"></td>
                            <td><a href="#">사용자 2</a></td>
                            <td>user2@example.com</td>
                            <td>활동 중</td>
                            <td>2025-01-02</td>
                        </tr>
                        <!-- 추가적인 활동 중인 사용자 카드들 -->
                    </tbody>
                </table>
            </div>

            <!-- 탈퇴 신청 사용자 -->
            <div id="withdrawal" class="tab-pane">
                <table class="report-list">
                    <thead>
                        <tr>
                            <th>이미지</th>
                            <th>사용자 이름</th>
                            <th>이메일</th>
                            <th>상태</th>
                            <th>가입일</th>
                            <th>액션</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example1.png" alt="사용자 A" width="100" height="100" style="object-fit: cover; border-radius: 8px;"></td>
                            <td><a href="#">사용자 A</a></td>
                            <td>userA@example.com</td>
                            <td>탈퇴 신청</td>
                            <td>2025-01-03</td>
                            <td><button class="btn btn-danger">탈퇴 처리</button></td>
                        </tr>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example1.png" alt="사용자 B" width="100" height="100" style="object-fit: cover; border-radius: 8px;"></td>
                            <td><a href="#">사용자 B</a></td>
                            <td>userB@example.com</td>
                            <td>탈퇴 신청</td>
                            <td>2025-01-04</td>
                            <td><button class="btn btn-danger">탈퇴 처리</button></td>
                        </tr>
                        <!-- 추가적인 탈퇴 신청 사용자 카드들 -->
                    </tbody>
                </table>
            </div>

            <!-- 휴면 상태 사용자 -->
            <div id="inactive" class="tab-pane">
                <table class="report-list">
                    <thead>
                        <tr>
                            <th>이미지</th>
                            <th>사용자 이름</th>
                            <th>이메일</th>
                            <th>상태</th>
                            <th>가입일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example1.png" alt="사용자 X" width="100" height="100" style="object-fit: cover; border-radius: 8px;"></td>
                            <td><a href="#">사용자 X</a></td>
                            <td>userX@example.com</td>
                            <td>휴면</td>
                            <td>2025-01-05</td>
                        </tr>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example1.png" alt="사용자 Y" width="100" height="100" style="object-fit: cover; border-radius: 8px;"></td>
                            <td><a href="#">사용자 Y</a></td>
                            <td>userY@example.com</td>
                            <td>휴면</td>
                            <td>2025-01-06</td>
                        </tr>
                        <!-- 추가적인 휴면 상태 사용자 카드들 -->
                    </tbody>
                </table>
            </div>

            <!-- 전체 사용자 -->
            <div id="all" class="tab-pane">
                <table class="report-list">
                    <thead>
                        <tr>
                            <th>이미지</th>
                            <th>사용자 이름</th>
                            <th>이메일</th>
                            <th>상태</th>
                            <th>가입일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example1.png" alt="사용자 1" width="100" height="100" style="object-fit: cover; border-radius: 8px;"></td>
                            <td><a href="#">사용자 1</a></td>
                            <td>user1@example.com</td>
                            <td>활동 중</td>
                            <td>2025-01-01</td>
                        </tr>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example1.png" alt="사용자 A" width="100" height="100" style="object-fit: cover; border-radius: 8px;"></td>
                            <td><a href="#">사용자 A</a></td>
                            <td>userA@example.com</td>
                            <td>탈퇴 신청</td>
                            <td>2025-01-03</td>
                        </tr>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example1.png" alt="사용자 X" width="100" height="100" style="object-fit: cover; border-radius: 8px;"></td>
                            <td><a href="#">사용자 X</a></td>
                            <td>userX@example.com</td>
                            <td>휴면</td>
                            <td>2025-01-05</td>
                        </tr>
                        <!-- 추가적인 전체 사용자 카드들 -->
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
