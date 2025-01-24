<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        /* 전체 컨테이너 */
        .container-fluid {
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .main-row {
            display: flex;
            flex: 1;
            overflow: hidden; /* 전체 페이지에서 스크롤이 발생하지 않도록 설정 */
        }

        /* 사이드바 */
        .sidebar {
            background-color: #f8f9fa;
            width: 250px;
            height: 100vh; /* 화면 전체 높이 */
            padding: 20px;
            position: fixed;
            top: 60px; /* 헤더 밑에 배치 */
            left: 0;
            z-index: 100;
            overflow-y: auto; /* 사이드바 내부에 스크롤 추가 */
        }

        /* 사이드바의 스크롤바 숨기기 */
        .sidebar::-webkit-scrollbar {
            width: 0; /* 세로 스크롤바 숨기기 */
            height: 0; /* 가로 스크롤바 숨기기 */
        }

        /* 콘텐츠 영역 */
        .content {
            flex: 1;
            padding: 20px;
            margin-left: 250px; /* 사이드바 너비 만큼 왼쪽 여백 */
            overflow-y: auto; /* 콘텐츠 영역에만 스크롤 */
            height: calc(100vh - 120px); /* 헤더와 푸터 제외한 높이 */
        }

        /* 헤더와 푸터 */
        .header, .footer {
            background-color: #74b243;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: calc(100% - 250px); /* 사이드바만큼 너비 빼기 */
            z-index: 1000;
        }

        .header {
            top: 0;
            left: 250px; /* 사이드바 만큼 왼쪽으로 밀기 */
        }

        .footer {
            bottom: 0;
            left: 250px; /* 사이드바 만큼 왼쪽으로 밀기 */
        }

        /* 콘텐츠 영역 바디 아래쪽 패딩 추가 */
        .main-content {
            padding-top: 80px; /* 헤더와 겹치지 않게 여백 추가 */
            padding-bottom: 40px; /* 푸터와 겹치지 않게 여백 추가 */
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="row">
            <div class="col-12 header">
                <c:choose>
                    <c:when test="${smallHeader}">
                        <%@ include file="smallheader.jsp" %>
                    </c:when>
                    <c:otherwise>
                        <%@ include file="adminheader.jsp" %>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <c:if test="${showHeadermenu}">
            <div class="row">
                <div class="col-15 header">
                    <%@ include file="adminheadermenu.jsp" %>
                </div>
            </div>
        </c:if>
    </header>

    <!-- Main Content -->
    <div class="container-fluid">
        <div class="main-row">
            <c:if test="${showSidebar}">
                <!-- Sidebar -->
                <div class="sidebar">
                    <jsp:include page="${sidebar}" />
                </div>
            </c:if>

            <div class="content">
                <jsp:include page="${body}" />
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="row">
            <div class="col-12 footer">
                <c:choose>
                    <c:when test="${smallFooter}">
                        <%@ include file="smallfooter.jsp" %>
                    </c:when>
                    <c:otherwise>
                        <%@ include file="adminfooter.jsp" %>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </footer>
</body>
</html>
