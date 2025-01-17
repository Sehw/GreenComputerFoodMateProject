<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />  
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Noto+Sans+KR:wght@100..900&display=swap');

#wrap_cmp {
    background-color: #f1f3f5;
}

#wrap_cmp #rcp_intro {
	padding: 20px 20px 10px;
	display: flex;
	justify-content: space-between;
}

#wrap_cmp #rcp_intro #rcp_imgAndName {
	font-family: "Do Hyeon", "Noto Sans KR", serif;
	text-align: center;
	font-size: 1.5rem;
}

#wrap_cmp #rcp_step {
    padding: 20px 30px 0 10px;
    font-size: 1.5rem;
    font-family: "Noto Sans KR", serif;
}

#wrap_cmp #rcp_step span.step-number {
    display: inline-block;
    width: 30px;
    height: 30px;
    line-height: 30px;
    border-radius: 50%;
    background-color: #2ecc71; /* 초록색 */
    color: white;
    text-align: center;
    font-weight: bold;
    margin-right: 10px;
}

#wrap_cmp .rcp_img {
	width: 200px;
	border-radius: 10px;
}

#wrap_cmp .article_container {
    background-color: white;
    width: 1200px;
    margin: 0px auto;
    display: flex;
}

#wrap_cmp #cmp_pdt {
    width: 65%;
}

#wrap_cmp #cmp_pdt .pdt_row {
	padding: 15px;
	border-bottom: 1px solid black;
}

#wrap_cmp #cmp_pdt .pdt_Name {
	font-size: 1.1rem;
}

#wrap_cmp #cmp_pdt .pdt_Selr,
#wrap_cmp #cmp_pdt .pdt_Rank,
#wrap_cmp #cmp_pdt .pdt_Category {
	font-size: 0.75rem;
}

#wrap_cmp .pdt_img {
    width: 100px;
}

#wrap_cmp #cmp_pdt section {
    display: flex;
}

#wrap_cmp #cmp_pdt section div:first-child {
    margin-right: 20px;
}

#wrap_cmp #cmp_pdt section div:nth-child(2) {
    font-weight: bold;
}

#wrap_cmp #cmp_pdt section div:nth-child(3) {
	font-family: "Do Hyeon", "Black Han Sans", "Noto Sans KR", serif;
	font-size: 2rem;
    text-align: right;
    margin-left: auto;
    font-weight: 500;
    color: red;
    align-self: center;
}

#wrap_cmp .pdt_chk {
	font-family: "Noto Sans KR", serif;
	font-size: 1.25rem;
}

#wrap_cmp #rcp_spread {
	font-family: "Noto Sans KR", serif;
	width: 100%;
	text-align: center;
	font-size: 1.5rem;
	background-color: #fa9820;
	margin-bottom: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
	color: white;
}

<!-- 페이지네이션 부분 css -->

#wrap_cmp #pdt_pagenation {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 20px 0;
    font-family: "Noto Sans KR", sans-serif;
}

#wrap_cmp #pdt_pagenation .page_btn {
    background-color: #fa9820;
    color: white;
    border: none;
    padding: 10px 15px;
    margin: 0 5px;
    font-size: 1rem;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

#wrap_cmp #pdt_pagenation .page_btn:hover {
    background-color: #d9791b;
}

</style>

