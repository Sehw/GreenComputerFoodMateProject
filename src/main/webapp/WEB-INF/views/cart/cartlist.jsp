<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
		.table-custom {
		    border-top: 2px solid #b5b6b7 !important;
	 	 }
		/* 헤더 배경색 */
	    .table-header {
		  background-color: #f8f9fa;
	      text-align: center;
	      font-weight: bold;
	      min-width: 20%;
	    }
	    .table td:last-child {
		  min-width: 100px; /* 최소 너비 지정 */
		  text-align: left; /* 텍스트 중앙 정렬 */
		}
	    /* 내용 텍스트 정렬 */
	    .table tbody td {
	      vertical-align: middle;
	      text-align: center;
	    }
	    
	     .summary-box {
            border: 1px solid #ddd;
            padding: 15px;
            background-color: #fff;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 1rem;
        }

        .summary-row .item {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .summary-row .item span {
            font-weight: bold;
        }

        .text-green {
            color: #28a745;
        }

        .text-gray {
            color: #888;
        }
        
        .pdt_name {
		    text-align: left; /* 텍스트 왼쪽 정렬 */
		    display: flex; /* 플렉스 박스를 사용해 이미지와 텍스트를 배치 */
		    align-items: center; /* 세로 방향으로 이미지와 텍스트를 가운데 정렬 */
		}
		
		.pdt_name img {
		    margin-right: 10px; /* 이미지와 텍스트 사이에 간격을 추가 */
		}
		.qty-input {
		    width: 60px; /* 숫자 3자리 정도의 너비 */
		    text-align: center; /* 숫자가 중앙에 위치하도록 설정 */
		}
		
</style>
</head>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
var contextPath = '${contextPath}';
//컨텍스트패스를 자바스크립트에서도 쓸 수 있게.

$(document).on("focusout", ".qty-input", function() {
    let cartId = $(this).data("cart-id"); // 해당 cart_id 가져오기
    let newQty = $(this).val(); // 입력된 수량 값 가져오기

    if (newQty <= 0) {
        alert("0보다 작은 수는 입력할 수 없습니다.");
        $(this).val($(this).data("original-qty")); // 원래 값으로 되돌리기
        return;
    }
    
    if (newQty >= 100) {
        alert("한번에 100개 이상 주문할 수 없습니다.");
        $(this).val($(this).data("original-qty")); // 원래 값으로 되돌리기
        return;
    }
    
    if (isNaN(newQty)) {
        alert("올바른 수량을 입력하세요.");
        $(this).val($(this).data("original-qty")); // 원래 값으로 되돌리기
        return;
    }

    $.ajax({
        type: "POST",
        url: contextPath + "/cart/updateQty",
        data: { cart_id: cartId, qty: newQty },
        success: function(response) {
            if (response.success) {
                alert("수량이 변경되었습니다.");
                location.reload(); // 변경된 정보 새로고침
            } else {
                alert(response.message || "수량 변경에 실패했습니다.");
            }
        },
        error: function() {
            alert("오류가 발생했습니다. 다시 시도해주세요.");
        }
    });
});
//여기까지 상품 수량 수정 및 비동기 응답/요청 자바스크립트

$(document).on("click", "#deleteSelected", function() {
    // 선택된 항목들의 cart_id를 모은 배열
    var selectedCartIds = [];
    $(".cart-checkbox:checked").each(function() {
        selectedCartIds.push($(this).data("cart-id"));
    });

    if (selectedCartIds.length === 0) {
        alert("삭제할 항목을 선택해주세요.");
        return;
    }
    
    console.log("선택된 cart_id들:", selectedCartIds);

    if (confirm("선택한 항목을 삭제하시겠습니까?")) {
    	$.ajax({
    	    type: "POST",
    	    url: contextPath + "/cart/deleteselected",
    	    contentType: "application/json",  // JSON 형식으로 전송
    	    data: JSON.stringify({ cartIds: selectedCartIds }),  // JSON 형식으로 전달
    	    success: function(response) {
    	    	
    	    	console.log("서버 응답: ", response); // 응답을 콘솔에 출력하여 확인
    	    	console.log("서버 응답 내용물: ", response.success);
    	    	
    	    	
    	        if (response.success) {
    	            alert("선택한 항목이 삭제되었습니다.");
    	            location.reload(); // 페이지 새로고침
    	        } else {
    	            alert(response.message || "삭제에 실패했습니다.");
    	        }
    	    },
    	    error: function(xhr, status, error) {
    	        var errorMessage = "오류가 발생했습니다. 다시 시도해주세요.";
    	        
    	        if (xhr.responseJSON && xhr.responseJSON.message) {
    	            errorMessage = xhr.responseJSON.message; // 서버에서 보낸 메시지를 사용
    	        }

    	        alert(errorMessage);
    	    }
    	});

    }
});

$(document).on("change", ".cart-checkbox", function() {
    let totalAmount = 0;

    // 선택된 체크박스에 해당하는 상품의 금액과 수량을 합산
    $(".cart-checkbox:checked").each(function() {
        let qty = $(this).closest("tr").find(".qty-input").val();
        let price = $(this).data("price"); // data-price 속성으로 가격 가져오기
        
        totalAmount += qty * price;  // 가격 * 수량
    });

    // "선택한 상품의 금액 총합" 부분에 업데이트
    $("#total_amount").text(totalAmount + "원");
});

$(document).ready(function() {
    $("#checkAll").click(function() {
        let allChecked = $(".cart-checkbox").length === $(".cart-checkbox:checked").length;
        $(".cart-checkbox").prop("checked", !allChecked).trigger("change");
    });
});

//개별 삭제 버튼
$(document).on("click", ".delete-product", function() {
    let cartId = $(this).data("cart-id");

    if (!confirm("이 상품을 삭제하시겠습니까?")) { return; }

    $.ajax({
        type: "POST",
        url: contextPath + "/cart/deleteselected",
        contentType: "application/json",
        data: JSON.stringify({ cartIds: [cartId] }), // 선택한 cartId를 배열로 전달
        success: function(response) {
            alert(response.message); // 컨트롤러에서 전달한 메시지 출력
            if (response.success) { location.reload(); } // 성공하면 새로고침
        },
        error: function() {
            alert("서버 오류가 발생했습니다.");
        }
    });
});

$(document).ready(function() {
    // 선택 상품 주문 버튼 클릭
    $("#orderSelected").click(function() {
        let selectedCartIds = [];
        $(".cart-checkbox:checked").each(function() {
            selectedCartIds.push($(this).data("cart-id"));
        });

        if (selectedCartIds.length === 0) {
            alert("주문할 상품을 선택해주세요.");
            return;
        }

        $("#cartIds").val(selectedCartIds.join(",")); // 선택된 cart_id 리스트를 hidden input에 저장
        $("#orderForm").submit(); // order1 페이지로 전송
    });

    // 전체 상품 주문 버튼 클릭
    $("#orderAll").click(function() {
        let allCartIds = [];
        $(".cart-checkbox").each(function() {
            allCartIds.push($(this).data("cart-id"));
        });

        if (allCartIds.length === 0) {
            alert("장바구니에 상품이 없습니다.");
            return;
        }

        $("#cartIds").val(allCartIds.join(",")); // 모든 cart_id 리스트를 hidden input에 저장
        $("#orderForm").submit(); // order1 페이지로 전송
    });
});


</script>

<body>
<div class="container mt-1">	
<h3>장바구니</h3>
<button class="btn btn-secondary btn-sm" id="checkAll">전체 선택</button>
<button class="btn btn-danger btn-sm" id="deleteSelected">선택 삭제</button>

<table class="table table-hover table-custom">
    <thead class="table-header table-primary">
        <tr>
            <td></td>
            <td>판매자</td><td>상품 이름</td><td>수량</td><td>금액</td><td>합계금액</td><td>배송비</td><td>삭제</td>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="entry" items="${groupedCart}">
            <c:forEach var="cart" items="${entry.value}">
                <tr>
                    <td>
					    <input type="checkbox" class="cart-checkbox" data-cart-id="${cart.cart_id}" data-price="${cart.price}" data-qty="${cart.qty}">
					</td>
					<td class="slr_nickname">${entry.key}</td>
					<td class="pdt_name">
					    <img src="${contextPath}/resources/images/${cart.img_path}" alt="pdt_img" class="img-fluid rounded" style="width: 130px; height: 130px; object-fit: cover;">
					    ${cart.pdt_name}
					</td>
					<td class="qty">
					    <input type="number" class="qty-input" data-cart-id="${cart.cart_id}" data-original-qty="${cart.qty}" value="${cart.qty}" min="1">
					</td>
					<td class="pdt_price">${cart.price}원</td>
                    
                    
                    
                    <td>${cart.qty * cart.price}원</td>
                    <td class="ship_fee">3000원</td>
                    <td>
                        <button class="btn btn-danger btn-sm delete-product" data-cart-id="${cart.cart_id}">삭제</button>
                    </td>
                </tr>
            </c:forEach>
        </c:forEach>
    </tbody>
</table>



	<div class="summary-box">
        <div class="summary-row">
        		<div></div>
                <div class="d-flex align-items-center gap-4">
					<div class="item">
					    <span>선택한 상품의 금액 총합</span>
					    <span id="total_amount" class="text-green">0원</span>
					</div>
                    <div class="item">
                        <span class="text-gray">+</span>
                    </div>
                    <div class="item">
                        <span>배송비</span>
                        <span class="text-green">m원</span>
                    </div>
                    <div class="item">
                        <span class="text-gray">=</span>
                    </div>
                    <div class="item">
                        <span>합계</span>
                        <span class="text-green">n+m원</span>
                    </div>
                </div>
            </div>

        </div>
    
	<div class="text-end mt-1">
		<form id="orderForm" action="${contextPath}/order/order1" method="post">
		  <input type="hidden" name="cartIds" id="cartIds">
		  <button type="button" class="btn btn-outline-secondary" id="orderSelected">선택 상품 주문</button>
    	  <button type="button" class="btn btn-success" id="orderAll">전체 상품 주문</button>
	  	</form>
	</div>
</div>
</body>
</html>