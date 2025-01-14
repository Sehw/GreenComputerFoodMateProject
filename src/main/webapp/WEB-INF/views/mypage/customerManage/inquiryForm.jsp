<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<style>
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
	
	input.form-control, select.form-control, textarea.form-control {
	    width: 100%;
	    box-sizing: border-box;
	    padding: 8px;
	    font-size: 14px;
	}
	
	textarea.form-control {
	    resize: vertical;
	}
	    
</style>
</head>
<body>
<div class="container mt-1">
	<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
      		<h5 class="mb-0 fw-bold">1:1 문의</h5>
    </div>
	<table class="table2">
	<tr>
        <td>문의 유형</td>
        <td>
            <select id="itype" class="form-control" name="itype">
                <option value="유저 신고">유저 신고</option>
                <option value="계정 관련사항">계정 관련사항</option>
                <option value="건의 사항">건의 사항</option>
                <option value="주문/결제">주문/결제</option>
                <option value="배송">배송</option>
                <option value="반품/환불/교환AS">반품/환불/교환AS</option>
                <option value="영수증/증빙서류">영수증/증빙서류</option>
                <option value="상품/이벤트">상품/이벤트</option>
                <option value="기타">기타</option>
            </select>
        </td>
    </tr>
    <tr>
        <td>휴대폰</td>
        <td><input type="text" class="form-control" name="phone" size="40"></td>
    </tr>
    <tr>
        <td>이메일주소</td>
        <td><input type="text" class="form-control" name="iemail" size="40"></td>
    </tr>
    <tr>
        <td>문의 제목</td>
        <td><input type="text" class="form-control" name="ititle" size="60"></td>
    </tr>
    <tr>
        <td>문의 내용</td>
        <td><textarea name="icontent" class="form-control" cols="60" rows="10"></textarea></td>
    </tr>
    <tr>
        <td>파일 첨부</td>
        <td><input type="file" class="form-control" name="upload"></td>
    </tr>
</table>
<div class="mb-3 row">
	<div class="col-12 text-center">
		<input type="submit" class="btn btn-success" value="문의하기">
		<input type="reset" class="btn btn-secondary" value="취소">
	</div>
</div>
</div>
</body>
</html>