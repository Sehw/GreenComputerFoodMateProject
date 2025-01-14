<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
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
</head>
<body>
<div class="container mt-1">
	<div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
      		<h5 class="mb-0 fw-bold">회원정보 수정</h5>
      		</div>
      		<div class="d-flex justify-content-start align-items-center">
				<div class="signUp-container">
				    <div class="row justify-content-start">
				        <div class="col-md-8">
				        	<form name="newMember" action="processAddMember.jsp" method="post" onsubmit="return prepareFormSubmission()">
				                <div class="mb-3 row">
				                    <label class="col-sm-3 col-form-label text-end">아이디</label>
				                    <div class="col-sm-5">
				                        <input name="id" type="text" class="form-control" placeholder="id" disabled>
				                    </div>
				                </div>
				                <div class="mb-3 row">
				                    <label class="col-sm-3 col-form-label text-end">비밀번호</label>
				                    <div class="col-sm-5">
				                        <input name="password" type="password" class="form-control" placeholder="password">
				                    </div>
				                </div>
				                <div class="mb-3 row">
				                    <label class="col-sm-3 col-form-label text-end">비밀번호 확인</label>
				                    <div class="col-sm-5">
				                        <input name="password_confirm" type="password" class="form-control" placeholder="password confirm">
				                    </div>
				                </div>
				                <div class="mb-3 row">
				                    <label class="col-sm-3 col-form-label text-end">성명</label>
				                    <div class="col-sm-5">
				                        <input name="name" type="text" class="form-control" placeholder="name">
				                    </div>
				                </div>
				                <div class="mb-3 row">
				                    <label class="col-sm-3 col-form-label text-end">성별</label>
				                    <div class="col-sm-6 d-flex align-items-center">
				                        <input name="gender" type="radio" value="남" class="me-2"> 남
				                        <input name="gender" type="radio" value="여" class="ms-4 me-2"> 여
				                    </div>
				                </div>
				                <div class="mb-3 row">
				                    <label class="col-sm-3 col-form-label text-end">생일</label>
				                    <div class="col-sm-7">
				                        <div class="row">
				                            <div class="col-sm-4">
				                                <input type="text" name="birthyy" maxlength="4" class="form-control" placeholder="년(4자)">
				                            </div>
				                            <div class="col-sm-4">
				                                <select name="birthmm" class="form-select">
				                                    <option value="">월</option>
				                                    <option value="01">1</option>
				                                    <option value="02">2</option>
				                                    <option value="03">3</option>
				                                    <option value="04">4</option>
				                                    <option value="05">5</option>
				                                    <option value="06">6</option>
				                                    <option value="07">7</option>
				                                    <option value="08">8</option>
				                                    <option value="09">9</option>
				                                    <option value="10">10</option>
				                                    <option value="11">11</option>
				                                    <option value="12">12</option>
				                                </select>
				                            </div>
				                            <div class="col-sm-3">
				                                <input type="text" name="birthdd" maxlength="2" class="form-control" placeholder="일">
				                            </div>
				                        </div>
				                    </div>
				                </div>
								<div class="mb-3 row">
								    <label class="col-sm-3 col-form-label text-end">이메일</label>
								    <div class="col-sm-8">
								        <div class="d-flex align-items-center">
								            <!-- 이메일 입력 -->
								            <input type="text" id="mail1" name="mail1" maxlength="50" class="form-control me-2" placeholder="email">
								            <div class="col-sm-1 d-flex justify-content-center align-items-center me-2" style="width: auto; padding: 0 5px;">
			            							<span>@</span>
			        						</div>
											<input type="text" name="mail2" maxlength="50" class="form-control" placeholder="email" >
								            
								            <!-- 직접 입력 필드 -->
								            <input type="text" name="customMail" id="customMail" class="form-control" placeholder="직접 입력" style="display:none; max-width: 200px;">
								        </div>
								    </div>
								</div>
				                <div class="mb-3 row">
				                    <label class="col-sm-3 col-form-label text-end">전화번호</label>
				                    <div class="col-sm-5">
				                        <input name="phone" type="text" class="form-control" placeholder="phone">
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
									        <input type="submit" class="btn btn-success" value="정보수정">
									        <input type="reset" class="btn btn-secondary" value="취소">
									    </div>
									</div>
				            </form>
			    		</div>
					</div>
				</div>
    		</div>
</div>
</body>
</html>