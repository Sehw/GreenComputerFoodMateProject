<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />  
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Noto+Sans+KR:wght@100..900&display=swap');
@font-face {
    font-family: 'NanumFlower'; /* 글꼴 이름 */
    src: url('${contextPath}/resources/fonts/nanum_flower.ttf') format('truetype'); /* TTF 파일 경로와 형식 */
}


#wrap_cmp {
    background-color: #f1f3f5;
}

#wrap_cmp .article_container {
    background-color: white;
    width: 1200px;
    margin: 0px auto;
    display: flex;
}

#wrap_cmp #cmp_pdt {
    width: 60%;
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

</style>

</head>
<body>
<div id="wrap_cmp">
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
		</article>

<style>

#wrap_cmp #cmp_rcp {
    width: 40%;
}

#cmp_rcp {
	font-family: "NanumFlower", sans-serif;
	font-weight: bold;
}

#cmp_rcp #rcp_Name,
#cmp_rcp #rcp_Writer {
	font-size: 2rem;
}

#cmp_rcp #rcp_Rq_Mtr,
#cmp_rcp #rcp_Rq_Spice {
	font-size: 2rem;
}

#cmp_rcp .rcp_Mtrs,
#cmp_rcp .rcp_Mtrs_Cart,
#cmp_rcp .rcp_Spices {
	font-size: 1.5rem;
}

#cmp_rcp #post_background {
	padding: 60px 60px 0;
	height: 220px;
	background-image: url(${contextPath}/resources/images/sticky_note.png);
    background-size: 100% auto;
    background-repeat: no-repeat; 
}

#cmp_rcp #note_background {
	padding: 30px 60px 0;
	min-height: 900px;
	background-image: url(${contextPath}/resources/images/note_with_grid.png);
    background-size: 100% auto;
    background-repeat: no-repeat; 
}

</style>
		
		<article id="cmp_rcp">
		
			<div id="post_background">
				<section id="rcp_Name">
					만들 요리 : <u>백종원표 제육볶음</u>
				</section>
				<section id="rcp_Writer">
					레시피 작성자 : <u>백주부추종자</u>
				</section>
			</div>
			
			<div id="note_background">
				<section id="rcp_Rq_Mtr">
					필요한 재료 목록
					<div class="rcp_Mtrs">
					&nbsp;&nbsp;돼지고기 1kg
					</div>
					<div class="rcp_Mtrs_Cart">
						↳돼지고기 뒷다리살 1kg, ㈜유동정육
					</div>
					<div class="rcp_Mtrs">
					&nbsp;&nbsp;양파 100g
					</div>
					<div class="rcp_Mtrs">
					&nbsp;&nbsp;대파 1단
					</div>
					<div class="rcp_Mtrs">
					&nbsp;&nbsp;청양고추 50g
					</div>
				</section>
				
				<section id="rcp_Rq_Spice">
					필요한 양념 목록
					<div class="rcp_Spices">
					&nbsp;&nbsp;설탕 한 봉지
					</div>
					<div class="rcp_Spices">
					&nbsp;&nbsp;고추장 1통
					</div>
					<div class="rcp_Spices">
					&nbsp;&nbsp;간장 1병
					</div>
				</section>
			</div>
			
		</article>
	</div>
</div>

</body>
</html>