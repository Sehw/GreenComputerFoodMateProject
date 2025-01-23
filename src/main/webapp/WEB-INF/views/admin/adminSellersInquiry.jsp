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
    <title>판매자 문의</title>
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

        /* 이미지 썸네일 */
        .thumbnail {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
        }

        /* 버튼 스타일 */
        .btn {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: #fff;
        }
        .btn-details {
            background-color: #007bff;
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
        <h2>판매자 문의</h2>

        <!-- 탭 UI -->
        <div class="tabs">
            <div class="tab-item active" data-tab="registration">상품 등록 요청</div>
            <div class="tab-item" data-tab="modification">상품 수정 요청</div>
        </div>

		<!-- 검색 기능 -->
        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="검색어를 입력하세요" />
            <select id="searchFilter">
            	<option value="title">판매자</option>
                <option value="title">레시피 제목</option>
                <option value="author">작성자</option>
                <option value="date">등록일</option>
            </select>
            <button onclick="searchRecipes()">검색</button>
        </div>
		
        <!-- 탭 내용 -->
        <div class="tab-content">
            <!-- 상품 등록 요청 -->
            <div id="registration" class="tab-pane active">
                <table class="report-list">
                    <thead>
                        <tr>
                            <th>썸네일</th>
                            <th>상품명</th>
                            <th>판매자</th>
                            <th>요청 내용</th>
                            <th>요청일</th>
                            <th>상태</th>
                            <th>상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example1.png" class="thumbnail" alt="상품1"></td>
                            <td>앞다리 300g</td>
                            <td>판매자 A</td>
                            <td>새 상품 등록 신청</td>
                            <td>2025-01-10</td>
                            <td>승인 대기</td>
                            <td><a href="${contextPath}/admin/adminSellerInquiryDetail.do">상세보기</a></td>
                        </tr>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example1.png" class="thumbnail" alt="상품2"></td>
                            <td>콩나물</td>
                            <td>판매자 B</td>
                            <td>새 상품 등록</td>
                            <td>2025-01-11</td>
                            <td>승인 대기</td>
                            <td><button class="btn btn-detail" onclick="showDetails('registration', 2)">상세보기</button></td>
                        </tr>
                        <!-- 추가적인 상품 등록 요청들 -->
                    </tbody>
                </table>
            </div>

            <!-- 상품 수정 요청 -->
            <div id="modification" class="tab-pane">
                <table class="report-list">
                    <thead>
                        <tr>
                            <th>썸네일</th>
                            <th>상품명</th>
                            <th>판매자</th>
                            <th>수정 내용</th>
                            <th>요청일</th>
                            <th>상태</th>
                            <th>상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example1.png" class="thumbnail" alt="상품3"></td>
                            <td>칸예 고사리</td>
                            <td>칸예</td>
                            <td>가격 수정 요청</td>
                            <td>2025-01-12</td>
                            <td>승인 대기</td>
                            <td><a href="${contextPath}/admin/adminSellerInquiryDetail.do">상세보기</a></td>
                        </tr>
                        <tr>
                            <td><img src="${contextPath}/resources/images/example1.png" class="thumbnail" alt="상품4"></td>
                            <td>이승우 돼지불백</td>
                            <td>후전드</td>
                            <td>설명 수정 요청</td>
                            <td>2025-01-13</td>
                            <td>승인 대기</td>
                            <td><button class="btn btn-detail" onclick="showDetails('modification', 2)">상세보기</button></td>
                        </tr>
                        <!-- 추가적인 상품 수정 요청들 -->
                    </tbody>
                </table>
            </div>
        </div>

        <!-- 페이지네이션 -->
        <div class="pagination">
            <a href="#" class="active">1</a>
            <a href="${contextPath}/admin/adminSellerInquiryDetail.do">2</a>
            <a href="#">3</a>
            <a href="#">...</a>
            <a href="#">다음</a>
        </div>
    </div>

    <!-- 상세보기 모달 -->
    <div id="detailsModal" style="display:none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 80%; background: white; border: 2px solid #ddd; padding: 20px; z-index: 1000;">
        <h3 id="modalTitle"></h3>
        <p id="modalContent"></p>
        <button onclick="closeModal()">닫기</button>
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
