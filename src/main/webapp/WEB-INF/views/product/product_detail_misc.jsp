<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />  
<html>
<head>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');

/* 부모 컨테이너 */
.tab-container {
  display: flex; /* 수평 배치를 위한 flex 사용 */
  width: 1350px; /* 고정 폭 */
  margin: 100px auto; /* 가운데 정렬 */
  background-color: #dbdbdb; /* 탭 배경색 */
  border-top: 2px solid black; /* 위쪽 검은선 */
  border-left: 1px solid black; /* 좌측 검은선 */
  border-right: 1px solid black; /* 우측 검은선 */
}

/* 각각의 탭 */
.tab {
  flex: 1; /* 모든 탭이 동일한 너비를 가짐 */
  font-family: "Noto Sans KR", serif;
  font-size: 1rem;
  font-weight: 500;
  text-align: center; /* 텍스트 가운데 정렬 */
  line-height: 2.5rem; /* 탭 높이 조정 */
  border-right: 1px solid black; /* 각 탭 사이에 경계선 */
  padding: 5px 0 5px;
}

.tab:last-child {
  border-right: none; /* 마지막 탭의 우측 경계선 제거 */
}

.miscimg {
	text-align: center;
	margin-bottom: 100px;
}

</style>

</head>
<body>

<article class="tab-container">
  <div class="tab">
    상품상세설명
  </div>
  <div class="tab">
    상품후기
  </div>
  <div class="tab">
    상품문의
  </div>
  <div class="tab">
    교환/반품문의
  </div>
</article>
<article class="miscimg">
	<img src="${contextPath}/resources/images/pdtdetailmisc.jpg">
</article>
</body>
</html>
