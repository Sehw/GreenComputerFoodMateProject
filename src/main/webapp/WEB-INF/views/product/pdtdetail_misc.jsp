<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />  

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 상세 페이지</title>
    <style>
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
            cursor: pointer;
        }

        .tab:last-child {
            border-right: none; /* 마지막 탭의 우측 경계선 제거 */
        }

        .tab.active {
            background-color: #ccc; /* 활성화된 탭 강조 */
            font-weight: bold;
            color: #000;
        }

        /* 탭 콘텐츠 */
        .tab-content {
            display: none; /* 기본적으로 모든 탭 내용은 숨김 */
            padding: 20px;
            border-top: 2px solid #dbdbdb;
        }

        /* 탭 컨텐츠 활성화 시 표시 */
        .tab-content.active {
            display: block;
        }
    </style>
</head>
<body>

<article class="tab-container">
    <div class="tab" id="tab1">상품상세설명</div>
    <div class="tab" id="tab2">상품후기</div>
    <div class="tab" id="tab3">상품문의</div>
    <div class="tab" id="tab4">교환/반품문의</div>
</article>

<!-- 각 탭의 내용 -->
<article id="tabContent1" class="tab-content">
    <h3>상품 상세 설명</h3>
    <p>여기에는 상품에 대한 상세한 설명이 들어갑니다.</p>
</article>

<!-- 상품 후기 탭 -->
<article id="tabContent2" class="tab-content">
    <h3>상품 후기</h3>
    <div id="ratingSection">
        <h4>별점 남기기</h4>
        <div id="starRating">
            <button class="star" data-rating="1">★</button>
            <button class="star" data-rating="2">★</button>
            <button class="star" data-rating="3">★</button>
            <button class="star" data-rating="4">★</button>
            <button class="star" data-rating="5">★</button>
        </div>
        <p id="selectedRating">선택한 평점: <span id="ratingValue">0</span> / 5</p>

        <h4>후기 작성</h4>
        <textarea id="reviewText" placeholder="상품에 대한 후기를 작성해 주세요."></textarea>
        <button id="submitReview">후기 작성</button>
    </div>
</article>

<!-- 상품 문의 탭 -->
<article id="tabContent3" class="tab-content">
    <h3>상품 문의</h3>
    <div id="qnaSection">
        <h4>상품에 대해 문의하기</h4>
        <textarea id="qnaText" placeholder="상품에 대한 질문을 작성해 주세요."></textarea>
        <button id="submitQna">문의 작성</button>
    </div>
</article>

<article id="tabContent4" class="tab-content">
    <h3>교환/반품 문의</h3>
    <p>여기에는 교환/반품에 관한 내용이 들어갑니다.</p>
</article>

<script>
    // 탭 클릭 시 내용 전환
    const tabs = document.querySelectorAll('.tab');
    const tabContents = document.querySelectorAll('.tab-content');

    function showTab(tabNumber) {
        // 모든 탭 내용 숨기기
        tabContents.forEach(tab => tab.classList.remove('active'));
        // 모든 탭 비활성화
        tabs.forEach(tab => tab.classList.remove('active'));
        
        // 클릭한 탭 내용 보이기
        document.getElementById('tabContent' + tabNumber).classList.add('active');
        // 클릭한 탭 활성화
        document.getElementById('tab' + tabNumber).classList.add('active');
    }

    // 각 탭에 이벤트 리스너 추가
    tabs.forEach((tab, index) => {
        tab.addEventListener('click', () => showTab(index + 1));
    });

    // 기본적으로 첫 번째 탭을 활성화
    showTab(1);

    // 별점 선택 기능
    const stars = document.querySelectorAll('.star');
    const ratingValue = document.getElementById('ratingValue');
    let selectedRating = 0;

    stars.forEach(star => {
        star.addEventListener('click', () => {
            selectedRating = star.getAttribute('data-rating');
            ratingValue.textContent = selectedRating;
            // 별점 선택 시 하이라이트 처리
            stars.forEach(s => s.style.color = 'black');
            for (let i = 0; i < selectedRating; i++) {
                stars[i].style.color = 'gold';
            }
        });
    });

    // 후기 작성 버튼 클릭 시
    document.getElementById('submitReview').addEventListener('click', () => {
        const reviewText = document.getElementById('reviewText').value;
        if (selectedRating > 0 && reviewText.trim()) {
            alert("후기가 등록되었습니다.");
            location.reload(); // 페이지 새로고침해서 최신 후기 표시
        } else {
            alert("별점과 후기를 입력해주세요.");
        }
    });

    // 문의 작성 버튼 클릭 시
    document.getElementById('submitQna').addEventListener('click', () => {
        const qnaText = document.getElementById('qnaText').value;
        if (qnaText.trim()) {
            alert("문의가 등록되었습니다.");
            location.reload(); // 페이지 새로고침해서 최신 문의 표시
        } else {
            alert("문의 내용을 입력해주세요.");
        }
    });
</script>

</body>
</html>
