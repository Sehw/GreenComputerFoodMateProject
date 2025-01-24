<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${title}</title>
<style>
		html, body {
		        height: 100%;
		        margin: 0;
		    }
        .sidebar {
            background-color: #f8f9fa;
            height: 100vh; /* 화면 높이 */
            padding: 20px;
        }
        .content {
        	flex: 1; /* 남은 공간을 채움 */
            padding: 20px;
        }
        .header, .footer {
            background-color: #ffffff;
            color: white;
            text-align: center;
            padding: 10px;
            flex-shrink: 0; /* 푸터 크기가 줄어들지 않음 */
        }
    </style>
</head>
<header>
<!-- Header -->
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
	           <%@ include file="adminheadermenu.jsp" %>
	        </div>
	    </c:if>
</header>
<body>
    <div class="container-fluid">
        
        <div class="row">
            <c:if test="${showSidebar}">
            	<!-- Sidebar -->
	            <div class="col-md-2 sidebar">
	            	<jsp:include page="${sidebar}" />
	            </div>
            </c:if>
            <!-- Main Content -->
            <c:choose>
            	<c:when test="${showSidebar}">
            		<div class="col-md-9 content">
            	</c:when>
            	<c:otherwise>
            		<div class="col-md-12 content">
            	</c:otherwise>
            </c:choose>
                <jsp:include page="${body}" />
            </div>
        </div>
    </div>
</body>
<footer>
        <!-- Footer -->
        <div class="row">
	    	<div class="col-12 footer">
	        <c:choose>
        		<c:when test="${smallFooter }">
	                <%@ include file="smallfooter.jsp" %>
	            </c:when>
	            <c:otherwise>
	            	<%@ include file="footer.jsp" %>
	            </c:otherwise>
        	</c:choose>
	        </div>
        </div>
</footer>
</html>