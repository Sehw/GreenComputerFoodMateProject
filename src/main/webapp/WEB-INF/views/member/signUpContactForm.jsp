<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<style>
	   .signUp-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
        }
        .terms-box {
            max-height: 200px;
            overflow-y: auto;
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .btn-submit {
            background-color: #007bff;
            color: white;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }
</style>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
<div class="d-flex justify-content-center align-items-center">
	<div class="signUp-container">
	    <div class="row justify-content-center">
	        <div class="col-md-8">
	            <h1 class="mb-4 text-center">약관 동의</h1>
		           <div class="container mt-5">
				        <div class="terms-box">
				            <h5>가. 개인정보의 수집 및 이용 목적</h5>
				            <p>
				                푸드메이트는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
				            </p>
				            <h5>나. 정보주체와 법정대리인의 권리ㆍ의무 및 행사방법</h5>
				            <p>
				                ① 정보주체(만 14세 미만인 경우에는 법정대리인을 말함)는 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.<br>
				                ② 제1항에 따른 권리 행사는 개인정보보호법 시행규칙 별지 제8호 서식에 따라 작성 후 서면, 전자우편 등을 통하여 하실 수 있으며, 기관은 이에 대해 지체 없이 조치하겠습니다.<br>
				                ③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
				            </p>
				            <h5>다. 수집하는 개인정보의 항목</h5>
				            <p>국가공간정보포털 회원정보(필수): 이름, 이메일(아이디), 비밀번호</p>
				            <h5>라. 개인정보의 보유 및 이용기간</h5>
				            <p>
				                푸드메이트는 법령에 따른 개인정보 보유ㆍ이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유ㆍ이용기간 내에서 개인정보를 처리ㆍ보유합니다.<br>
				                - 수집근거: 정보주체의 동의<br>
				                - 보존기간: 회원 탈퇴 요청 전까지(1년 경과 시 재동의)<br>
				                - 보존근거: 정보주체의 동의
				            </p>
				            <h5>마. 동의 거부 권리 및 동의 거부에 따른 불이익</h5>
				            <p>
				                위 개인정보의 수집 및 이용에 대한 동의를 거부할 수 있으나, 동의를 거부할 경우 회원 가입이 제한됩니다.
				            </p>
				        </div>
				
				        <!-- 동의 체크박스 -->
				        <div class="form-check mb-3">
				            <input class="form-check-input" type="checkbox" id="termsCheck" required>
				            <label class="form-check-label" for="termsCheck">
				                약관에 동의합니다.
				            </label>
				        </div>
				
				        <!-- 제출 버튼 -->
				        <div class="text-center">
				        	<button type="submit" id="submitButton" class="btn btn-success px-4" disabled>가입 하기</button>
				        </div>
			    </div>
	        </div>
	    </div>
	</div>
</div>
<script>
	document.getElementById("termsCheck").addEventListener("change", function() {
	    var submitButton = document.getElementById("submitButton");
	
	    if (this.checked) {
	    	submitButton.disabled = false; // 버튼 활성화
	    } else {
	    	submitButton.disabled = true; // 버튼 비활성화
	    }
	});
	
	document.getElementById("submitButton").addEventListener("click", function() {
	    if (!this.disabled) {
	        window.location.href = "${contextPath}/member/signUpSelectForm.do"; // 이동할 페이지
	    }
	});
</script>
</body>
</html>