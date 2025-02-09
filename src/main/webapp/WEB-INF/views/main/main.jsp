<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<link href="<c:url value="/resources/css/slide.css" />" rel="stylesheet">
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
		.bestrecipy{
			width: 80%;
			margin: 0 auto;
		}
        .slick-slide img {
            width: 100%; /* 이미지 너비 조정 */
            height: 350px; /* 이미지 비율 유지 */
            object-fit: cover;
        }
        .slick-slide {
            margin: 0 10px; /* 슬라이드 간 간격 */
        }
        .slick-prev{
			left: 40px;
		    z-index: 1;
		}
		.slick-next{
			right: 40px;
		    z-index: 1;
		}
</style>
<script>
        $(document).ready(function() {
            $('.bestrecipy').slick({
                slidesToShow: 4,
                slidesToScroll: 1,
                autoplay: false
            });
        });
</script>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
	<h5><strong>&#x1F44D 베스트 레시피</strong></h5>
    <div class="bestrecipy">
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
    
    <h5 class="mt-2"><strong>&#x1F550 최신 레시피</strong></h5>
    <div class="bestrecipy">
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
    
    <h5 class="mt-2"><strong>🎁특가상품</strong></h5>
    <div class="bestrecipy">
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
</body>
</html>