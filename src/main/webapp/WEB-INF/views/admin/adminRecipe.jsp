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

        /* 이미지 크기 조정 */
        .recipe-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>레시피 관리</h2>

        <!-- 탭 UI -->
        <div class="tabs">
            <div class="tab-item active" data-tab="registered">등록된 레시피</div>
            <div class="tab-item" data-tab="unapproved">신고 처리 레시피</div>
        </div>
        <!-- 검색 기능 -->
        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="검색어를 입력하세요" />
            <select id="searchFilter">
            	<option value="title">레시피 제목 + 작성자</option>
                <option value="title">레시피 제목</option>
                <option value="author">작성자</option>
                <option value="date">등록일</option>
            </select>
            <button onclick="searchRecipes()">검색</button>
        </div>

        <!-- 탭 내용 -->
        <div class="tab-content">
            <!-- 등록된 레시피 -->
            <div id="registered" class="tab-pane active">
                <table class="report-list">
                    <thead>
                        <tr>
                            <th>이미지</th>
                            <th>레시피 제목</th>
                            <th>작성자</th>
                            <th>조회수</th>
                            <th>별점</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipe1.jpg' />" alt="레시피1" class="recipe-image"></td>
                            <td><a href="${contextPath}/admin/adminRecipeDetail.do" class="btn-detail">레시피 1</a></td>
                            <td>홍길동</td>
                            <td>150</td>
                            <td>4.5</td>
                            <td>2025-01-01</td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipe2.jpg' />" alt="레시피2" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 2</a></td>
                            <td>김유진</td>
                            <td>120</td>
                            <td>4.0</td>
                            <td>2025-01-02</td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipe3.jpg' />" alt="레시피3" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 3</a></td>
                            <td>이수연</td>
                            <td>180</td>
                            <td>4.8</td>
                            <td>2025-01-03</td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipe4.jpg' />" alt="레시피4" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 4</a></td>
                            <td>김태호</td>
                            <td>200</td>
                            <td>4.2</td>
                            <td>2025-01-04</td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipe5.jpg' />" alt="레시피5" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 5</a></td>
                            <td>박지민</td>
                            <td>230</td>
                            <td>4.6</td>
                            <td>2025-01-05</td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipe6.jpg' />" alt="레시피6" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 6</a></td>
                            <td>김은수</td>
                            <td>160</td>
                            <td>4.3</td>
                            <td>2025-01-06</td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipe7.jpg' />" alt="레시피7" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 7</a></td>
                            <td>오민지</td>
                            <td>140</td>
                            <td>4.1</td>
                            <td>2025-01-07</td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipe8.jpg' />" alt="레시피8" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 8</a></td>
                            <td>윤서영</td>
                            <td>110</td>
                            <td>4.4</td>
                            <td>2025-01-08</td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipe9.jpg' />" alt="레시피9" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 9</a></td>
                            <td>송하은</td>
                            <td>210</td>
                            <td>4.7</td>
                            <td>2025-01-09</td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipe10.jpg' />" alt="레시피10" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 10</a></td>
                            <td>정유정</td>
                            <td>250</td>
                            <td>4.9</td>
                            <td>2025-01-10</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- 미처리 레시피 -->
            <div id="unapproved" class="tab-pane">
                <table class="report-list">
                    <thead>
                        <tr>
                            <th>이미지</th>
                            <th>레시피 제목</th>
                            <th>작성자</th>
                            <th>조회수</th>
                            <th>별점</th>
                            <th>등록일</th>
                            <th>처리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipeA.jpg' />" alt="레시피A" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 A</a></td>
                            <td>박세영</td>
                            <td>80</td>
                            <td>3.8</td>
                            <td>2025-01-03</td>
                            <td><button class="btn btn-primary">처리</button></td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipeB.jpg' />" alt="레시피B" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 B</a></td>
                            <td>김태호</td>
                            <td>200</td>
                            <td>4.8</td>
                            <td>2025-01-04</td>
                            <td><button class="btn btn-primary">처리</button></td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipeC.jpg' />" alt="레시피C" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 C</a></td>
                            <td>오지은</td>
                            <td>130</td>
                            <td>4.2</td>
                            <td>2025-01-05</td>
                            <td><button class="btn btn-primary">처리</button></td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipeD.jpg' />" alt="레시피D" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 D</a></td>
                            <td>박소연</td>
                            <td>90</td>
                            <td>3.9</td>
                            <td>2025-01-06</td>
                            <td><button class="btn btn-primary">처리</button></td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipeE.jpg' />" alt="레시피E" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 E</a></td>
                            <td>최윤정</td>
                            <td>95</td>
                            <td>4.3</td>
                            <td>2025-01-07</td>
                            <td><button class="btn btn-primary">처리</button></td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipeF.jpg' />" alt="레시피F" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 F</a></td>
                            <td>송지민</td>
                            <td>120</td>
                            <td>4.4</td>
                            <td>2025-01-08</td>
                            <td><button class="btn btn-primary">처리</button></td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipeG.png' />" alt="레시피G" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 G</a></td>
                            <td>김유진</td>
                            <td>110</td>
                            <td>4.6</td>
                            <td>2025-01-09</td>
                            <td><button class="btn btn-primary">처리</button></td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipeH.jpg' />" alt="레시피H" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 H</a></td>
                            <td>박수연</td>
                            <td>105</td>
                            <td>4.1</td>
                            <td>2025-01-10</td>
                            <td><button class="btn btn-primary">처리</button></td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipeI.jpg' />" alt="레시피I" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 I</a></td>
                            <td>정지민</td>
                            <td>95</td>
                            <td>4.2</td>
                            <td>2025-01-11</td>
                            <td><button class="btn btn-primary">처리</button></td>
                        </tr>
                        <tr>
                            <td><img src="<c:url value='/resources/images/recipeJ.jpg' />" alt="레시피J" class="recipe-image"></td>
                            <td><a href="#" class="btn-detail">레시피 J</a></td>
                            <td>임지은</td>
                            <td>80</td>
                            <td>3.9</td>
                            <td>2025-01-12</td>
                            <td><button class="btn btn-primary">처리</button></td>
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
