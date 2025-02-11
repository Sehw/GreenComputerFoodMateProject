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
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function () {
		function toggleCustomInput() {
		    const select = document.getElementById('email_domain');
		    const customInput = document.getElementById('customMail');
		    
		    if (select.value === 'custom') {
		        customInput.style.display = 'block';
		        select.style.display='none';
		        customInput.focus();
		    } else {
		        customInput.style.display = 'none';
		        customInput.value = ''; // 입력 필드 초기화
		        select.style.display='block';
		    }
		}
		window.toggleCustomInput = toggleCustomInput;
		});
	
	function fn_overlapped(){
	    var _id=$("#byr_id").val();
	    if(_id==''){
	   	 alert("ID를 입력하세요");
	   	 return;
	    }
	    $.ajax({
	       type:"post",
	       async:false,  
	       url:"${contextPath}/member/overlapped.do",
	       dataType:"text",
	       data: {id:_id},
	       success:function (data,textStatus){
	          if(data=='false'){
	       	    alert("사용할 수 있는 ID입니다.");
	       	    $('#byrid_overlapped').prop("disabled", true);
	       	    $('#byr_id').prop("readonly", true);
	          }else{
	        	  alert("중복된 ID입니다.");
	          }
	       },
	       error:function(data,textStatus){
	          alert("에러가 발생했습니다.");
	       },
	       complete:function(data,textStatus){
	          //alert("작업을완료 했습니다");
	       }
	    });  //end ajax	 
	 }	
	
    function prepareFormSubmission() {
		
		if(!document.getElementById("byr_id").readOnly){
			alert("아이디 중복검사를 진행해 주십시오.");
			return false;
		}
		
		if(document.newBuyer.password.value != document.newBuyer.password_confirm.value){
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		
		if((document.newBuyer.email_domain.value == "custom") && !document.newBuyer.customMail.value){
			alert("이메일 도메인을 입력하세요.");
			return false;
		}
        return true;
    }
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
	            <form name="newBuyer" action="${contextPath}/member/addBuyer" method="post" enctype="multipart/form-data" onsubmit="return prepareFormSubmission()">
	                <div class="mb-3 row">
	                    <label class="col-sm-3 col-form-label text-end">아이디</label>
	                    <div class="col-sm-6">
	                    	<div class="d-flex align-items-center">
		                        <input name="byr_id" id="byr_id" type="text" class="form-control me-2" placeholder="id" required>
		                        <input type="button" id="byrid_overlapped" class="btn btn-secondary" value="중복확인" onClick="fn_overlapped()">
		                    </div>
	                    </div>
	                </div>
	                <div class="mb-3 row">
	                    <label class="col-sm-3 col-form-label text-end">비밀번호</label>
	                    <div class="col-sm-5">
	                        <input name="password" id="password" type="password" class="form-control" placeholder="password" required>
	                    </div>
	                </div>
	                <div class="mb-3 row">
	                    <label class="col-sm-3 col-form-label text-end">비밀번호 확인</label>
	                    <div class="col-sm-5">
	                        <input name="password_confirm" id="password_confirm" type="password" class="form-control" placeholder="password confirm" required>
	                    </div>
	                </div>
	                <div class="mb-3 row">
	                    <label class="col-sm-3 col-form-label text-end">성명</label>
	                    <div class="col-sm-5">
	                        <input name="name" id="name" type="text" class="form-control" placeholder="name" required>
	                    </div>
	                </div>
	                <div class="mb-3 row">
	                    <label class="col-sm-3 col-form-label text-end">주민등록번호</label>
	                    <div class="col-sm-7">
	                        <div class="row">
	                        	<div class="d-flex align-items-center">
		                            <div class="col-sm-4">
		                                <input type="text" name="birth_6" id="birth_6" maxlength="6" class="form-control" placeholder="앞 6자리" required>
		                            </div>
		                            	<div class="col-sm-1 d-flex justify-content-center align-items-center" style="width: auto; padding: 0 5px;">
            								<span>-</span>
		        						</div>
		                            <div style="width:35px;">
		                                <input type="text" name="ssn1" id="ssn1" maxlength="1" class="form-control" placeholder="" required>
		                            </div>
		                            <div class="col-sm-1 d-flex justify-content-center align-items-center me-2" style="width: auto; padding: 0 5px;">
            							<span>******</span>
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
					            <input type="text" id="email_id" name="email_id" maxlength="50" class="form-control me-2" placeholder="email" required>
					            <div class="col-sm-1 d-flex justify-content-center align-items-center me-2" style="width: auto; padding: 0 5px;">
            							<span>@</span>
        						</div>
        						<!-- 직접 입력 필드 -->
					            <input type="text" name="customMail" id="customMail" class="form-control me-2" placeholder="직접 입력" style="display:none; max-width: 200px;">
					            <!-- 이메일 선택 -->
					            <select id="email_domain" name="email_domain" class="form-select" style="max-width: 200px;" onchange="toggleCustomInput()">
					                <option value="naver.com">naver.com</option>
					                <option value="daum.net">daum.net</option>
					                <option value="gmail.com">gmail.com</option>
					                <option value="nate.com">nate.com</option>
					                <option value="custom">직접 입력</option>
					            </select>
					            
					            
					        </div>
					    </div>
					</div>
	                <div class="mb-3 row">
	                    <label class="col-sm-3 col-form-label text-end">전화번호</label>
	                    <div class="col-sm-5">
	                        <input name="phone_num" id="phone_num" type="text" class="form-control" placeholder="phone" required>
	                    </div>
	                </div>

						<div class="mb-3 row">
						    <div class="col-12 text-center">
						        <input type="submit" class="btn btn-success" value="회원가입">
						        <input type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/member/signUpSelectForm'" value="취소">
						    	<input type="reset" id="resetBtn" class="btn btn-success" value="다시입력">
						    </div>
						</div>
	            </form>
	            <script>
	            	document.getElementById("resetBtn").addEventListener("click", function() {
	            		// 1. 중복 검사 버튼 다시 활성화
	            	    document.getElementById("byrid_overlapped").disabled = false;
	            	    document.getElementById("byr_id").removeAttribute("readonly");

	            	    // 2. 직접 입력 이메일 필드 리셋 및 비활성화
	            	    document.getElementById("customMail").value = "";
	            	    document.getElementById("customMail").style.display = "none";

	            	    // 3. 이메일 도메인 선택을 기본값(naver.com)으로 변경
	            	    document.getElementById("email_domain").value = "naver.com";
	            	    document.getElementById("email_domain").style.display = "block";
	            	});
	            </script>
	        </div>
	    </div>
	</div>
</div>
</body>
</html>