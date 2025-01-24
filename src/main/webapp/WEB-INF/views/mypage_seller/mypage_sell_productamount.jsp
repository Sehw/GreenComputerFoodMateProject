<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고관리</title>
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
    th:first-child, td:first-child {
        width: 5%; /* 체크박스 열의 폭 */
    }
    /* 공개여부 일괄변경 버튼 스타일 */
    .batch-change-btn {
        float: right;
        margin-bottom: 15px;
        padding: 10px 15px;
        font-size: 1rem;
        color: white;
        background-color: #007bff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .batch-change-btn:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="container mt-1">
    <div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
        <h5 class="mt-2 mb-0 fw-bold">상품 재고관리/공개설정</h5>
    </div>
    
    <!-- 공개여부 일괄변경 버튼 -->
    <div>
        <button class="batch-change-btn">공개여부 일괄변경</button>
    </div>
    
    <table class="table table-hover table-custom">
        <thead class="table-header table-secondary">
            <tr>
                <th><input type="checkbox" id="select-all" /></th>
                <td>상품ID</td>
                <td>상품 대표이미지</td>
                <td>상품명</td>
                <td>재고수</td>
                <td>대기주문수</td>
                <td>예상재고수</td>
                <td>공개여부</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="checkbox" name="product-check" /></td>
                <td>123751</td>
                <td>
                    <img src="${contextPath}/resources/images/a1.jpg" alt="pdt_img" class="img-fluid rounded" style="width: 150px; height: 150px; object-fit: cover;">
                </td>
                <td>돼지고기 목살 600g</td>
                <td>
				    <input type="text" class="form-control form-control-sm" value="564" min="0" style="width: 80px; display: inline-block;" />
				    <button class="btn btn-outline-secondary btn-sm">변경</button>
				</td>
				<td>3건</td>
                <td>512</td>
                <td>판매중<button class="btn btn-outline-secondary btn-sm">변경</button></td>
            </tr>
            
            <tr>
                <td><input type="checkbox" name="product-check" /></td>
                <td>123751</td>
                <td>
                    <img src="${contextPath}/resources/images/a1.jpg" alt="pdt_img" class="img-fluid rounded" style="width: 150px; height: 150px; object-fit: cover;">
                </td>
                <td>돼지고기 목살 600g</td>
                <td>
				    <input type="text" class="form-control form-control-sm" value="564" min="0" style="width: 80px; display: inline-block;" />
				    <button class="btn btn-outline-secondary btn-sm">변경</button>
				</td>
				<td>3건</td>
                <td>512</td>
                <td>판매중<button class="btn btn-outline-secondary btn-sm">변경</button></td>
            </tr>
            
            <tr>
                <td><input type="checkbox" name="product-check" /></td>
                <td>123751</td>
                <td>
                    <img src="${contextPath}/resources/images/a1.jpg" alt="pdt_img" class="img-fluid rounded" style="width: 150px; height: 150px; object-fit: cover;">
                </td>
                <td>돼지고기 목살 600g</td>
                <td>
				    <input type="text" class="form-control form-control-sm" value="564" min="0" style="width: 80px; display: inline-block;" />
				    <button class="btn btn-outline-secondary btn-sm">변경</button>
				</td>
				<td>3건</td>
                <td>512</td>
                <td>판매중<button class="btn btn-outline-secondary btn-sm">변경</button></td>
            </tr>
            
            <tr>
                <td><input type="checkbox" name="product-check" /></td>
                <td>123751</td>
                <td>
                    <img src="${contextPath}/resources/images/a1.jpg" alt="pdt_img" class="img-fluid rounded" style="width: 150px; height: 150px; object-fit: cover;">
                </td>
                <td>돼지고기 목살 600g</td>
                <td>
				    <input type="text" class="form-control form-control-sm" value="564" min="0" style="width: 80px; display: inline-block;" />
				    <button class="btn btn-outline-secondary btn-sm">변경</button>
				</td>
				<td>3건</td>
                <td>512</td>
                <td>판매중<button class="btn btn-outline-secondary btn-sm">변경</button></td>
            </tr>
           
        </tbody>
    </table>
    
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">Prev</span>
                </a>
            </li>
            <li class="page-item active" aria-current="page">
                <a class="page-link" href="#">1</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li>
            <li class="page-item"><a class="page-link" href="#">6</a></li>
            <li class="page-item"><a class="page-link" href="#">7</a></li>
            <li class="page-item"><a class="page-link" href="#">8</a></li>
            <li class="page-item"><a class="page-link" href="#">9</a></li>
            <li class="page-item"><a class="page-link" href="#">10</a></li>
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">Next</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
</body>
</html>