</head>
<body>
<div id="wrap_cmp">
	<div class="article_container">
		<article id="rcp_intro">
			<section id="rcp_imgAndName">
				<img class="rcp_img" src="${contextPath}/resources/images/geyuk.jpg">
				<br>백종원표 제육볶음
			</section>
		</article>
		
		<article id="rcp_step">
		    <div>
		        <span class="step-number">1</span> 선도 좋은 돼지고기를 준비합니다. 목심, 앞다리, 뒷다리 등 좋아하는 부위로~<br>
		    </div>
		    <div>
		        <span class="step-number">2</span> 돼지고기에 설탕 1, 다진 마늘 1, 맛술 1, 후춧가루, 생강가루 적당량을 넣고 위생 비닐장갑을 끼고 조물조물 밑간을 해주세요.<br>
		    </div>
		    <div>
		        <span class="step-number">3</span> 양념장을 만들어 봐요. 고춧가루 2, 고추장 2, 양조간장 3, 다진 마늘 1, 청주 2, 올리고 당 2, 참기름 1을 넣고 고루 섞어 주세요.<br>
		    </div>
		</article>
	</div>

	<div class="article_container">
		<div id="rcp_spread">
		레시피 펼치기⏬
		</div>
	</div>

	<div class="article_container">
		<article id="cmp_pdt">
			<section class="pdt_row">
				<div>
				<img class="pdt_img" src="${contextPath}/resources/images/a1.jpg">
				</div>
				<div>
				<span class="pdt_Name">돼지고기 목살 600g</span><br>
				<span class="pdt_Selr">㈜루루축산</span><br>
				<span class="pdt_Rank">⭐⭐⭐⭐⭐(후기 135)</span><br>
				<span class="pdt_Category">식재료 > 축산 > 돼지고기</span>
				</div>
				<div>
				27,000원
				<button class="pdt_chk">담기</button>
				</div>
			</section>
			
			<section class="pdt_row">
				<div>
				<img class="pdt_img" src="${contextPath}/resources/images/a2.jpg">
				</div>
				<div>
				<span class="pdt_Name">돼지고기 뒷다리살 1kg</span><br>
				<span class="pdt_Selr">㈜유동정육</span><br>
				<span class="pdt_Rank">⭐⭐⭐⭐(후기 535)</span><br>
				<span class="pdt_Category">식재료 > 축산 > 돼지고기</span>
				</div>
				<div>
				24,500원
				<button class="pdt_chk">담기</button>
				</div>
			</section>
			
			<section class="pdt_row">
				<div>
				<img class="pdt_img" src="${contextPath}/resources/images/a3.jpg">
				</div>
				<div>
				<span class="pdt_Name">돼지고기 목전지 500g</span><br>
				<span class="pdt_Selr">㈜꿀꿀컴퍼니</span><br>
				<span class="pdt_Rank">⭐⭐⭐⭐⭐(후기 43)</span><br>
				<span class="pdt_Category">식재료 > 축산 > 돼지고기</span>
				</div>
				<div>
				14,300원
				<button class="pdt_chk">담기</button>
				</div>
			</section>
			
			<section class="pdt_row">
				<div>
				<img class="pdt_img" src="${contextPath}/resources/images/a1.jpg">
				</div>
				<div>
				<span class="pdt_Name">돼지고기 항정살 300g</span><br>
				<span class="pdt_Selr">㈜한돈</span><br>
				<span class="pdt_Rank">⭐⭐⭐⭐⭐(후기 4135)</span><br>
				<span class="pdt_Category">식재료 > 축산 > 돼지고기</span>
				</div>
				<div>
				35,400원
				<button class="pdt_chk">담기</button>
				</div>
			</section>
			
			<section class="pdt_row">
				<div>
				<img class="pdt_img" src="${contextPath}/resources/images/a1.jpg">
				</div>
				<div>
				<span class="pdt_Name">돼지고기 목살 600g</span><br>
				<span class="pdt_Selr">㈜루루축산</span><br>
				<span class="pdt_Rank">⭐⭐⭐⭐⭐(후기 135)</span><br>
				<span class="pdt_Category">식재료 > 축산 > 돼지고기</span>
				</div>
				<div>
				27,000원
				<button class="pdt_chk">담기</button>
				</div>
			</section>
			
			<section class="pdt_row">
				<div>
				<img class="pdt_img" src="${contextPath}/resources/images/a1.jpg">
				</div>
				<div>
				<span class="pdt_Name">돼지고기 목살 600g</span><br>
				<span class="pdt_Selr">㈜루루축산</span><br>
				<span class="pdt_Rank">⭐⭐⭐⭐⭐(후기 135)</span><br>
				<span class="pdt_Category">식재료 > 축산 > 돼지고기</span>
				</div>
				<div>
				27,000원
				<button class="pdt_chk">담기</button>
				</div>
			</section>
			
			<section class="pdt_row">
				<div>
				<img class="pdt_img" src="${contextPath}/resources/images/a1.jpg">
				</div>
				<div>
				<span class="pdt_Name">돼지고기 목살 600g</span><br>
				<span class="pdt_Selr">㈜루루축산</span><br>
				<span class="pdt_Rank">⭐⭐⭐⭐⭐(후기 135)</span><br>
				<span class="pdt_Category">식재료 > 축산 > 돼지고기</span>
				</div>
				<div>
				27,000원
				<button class="pdt_chk">담기</button>
				</div>
			</section>
			
			<section class="pdt_row">
			
				<div id="pdt_pagenation">
				    <button class="page_btn" data-page="prev">이전</button>
				    <button class="page_btn" data-page="1">1</button>
				    <button class="page_btn" data-page="2">2</button>
				    <button class="page_btn" data-page="3">3</button>
				    <button class="page_btn" data-page="3">4</button>
				    <button class="page_btn" data-page="3">5</button>
				    <button class="page_btn" data-page="3">6</button>
				    <button class="page_btn" data-page="3">7</button>
				    <button class="page_btn" data-page="3">8</button>
				    <button class="page_btn" data-page="3">9</button>
				    <button class="page_btn" data-page="3">10</button>
				    <button class="page_btn" data-page="next">다음</button>
				</div>
			
			</section>
			
		</article>
		
<style>

