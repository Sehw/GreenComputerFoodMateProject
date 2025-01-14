<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제수단 관리</title>
<link href="<c:url value="/resources/css/tablepage.css" />" rel="stylesheet">
<style>
		.table-custom {
		    border-top: 2px solid #b5b6b7 !important;
	 	 }
		/* 헤더 배경색 */
	    .table-header {
		  background-color: #f8f9fa;
	      text-align: center;
	      font-weight: bold;
	      min-width: 20%;
	    }
	    .table td:last-child {
		  min-width: 100px; /* 최소 너비 지정 */
		  text-align: center; /* 텍스트 중앙 정렬 */
		}
	    /* 내용 텍스트 정렬 */
	    .table tbody td {
	      vertical-align: middle;
	      text-align: center;
	    }
	    
</style>
</head>
<body>
<div class="container mt-1">
	<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
      		<h5 class="mb-0 fw-bold">결제수단 관리</h5>
    </div>
    	<table class="table table-hover table-custom">
		<thead class="table-header table-secondary">
			<tr>
				<td>별칭</td>
				<td>종류</td>
				<td>수정/삭제</td>
			</tr>
		</thead>
      	<tbody>
      	<tr>
      	  <td>KB체크카드</td>
          <td>
          <img src="${contextPath}/resources/images/kbcard.png" alt="kbcard" class="img-fluid rounded" style="width: 50px; height: 50px; object-fit: cover;">
          국민-0643
          </td>
          <td>
          <div class="d-flex flex-column gap-1">
		    	<button class="btn btn-outline-secondary btn-sm" disabled>수정</button>
		    	<button class="btn btn-outline-secondary btn-sm" disabled>삭제</button>
		  </div>
          </td>
        </tr>
		</tbody>
	</table>
	<div class="text-start mb-1">
		<button class="btn btn-outline-secondary btn-sm" disabled>결제수단 추가</button>
	</div>
</div>
</body>
</html>