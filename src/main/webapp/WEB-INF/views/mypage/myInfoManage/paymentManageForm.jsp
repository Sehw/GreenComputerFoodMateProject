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
<link href="<c:url value="/resources/css/modal.css" />" rel="stylesheet">
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
	    	table.table2 {
			    border-collapse: collapse;
			    width: 100%;
			    text-align: left;
			    line-height: 1.5;
			    margin: 20px 0;
			    border-top: 2px solid #333;
			    border-bottom: 2px solid #ccc;
			}
			
			table.table2 tr {
			    border-bottom: 1px solid #ccc;
			}
			
			table.table2 td {
			    padding: 10px;
			    vertical-align: middle;
			    font-size: 14px;
			}
		.modal_body{
			width:600px;
		}
	    
</style>
<script>
	document.addEventListener("DOMContentLoaded", () => {
	    const modal = document.querySelector('.modal');
	    const btnOpenModal = document.querySelector('.btn-open-modal');
	    const btnCloseModal = document.querySelector('.btn-close-modal');
	
	    btnOpenModal.addEventListener("click", () => {
	        modal.style.display = "flex";
	    });
	    
	    btnCloseModal.addEventListener("click", () => {
	        modal.style.display = "none";
	    });
	});
</script>
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
		<button class="btn btn-outline-secondary btn-sm btn-open-modal">결제수단 추가</button>
	</div>
	<div class="modal">
		<div class="modal_body">
			<div class="container mt-1">
				<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
			      		<h5 class="mb-0 fw-bold">결제 수단 관리</h5>
			    </div>
			  	<p class="mb-3">결제수단 추가</p>
			  	<table class="table2">
					<tr>
				        <td>카드 이름</td>
				        <td>
				        	<div class="col-sm-3 mb-1">
				        		<input type="text" class="form-control" name="cardname" size="10" required>
				        	</div>
				        </td>
				    </tr>
				    <tr>
				        <td>카드 번호</td>
				        <td>
				        	<div class="row">
					        	<div class="col-sm-3 mb-1">
					        		<input type="text" class="form-control" name="cardNumber" maxlength="4" size="10" required>
					        	</div>
					        	<div class="col-sm-3 mb-1">
					        		<input type="text" class="form-control" name="cardNumber" maxlength="4" size="10" required>
					        	</div>
					        	<div class="col-sm-3 mb-1">
					        		<input type="text" class="form-control" name="cardNumber" maxlength="4" size="10" required>
					        	</div>
					        	<div class="col-sm-3 mb-1">
					        		<input type="text" class="form-control" name="cardNumber" maxlength="4" size="10" required>
					        	</div>
					        </div>
				        </td>
				    </tr>
				    <tr>
				        <td>유효기간 (MM/YY)</td>
				        <td>
				        	<div class="col-sm-3 mb-1">
				        		<input type="text" class="form-control" name="phone" size="40">
				        	</div>
				        </td>
				    </tr>
				    <tr>
				        <td>CVV</td>
				        <td>
				        	<div class="col-sm-3 mb-1">
				        		<input type="text" class="form-control" name="iphone" size="40">
				        	</div>
				        </td>
				    </tr>
				</table>
			  	<div class="d-flex justify-content-center gap-2">
			  		<button type="submit" class="btn btn-success">저장</button>
	                <button type="reset" class="btn btn-outline-secondary btn-close-modal">취소</button>
	            </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>