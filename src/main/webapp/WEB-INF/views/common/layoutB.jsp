<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
</head>
<body>

<header>
	<c:choose>
		<c:when test="${smallHeader}">
		<%@ include file="smallheader.jsp" %>
		</c:when>
		<c:otherwise>
		<%@ include file="header.jsp" %>
		</c:otherwise>
	</c:choose>
</header>

<nav>
	<c:if test="${showNavbar}">
		<%@ include file="navbar.jsp" %>
	</c:if>
</nav>

<aside>
	<c:if test="${showSidebar}">
		<jsp:include page="${sidebar}" />
	</c:if>
</aside>
            
<main>
	<jsp:include page="${body}" />            
</main>

<footer>
<c:choose>
	<c:when test="${smallFooter }">
		<%@ include file="smallfooter.jsp" %>
	</c:when>
	<c:otherwise>
		<%@ include file="footer.jsp" %>
	</c:otherwise>
</c:choose>
</footer>

</body>
</html>