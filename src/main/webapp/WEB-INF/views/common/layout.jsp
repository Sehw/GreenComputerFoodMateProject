<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>${title}</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<style>
        .header, .footer {
            background-color: #ffffff;
            color: white;
            text-align: center;
            padding: 10px;
            flex-shrink: 0; /* 푸터 크기가 줄어들지 않음 */
        }
</style>
<header>
	<div class="row">
            <div class="col-12 header">
            <c:choose>
	            <c:when test="${smallHeader}">
	            	<%@ include file="header_small.jsp" %>
	            </c:when>
	            <c:otherwise>
                	<%@ include file="header.jsp" %>
                </c:otherwise>
            </c:choose>
            </div>
     </div>
</header>
<body>

	<nav>
		<c:if test="${showNavbar}">
			<%@ include file="navbar.jsp" %>
		</c:if>
	</nav>
	<div class="row">
		<aside class="col-md-2">
			<c:if test="${showSidebar}">
            	<!-- Sidebar -->
	            <jsp:include page="${sidebar}" />
            </c:if>
		</aside>
	            
		<c:choose>
            <c:when test="${showSidebar}">
            	<main class="col-md-9 content">
            		<jsp:include page="${body}" />   
            	</main>
            </c:when>
            <c:otherwise>
            	<main class="col-md-12 content">
            		<jsp:include page="${body}" />   
            	</main>
            </c:otherwise>
         </c:choose>
	</div>

<footer>
	<c:choose>
		<c:when test="${smallFooter }">
			<%@ include file="footer_small.jsp" %>
		</c:when>
		<c:otherwise>
			<%@ include file="footer.jsp" %>
		</c:otherwise>
	</c:choose>
</footer>

</body>
</html>