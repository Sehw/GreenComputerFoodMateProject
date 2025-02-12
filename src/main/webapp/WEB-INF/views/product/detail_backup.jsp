<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />  
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');

#product_detail {
    margin: 0;
    font-family: 'Noto Sans KR', sans-serif;
}

.category {
  height: 50px;
  padding: 0px 12px;
  background-color: #f8f9fa;
  border-bottom: 1px solid #dee2e6;
  display: flex;
  align-items: center;
}

#category_text {
  width: 1200px;
  margin: 0 auto;
}

.container_pdt {
  margin: 10px auto;
  max-width: 1200px;
  overflow: hidden; /* float 해제 */
  backg
}

#pdt_Img {
  width: 600px;
  float: left; /* 이미지를 왼쪽으로 배치 */
  margin-right: 20px; /* 텍스트와 이미지 사이 간격 */
}

.info {
  font-family: "Noto Sans KR", serif;
  position: relative;
  max-width: 500px;
  float: left; /* 텍스트를 이미지 오른쪽으로 배치 */
}

.info1, .info2, .info3, .info4, .info5 {
  padding-bottom: 20px;
}

.info1 {
  border-bottom: 1px solid gray;
}
#pdt_ID {
  text-align: right;
  color: gray;
}

.info2 {
  border-bottom: 1px solid gray;
}
#pdt_Name {
  font-size: 40px;
}
#pdt_Dsc {
  font-size: 16px;
  color: gray;  
}
#pdt_Selr {
  font-size: 24px;
}

.info3 {
  border-bottom: 1px solid gray;
  text-align: right;
  position: relative;
}
#pdt_DsctPer {
  font-size: 26px;
  color: orange;
}
.info3 #text_Price {
  position: absolute;
  font-size: 1.25rem;
  top: 15px;
  left: 10px;
}
.info3 #text_DelivFee {
  position: absolute;
  font-size: 1.25rem;
  top: 60px;
  left: 10px;
}

.info3 #pdt_DelivPee {
  font-size: 1.25rem;
}

.info3 div {
  margin-bottom: 10px;
}

#pdt_Price {
  font-size: 20px;
  color: gray;
  text-decoration: line-through;
}
#pdt_DiscountedPrice {
  font-size: 32px;
  color: red;
  font-weight: 700;
}
#pdt_Rank {
}
#pdt_ReviewAmt {
}

.info4 {
  border-bottom: 1px solid gray;
  padding-top: 20px;
  display: flex;  /* flex로 설정하여 요소들을 가로로 배치 */
  justify-content: space-between;  /* 두 요소 간의 간격을 자동으로 조정 */
  align-items: center;  /* 수직 정렬을 중앙으로 */
}

#pdt_Amount {
  text-align: left;
}

#price_final {
  text-align: right;
  font-size: 32px;
  font-weight: bold;
}

.info5 {
  display: flex;  /* 부모 요소를 flex로 설정하여 자식 요소를 수평으로 배치 */
  justify-content: center;  /* 버튼들을 수평 중앙 정렬 */
  gap: 20px;  /* 버튼 사이에 간격 설정 (원하는 만큼 조정 가능) */
}

#btn_buy, #btn_cart {
  width: 220px;  /* 버튼의 너비 설정 */
  font-size: 20px;  /* 폰트 크기 설정 */
  margin-top: 20px;
  padding: 10px;
  text-align: center;  /* 텍스트 가운데 정렬 */
  background-color: green;  /* 버튼 배경색 */
  color: white;  /* 텍스트 색상 */
  border: none;  /* 버튼의 기본 테두리 제거 */
  cursor: pointer;  /* 마우스를 올리면 포인터 커서로 변경 */
}

#btn_buy:hover, #btn_cart:hover {
  background-color: #0056b3;  /* 버튼에 마우스를 올렸을 때 배경색 변경 */
}

</style>
</head>
<body>
<main id="product_detail">

<article class="category">
	<div id="category_text">
	카테고리 : 식재료 > 육류 > 돼지고기
	</div> 
</article>

<article class="container_pdt">
	<img id="pdt_Img" src="${contextPath}/resources/images/imgplaceholder.png">
	<div class="info">
		<div class="info1">
			<div id="pdt_ID">상품번호 : 125713</div>
		</div>
		<div class="info2">
			<div id="pdt_Name">돼지고기 목살 600g</div>
			<div id="pdt_Selr">판매자 : 그린축산</div>
			<div id="pdt_Dsc">상품 설명(1~3줄 정도) 되는 설명입니다. 상품 설명(1~3줄 정도) 되는 설명입니다. 상품 설명(1~3줄 정도) 되는 설명입니다.</div>
		</div>
		<div class="info3">
			<div id="text_Price">판매가</div>
			<div id="pdt_DiscountedPrice"><span id="pdt_DsctPer">-10&#37;&#32;</span><span id="pdt_Price">30,000원&#32;</span>27,000원</div>
			<div id="text_DelivFee">배송비</div>
			<div id="pdt_DelivPee">3,000원(40,000원 이상 구매 시 무료)</div>
			<div id="pdt_Rank">⭐⭐⭐⭐⭐</div><div id="pdt_ReviewAmt">(상품평 n개)</div>
		</div>
		<div class="info4">
			<div id="pdt_Amount">수량 : - 2 + 개</div><div id="price_final">총 54,000 원</div>
		</div>
		<div class="info5">
			<button id="btn_buy" onclick="window.location.href='${contextPath}/order/order1'">바로구매</button>
			<button id="btn_cart" onclick="window.location.href='${contextPath}/cart/cartForm'">장바구니 담기</button>
		</div>
	</div>
</article>
<jsp:include page="pdtdetail_misc.jsp">
	<jsp:param name="pdt_ID" value="123456"/>
</jsp:include>

</main>
</body>
</html>
