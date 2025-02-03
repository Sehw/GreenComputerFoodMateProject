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
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		  new daum.Postcode({
		    oncomplete: function(data) {
		      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
		      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
		      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		      var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
		      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		        extraRoadAddr += data.bname;
		      }
		      // 건물명이 있고, 공동주택일 경우 추가한다.
		      if(data.buildingName !== '' && data.apartment === 'Y'){
		        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		      }
		      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		      if(extraRoadAddr !== ''){
		        extraRoadAddr = ' (' + extraRoadAddr + ')';
		      }
		      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		      if(fullRoadAddr !== ''){
		        fullRoadAddr += extraRoadAddr;
		      }
	
		      // 우편번호와 주소 정보를 해당 필드에 넣는다.
		      document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
		      document.getElementById('roadAddress').value = fullRoadAddr;
		     
		    }
		  }).open();
		}
	
	document.addEventListener('DOMContentLoaded', function () {
		function toggleCustomInput() {
		    const select = document.getElementById('mail2');
		    const customInput = document.getElementById('customMail');
		    
		    if (select.value === 'custom') {
		        customInput.style.display = 'block';
		        customInput.focus();
		    } else {
		        customInput.style.display = 'none';
		        customInput.value = ''; // 입력 필드 초기화
		    }
		}
		window.toggleCustomInput = toggleCustomInput;
		});
</script>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
<div class="d-flex justify-content-center align-items-center">
	<div class="signUp-container">
	    <div class="row justify-content-center">
	        <div class="col-md-8">
	            <h1 class="mb-4 text-center">일반 회원 가입</h1>
	            <form name="newMember" action="${contextPath}/member/addBuyer" method="post" enctype="multipart/form-data">
	                <div class="mb-3 row">
	                    <label class="col-sm-3 col-form-label text-end">아이디</label>
	                    <div class="col-sm-6">
	                    	<div class="d-flex align-items-center">
		                        <input name="id" id="id" type="text" class="form-control me-2" placeholder="id">
		                        <input type="reset" class="btn btn-secondary" value="중복확인">
		                    </div>
	                    </div>
	                </div>
	                <div class="mb-3 row">
	                    <label class="col-sm-3 col-form-label text-end">비밀번호</label>
	                    <div class="col-sm-5">
	                        <input name="password" id="password" type="password" class="form-control" placeholder="password">
	                    </div>
	                </div>
	                <div class="mb-3 row">
	                    <label class="col-sm-3 col-form-label text-end">비밀번호 확인</label>
	                    <div class="col-sm-5">
	                        <input name="password_confirm" id="password_confirm" type="password" class="form-control" placeholder="password confirm">
	                    </div>
	                </div>
	                <div class="mb-3 row">
	                    <label class="col-sm-3 col-form-label text-end">성명</label>
	                    <div class="col-sm-5">
	                        <input name="name" id="name" type="text" class="form-control" placeholder="name">
	                    </div>
	                </div>
	                <div class="mb-3 row">
	                    <label class="col-sm-3 col-form-label text-end">주민등록번호</label>
	                    <div class="col-sm-7">
	                        <div class="row">
	                        	<div class="d-flex align-items-center">
		                            <div class="col-sm-4">
		                                <input type="text" name="birth_6" id="birth_6" maxlength="6" class="form-control" placeholder="앞 6자리"">
		                            </div>
		                            	<div class="col-sm-1 d-flex justify-content-center align-items-center" style="width: auto; padding: 0 5px;">
            								<span>-</span>
		        						</div>
		                            <div class="col-sm-2">
		                                <input type="text" name="ssn1" id="ssn1" maxlength="1" class="form-control" placeholder="1자리">
		                            </div>
		                         </div>
	                        </div>
	                    </div>
	                </div>
					<div class="mb-3 row">
					    <label class="col-sm-3 col-form-label text-end">이메일</label>
					    <div class="col-sm-8">
					        <div class="d-flex align-items-center">
					            <!-- 이메일 입력 -->
					            <input type="text" id="email_id" name="email_id" maxlength="50" class="form-control me-2" placeholder="email">
					            <div class="col-sm-1 d-flex justify-content-center align-items-center me-2" style="width: auto; padding: 0 5px;">
            							<span>@</span>
        						</div>
					            <!-- 이메일 선택 -->
					            <select id="email_domain" name="email_domain" class="form-select me-2" style="max-width: 200px;" onchange="toggleCustomInput()">
					                <option value="naver.com">naver.com</option>
					                <option value="daum.net">daum.net</option>
					                <option value="gmail.com">gmail.com</option>
					                <option value="nate.com">nate.com</option>
					                <option value="custom">직접 입력</option>
					            </select>
					            
					            <!-- 직접 입력 필드 -->
					            <input type="text" name="customMail" id="customMail" class="form-control" placeholder="직접 입력" style="display:none; max-width: 200px;">
					        </div>
					    </div>
					</div>
	                <div class="mb-3 row">
	                    <label class="col-sm-3 col-form-label text-end">전화번호</label>
	                    <div class="col-sm-5">
	                        <input name="phone_num" id="phone_num" type="text" class="form-control" placeholder="phone">
	                    </div>
	                </div>
	                <div class="mb-3 row">
	                    <label class="col-sm-3 col-form-label text-end">우편번호</label>
	                    <div class="col-sm-6">
	                    	<div class="d-flex align-items-center">
	                        	<input name="zipcode" id="zipcode" type="text" class="form-control me-2" placeholder="zipcode">
	                        	<p class="mb-0"><a href="javascript:execDaumPostcode()">우편번호 찾기</a></p>
	                    	</div>
	                    </div>
	                </div>
	                <div class="mb-3 row">
	                    <label class="col-sm-3 col-form-label text-end">주소</label>
	                    <div class="col-sm-9">
	                        <input name="roadAddress" id="roadAddress" type="text" class="form-control" placeholder="roadAddress">
	                    </div>
	                </div>
	                <div class="mb-3 row">
	                    <label class="col-sm-3 col-form-label text-end">나머지 주소</label>
	                    <div class="col-sm-9">
	                        <input name="remainaddress" id="remainaddress" type="text" class="form-control" placeholder="address">
	                    </div>
	                </div>
						<div class="mb-3 row">
						    <div class="col-12 text-center">
						        <input type="submit" class="btn btn-success" value="회원가입">
						        <input type="reset" class="btn btn-secondary" value="취소">
						    </div>
						</div>
	            </form>
	        </div>
	    </div>
	</div>
</div>
</body>
</html>