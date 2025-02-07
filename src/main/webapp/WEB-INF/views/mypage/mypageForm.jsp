<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<link href="<c:url value="/resources/css/slide.css" />" rel="stylesheet">
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link href="<c:url value="/resources/css/profile.css" />" rel="stylesheet">
<style>
		.myrecipy{
			width: 100%;
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
		.table-custom {
		    border-top: 2px solid #000 !important;
	 	 }
		/* 헤더 배경색 */
	    .table-header {
		  background-color: #f8f9fa;
	      text-align: center;
	      font-weight: bold;
	    }
	    /* 내용 텍스트 정렬 */
	    .table tbody td {
	      vertical-align: middle;
	      text-align: center;
	    }
</style>
<script>
        $(document).ready(function() {
            $('.myrecipy').slick({
                slidesToShow: 3,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 3500
            });
        });
</script>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<div class="container mt-2">
		<div class="row">
			<div class="col-md-3 mt-3">
				<div class="mainbox">
					<div class="name_icon_btn">
						<a href="${contextPath}/mypage/myInfoManage/profileEditForm">
							<img src="${contextPath}/resources/images/profile_09.png" alt="" />
						</a>
						<p> ${sessionScope.buyerInfo.name} 회원님 </p>
						<p> 보유포인트 </p>
						<p> 0 포인트 </p>
						<p> 보유쿠폰 </p>
						<p> 0개 </p>
					</div>
				</div>
			</div>
			<div class="col-md-9">
			<h5><strong>내 레시피</strong></h5>
    			<div class="myrecipy">
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
		</div>
	  <div class="d-flex justify-content-between align-items-center mt-2 mb-2">
	  		<h5 class="mb-0 fw-bold">최근 주문 내역</h5>
	  		<p class="mb-0">더보기
      </div>
      <table class="table table-hover table-custom">
		<thead class="table-header table-secondary">
			<tr>
				<td>주문번호</td>
				<td>주문일자</td>
				<td>주문상품</td>
				<td>주문상태</td>
				<td>주문취소</td>
			</tr>
		</thead>
      	<tbody>
      	<tr>
          <td>400</td>
          <td>2024-12-24 16:16:13</td>
          <td>돼지고기 뒷다리살</td>
          <td>상품준비중</td>
          <td>
            <button class="btn btn-outline-secondary btn-sm" disabled>주문 취소</button>
          </td>
        </tr>
        <tr>
          <td>401</td>
          <td>2024-12-24 16:16:13</td>
          <td>돼지고기 앞다리살</td>
          <td>상품준비중</td>
          <td>
            <button class="btn btn-outline-secondary btn-sm" disabled>주문 취소</button>
          </td>
        </tr>
		</tbody>
	</table>
	<div class="d-flex justify-content-between align-items-center mb-2">
      		<h5 class="mb-0 fw-bold">찜 목록</h5>
      		<p class="mb-0">더보기
      </div>
      <table class="table table-hover table-custom">
		<thead class="table-header table-primary">
			<tr>
				<td><input type="checkbox" id="checkAll"></td>
				<td>상품명/옵션</td>
				<td>상품금액/수량</td>
				<td>혜택</td>
				<td>주문</td>
			</tr>
		</thead>
      	<tbody>
      	<tr>
          <td><input type="checkbox" id="check1"></td>
          <td>
          <img src="${contextPath}/resources/images/Shopping/pig.jpg" alt="돼지고기" class="img-fluid rounded" style="width: 50px; height: 50px; object-fit: cover;">
          돼지고기 뒷다리살 400g
          </td>
          <td>
            <div class="d-flex flex-column gap-1 align-items-center">
		    	<span>10,900 / 1개</span>
		    	<button class="btn btn-outline-secondary btn-sm " style="width:120px;" disabled>옵션/수량변경</button>
		  	</div>
          </td>
          <td>적립<br>
          상품 + 199원</td>
          <td>
          <div class="d-flex flex-column gap-1 align-items-center">
            <button class="btn btn-outline-success btn-sm" disabled>장바구니</button>
            <button class="btn btn-outline-secondary btn-sm" disabled>삭제하기</button>
           </div>
          </td>
        </tr>
        <tr>
          <td><input type="checkbox" id="check2"></td>
          <td>
          <img src="${contextPath}/resources/images/Shopping/cow.jpg" alt="소고기" class="img-fluid rounded" style="width: 50px; height: 50px; object-fit: cover;">
          소고기 국거리 400g
          </td>
          <td>
            <div class="d-flex flex-column gap-1 align-items-center">
		    	<span>13,900 / 1개</span>
		    	<button class="btn btn-outline-secondary btn-sm " style="width:120px;" disabled>옵션/수량변경</button>
		  	</div>
          </td>
          <td>적립<br>
          상품 + 199원</td>
          <td>
            <div class="d-flex flex-column gap-1 align-items-center">
            	<button class="btn btn-outline-success btn-sm" disabled>장바구니</button>
            	<button class="btn btn-outline-secondary btn-sm" disabled>삭제하기</button>
           </div>
          </td>
        </tr>
		</tbody>
	</table>
		<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
	      		<h5 class="mb-0 fw-bold">최근 본 상품</h5>
	    </div>
	</div>
	
</body>
</html>