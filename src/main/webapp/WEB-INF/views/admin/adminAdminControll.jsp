<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 관리</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            margin: 20px;
        }
        /* 탭 스타일 */
        .tabs {
            display: flex;
            border-bottom: 2px solid #ddd;
        }
        .tab {
            padding: 10px 20px;
            cursor: pointer;
            background-color: #f4f4f4;
            border: 1px solid #ddd;
            border-radius: 5px 5px 0 0;
            margin-right: 5px;
        }
        .tab:hover {
            background-color: #ddd;
        }
        .active-tab {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }
        
              /* 검색창 스타일 */
        .search-bar {
            display: flex;
            margin-bottom: 20px;
        }
        .search-bar input {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            flex: 1;
        }
        .search-bar select {
            padding: 8px 12px;
            margin-left: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .search-bar button {
            padding: 8px 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            margin-left: 10px;
            cursor: pointer;
        }
        .search-bar button:hover {
            background-color: #0056b3;
        }
        /* 탭 콘텐츠 */
        .tab-content {
            display: none;
            padding: 20px;
        }
        .active-content {
            display: block;
        }
        .btn {
            padding: 8px 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        /* 전체 관리자 표 스타일 */
        table {
            width: 100%;
            border-collapse: collapse; /* 경계선 병합 */
            margin-top: 20px;
        }
        th, td {
            padding: 12px 20px;
            text-align: left;
            border-bottom: 1px solid #ddd; /* 밑줄만 추가 */
        }
        th {
            background-color: #f4f4f4;
            color: #333;
            font-weight: bold;
        }
        td {
            background-color: #ffffff;
            color: #555;
        }
        /* 마우스 hover 시 배경색 변경 */
        tr:hover td {
            background-color: #f1f1f1;
        }
        /* 사이드줄 없애기 */
        table, th, td {
            border-left: none;
            border-right: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 탭 메뉴 -->
        <div class="tabs">
            <div class="tab active-tab" onclick="showTab('allAdmins')">전체 관리자</div>
            <div class="tab" onclick="showTab('adminSignup')">관리자 회원가입</div>
        </div>

        <!-- 탭 내용 -->
        <!-- 전체 관리자 -->
        <div id="allAdmins" class="tab-content active-content">
        <!-- 검색 기능 -->
        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="검색어를 입력하세요" />
            <select id="searchFilter">
            	<option value="title">관리자 역할</option>
                <option value="title">레시피 제목</option>
                <option value="author">작성자</option>
                <option value="date">등록일</option>
            </select>
            <button onclick="searchRecipes()">검색</button>
        </div>
            <h2>전체 관리자</h2>
            <table>
                <thead>
                    <tr>
                        <th>관리자 이름</th>
                        <th>이메일</th>
                        <th>역할</th>
                        <th>상태</th>
                        <th>상세</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>관리자 1</td>
                        <td>admin1@example.com</td>
                        <td>슈퍼 관리자</td>
                        <td>활동 중</td>
                        <td><a href="${contextPath}/admin/adminAdminDetail.do">보기</a></td>
                        
                    </tr>
                    <tr>
                        <td>관리자 2</td>
                        <td>admin2@example.com</td>
                        <td>일반 관리자</td>
                        <td>로그아웃</td>
                        <td><button class="btn">상세 보기</button></td>
                    </tr>
                    <!-- 추가 관리자 목록 -->
                </tbody>
            </table>
        </div>

        <!-- 관리자 회원가입 -->
        <div id="adminSignup" class="tab-content">
            <h2>관리자 회원가입</h2>
            <form id="signupForm">
                <div class="form-group">
                    <label for="name">이름</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="role">역할</label>
                    <select id="role" name="role">
                        <option value="super_admin">슈퍼 관리자</option>
                        <option value="admin">일반 관리자</option>
                    </select>
                </div>
                <!-- 인증번호 발급 버튼과 입력란 -->
                <div class="form-group">
                    <label for="verificationCode">인증번호</label>
                    <div style="display: flex;">
                        <input type="text" id="verificationCode" name="verificationCode" required style="width: 80%;">
                        <button type="button" class="btn" onclick="sendVerificationCode()">인증번호 발급</button>
                    </div>
                </div>
                <button class="btn" type="submit">회원가입</button>
            </form>
        </div>
    </div>

    <script>
        function showTab(tabId) {
            // 모든 탭 내용 숨기기
            const tabContents = document.querySelectorAll('.tab-content');
            tabContents.forEach(content => {
                content.classList.remove('active-content');
            });

            // 모든 탭 비활성화
            const tabs = document.querySelectorAll('.tab');
            tabs.forEach(tab => {
                tab.classList.remove('active-tab');
            });

            // 선택한 탭 활성화
            document.getElementById(tabId).classList.add('active-content');
            const activeTab = document.querySelector(`.tab[onclick="showTab('${tabId}')"]`);
            activeTab.classList.add('active-tab');
        }

        function sendVerificationCode() {
            const email = document.getElementById('email').value;
            
            if (!email) {
                alert('이메일을 입력해 주세요.');
                return;
            }

            // 여기에 실제 인증번호 발급 로직을 추가할 수 있습니다.
            // 예를 들어, 이메일을 서버로 보내고 인증번호를 발급받은 후,
            // 그 값을 사용자에게 보내는 등의 작업을 할 수 있습니다.

            // 인증번호 발급 완료 후 메시지 표시
            alert('인증번호가 발송되었습니다.');

            // 인증번호 임의로 설정 (예시로 '123456' 입력)
            const verificationCode = '123456'; 

            // 인증번호를 텍스트 필드에 입력
            document.getElementById('verificationCode').value = verificationCode;
        }
    </script>
</body>
</html>
