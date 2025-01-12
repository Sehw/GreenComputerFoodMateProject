<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/slide.css" />" rel="stylesheet">
<meta charset="UTF-8">
<title>내 레시피</title>
</head>
<body>
<div class="container mt-1">
	<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
      		<h5 class="mb-0 fw-bold">내 레시피</h5>
    </div>
	<div class="grid_container">
	    <div class="item-img position-relative">
		        <img src="${contextPath}/resources/images/Food/bazilpasta.jpg" alt="Slide 1" class="img-fluid">
		        <div class="item-title d-flex flex-column justify-content-center align-items-center">
		            <h5><strong>바질 파스타</strong></h5>
		            <div class="item_etc">
	                	<p><span>2025</span>년 <span>1</span>월<span>10</span>일  댓글 <span>0</span>개  조회수: <span>10</span></p>
	                </div>
	                <div class="item-footer">
	              		<p><span>작성자: 요리연구가</span></p>
	              		<p>♥ <span>3</span></p>
	            	</div>
		        </div>
		    </div>
		    <div class="item-img position-relative">
	        <img src="${contextPath}/resources/images/Food/dumpling.jpg" alt="Slide 2" class="img-fluid">
	        <div class="item-title d-flex flex-column justify-content-center align-items-center">
	            <h5><strong>만두</strong></h5>
	            <div class="item_etc">
                	<p><span>2025</span>년 <span>1</span>월<span>10</span>일  댓글 <span>0</span>개  조회수: <span>10</span></p>
                </div>
                <div class="item-footer">
              		<p><span>작성자: 요리연구가</span></p>
              		<p>♥ <span>3</span></p>
            	</div>
	        </div>
	    </div>
	    <div class="item-img position-relative">
	        <img src="${contextPath}/resources/images/Food/friednoodle.jpg" alt="Slide 3" class="img-fluid">
	        <div class="item-title d-flex flex-column justify-content-center align-items-center">
	            <h5><strong>볶음국수</strong></h5>
	            <div class="item_etc">
                	<p><span>2025</span>년 <span>1</span>월<span>10</span>일  댓글 <span>0</span>개  조회수: <span>10</span></p>
                </div>
                <div class="item-footer">
              		<p><span>작성자: 요리연구가</span></p>
              		<p>♥ <span>3</span></p>
            	</div>
	        </div>
	    </div>
	    <div class="item-img position-relative">
	        <img src="${contextPath}/resources/images/Food/potato.jpg" alt="Slide 4" class="img-fluid">
	        <div class="item-title d-flex flex-column justify-content-center align-items-center">
	            <h5><strong>감자튀김</strong></h5>
	            <div class="item_etc">
                	<p><span>2025</span>년 <span>1</span>월<span>10</span>일  댓글 <span>0</span>개  조회수: <span>10</span></p>
                </div>
                <div class="item-footer">
              		<p><span>작성자: 요리연구가</span></p>
              		<p>♥ <span>3</span></p>
            	</div>
	        </div>
	    </div>
	    <div class="item-img position-relative">
	        <img src="${contextPath}/resources/images/Food/taco.jpg" alt="Slide 5" class="img-fluid">
	        <div class="item-title d-flex flex-column justify-content-center align-items-center">
	            <h5><strong>타코</strong></h5>
	            <div class="item_etc">
                	<p><span>2025</span>년 <span>1</span>월<span>10</span>일  댓글 <span>0</span>개  조회수: <span>10</span></p>
                </div>
                <div class="item-footer">
              		<p><span>작성자: 요리연구가</span></p>
              		<p>♥ <span>3</span></p>
            	</div>
	        </div>
	    </div>
	</div>
</div>
</body>
</html>