<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${title}</title>
<style>
        .sidebar {
            background-color: #f8f9fa;
            height: 100vh; /* 화면 높이 */
            padding: 20px;
        }
        .content {
            padding: 20px;
        }
        .header, .footer {
            background-color: #74b243;
            color: white;
            text-align: center;
            padding: 10px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <!-- Header -->
        <div class="row">
            <div class="col-12 header">
                <%@ include file="header.jsp" %>
            </div>
        </div>
        <div class="row">
            <!-- Main Content -->
            <div class="col-md-9 content">
                <jsp:include page="${body}" />
            </div>
        </div>
        <!-- Footer -->
        <div class="row">
            <div class="col-12 footer">
                <%@ include file="footer.jsp" %>
            </div>
        </div>
    </div>
</body>
</html>