#wrap_cmp #cmp_rcp {
    width: 35%;
    border: 1px solid black;
    background-color: #f1f3f5;
    font-family: "Noto Sans KR", sans-serif;
    padding: 20px 20px;
}

#cmp_rcp #rcp_Name,
#cmp_rcp #rcp_Writer,
#cmp_rcp #rcp_Rq_Mtr,
#cmp_rcp #rcp_Rq_Spice {
	text-align: center;
	font-size: 1.5rem;
}

#cmp_rcp #rcp_Rq_Mtr,
#cmp_rcp #rcp_Rq_Spice {
	font-size: 1.25rem;
	font-weight: 600;
}

#cmp_rcp .Mtrs,
#cmp_rcp .Spices {
	border: 1px solid black;
	background-color: white;
	margin-bottom: 20px;
}

#cmp_rcp .rcp_Mtrs,
#cmp_rcp .rcp_Spices {
	text-align: left;
	font-size: 1.1rem;
	font-weight: 600;
}

#cmp_rcp .rcp_Mtrs_Cart,
#cmp_rcp .rcp_Mtrs_Cart_Amount,
#cmp_rcp .rcp_Spices_Cart,
#cmp_rcp .rcp_Spices_Cart_Amount {	
	text-align: left;
	font-size: 1rem;
	padding-left: 20px;
	padding-right: 20px;
}

#cmp_rcp .rcp_Mtrs,
#cmp_rcp .rcp_Spices {
	padding: 5px 10px 5px;
	border-bottom: 1px solid gray;
}

#cmp_rcp .rcp_Mtrs_Cart,
#cmp_rcp .rcp_Spices_Cart {
	margin-top: 10px;
}

#cmp_rcp .rcp_Mtrs_Cart_Amount,
#cmp_rcp .rcp_Spices_Cart_Amount {
	margin-bottom: 10px;
	display: flex;
	justify-content: space-between;
	align-items: center
}


.Mtrs .rcp_Mtrs_Cart_Amount div:nth-child(2) {
  font-family: "Noto Sans KR", serif;
  font-size: 1.25rem;
  font-weight: 600;
  color: red;
}

.Spices .rcp_Spices_Cart_Amount div:nth-child(2) {
  font-family: "Noto Sans KR", serif;
  font-size: 1.25rem;
  font-weight: 600;
  color: red;
}

#cmp_rcp .cart-button {
    display: block;
    width: 250px;
    text-align: center;
    margin: 20px auto;
    padding: 10px 0;
    font-size: 1.5rem;
    font-weight: 600;
    color: white;
    background-color: #fa9820;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

#cmp_rcp .cart-button:hover {
    background-color: #d9791b;
}

</style>
		
		<article id="cmp_rcp">
			<section id="rcp_Rq_Mtr">
				재료 목록
				<div class="Mtrs">
					<div class="rcp_Mtrs" style="background-color: #fa9820; color: white;">
					돼지고기 1kg
					</div>
					<div class="rcp_Mtrs_Cart">
					돼지고기 뒷다리살 1kg, ㈜유동정육
					</div>
					<div class="rcp_Mtrs_Cart_Amount">
					<div>수량 - 1 +</div>
					<div>24,500원</div>
					</div>
				</div>
				
				<div class="Mtrs">
					<div class="rcp_Mtrs">
					양파 2개
					</div>
					<div class="rcp_Mtrs_Cart">
					
					</div>
					<div class="rcp_Mtrs_Cart_Amount">
					
					</div>
				</div>
				
				<div class="Mtrs">
					<div class="rcp_Mtrs">
					대파 1단
					</div>
					<div class="rcp_Mtrs_Cart">
					
					</div>
					<div class="rcp_Mtrs_Cart_Amount">
					
					</div>
				</div>
				
			</section>
			
			<section id="rcp_Rq_Spice">
				양념 목록
				<div class="Spices">
				
					<div class="rcp_Spices">
					고추장 3술
					</div>
					<div class="rcp_Spices_Cart">
					청정원 고추장 1통, ㈜청정원
					</div>
					<div class="rcp_Spices_Cart_Amount">
					<div>					수량 - 1 +					</div>
					<div>5,000원</div>
					</div>
					
				</div>
				
				<div class=Spices>
				
					<div class="rcp_Spices">
					설탕 50g
					</div>
					<div class="rcp_Spices_Cart">
					
					</div>
					<div class="rcp_Spices_Cart_Amount">
					
					</div>
					
				</div>
				
				<div class=Spices>
				
					<div class="rcp_Spices">
					간장 3술
					</div>
					<div class="rcp_Spices_Cart">
					
					</div>
					<div class="rcp_Spices_Cart_Amount">
					
					</div>
					
				</div>
				
			</section>
			<button class="cart-button">장바구니에 담기</button>
		</article>
	</div>
</div>

</body>
</html>