<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 목록</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/resources/css/side.css" rel="stylesheet" type="text/css"/>
   	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        #top-menu {
            width: 100%;
            background-color: #f4f4f4;
            border-bottom: 1px solid #ddd;
        }

        .main-layout {
            display: flex;
            flex: 1;
            overflow: auto;
        }

        #side-menu {
            width: 200px;
            box-sizing: border-box;
        }

        .content {
            flex: 1;
            padding: 3%;
            box-sizing: border-box;
            overflow: auto;
        }

        .title {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        /* 카테고리 탭 스타일 */
        .category-tabs {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
        }

        .category-tab {
            margin: 0 10px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            padding: 5px 10px;
            border: 1px solid transparent;
            border-radius: 5px;
        }


        /* 상품 컨테이너 */
        .product-container {
            display: none;
        }

        .product-container.active {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
        }

        .product-card {
            width: 30%;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            text-align: center;
            padding: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .product-image {
            width: 100%;
            height: 150px;
            background-color: #eaeaea;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 10px;
        }

        .product-name {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .product-price {
            font-size: 16px;
            color: #555;
            margin-bottom: 10px;
        }


        .button {
            padding: 10px 15px;
            font-size: 14px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
        }

        .button.delete {
            background-color: #dc3545;
        }
        /* 카테고리 탭 스타일 */
		.category-tabs {
		    display: flex;
		    justify-content: center;
		    margin-bottom: 20px;
		    border-bottom: 2px solid #ddd;
		    padding-bottom: 10px;
		}
		
		.category-tab {
		    margin: 0 10px;
		    font-size: 18px;
		    font-weight: bold;
		    cursor: pointer;
		    padding: 5px 10px;
		    border: 1px solid transparent;
		    border-radius: 5px;
		    transition: all 0.3s ease; /* 부드러운 애니메이션 효과 */
		}
		
		.category-tab.active {
		    transform: scale(1.05); /* 살짝 확대 효과 */
		}
		
		.category-tab:hover {
		    background-color: #e9f5ff; /* 마우스 오버 시 배경색 */
		    border-color: #007bff;
		}
		img{
        	width: 100%;
            height: auto;
            border-radius: 5px;
        }
        
        input[type="text"] {
            border: none; /* 테두리 없애기 */
            background-color: #f9f9f9; /* 배경색을 body와 같게 */
            padding: 10px; /* 여백 추가 */
            font-size: 16px; /* 글자 크기 조정 */
            text-align: center;
        }
    </style>
    <script>
        // 탭 전환 함수
        function showCategory(categoryId) {
            const tabs = document.querySelectorAll('.category-tab');
            const containers = document.querySelectorAll('.product-container');

            tabs.forEach(tab => tab.classList.remove('active'));
            containers.forEach(container => container.classList.remove('active'));

            document.getElementById(categoryId).classList.add('active');
            document.querySelector(`[data-target="${categoryId}"]`).classList.add('active');
        }
    </script>
</head>
<body>
    <div id="top-menu">
        <jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
    </div>

    <div class="main-layout">

        <div class="content">
            <div class="title">상품 목록</div>
            <!-- 카테고리 탭 -->
            <div class="category-tabs">
            	<input type="hidden" id="id" value="${sessionScope.sId }">
                <div class="category-tab active" data-target="category1" onclick="showCategory('category1')">인형</div>
                <div class="category-tab" data-target="category2" onclick="showCategory('category2')">텀블러</div>
                <div class="category-tab" data-target="category3" onclick="showCategory('category3')">접시</div>
            </div>

            <!-- 카테고리별 상품 -->
            <div class="product-container active" id="category1">
            <c:forEach var="doll" items="${dollList}">
                <div class="product-card">
                    <img alt="" src="/resources/upload/${doll.product_img}">
                    <div class="product-name">
                    	<input type="text" class="productName" value="${doll.product_name }">
                    </div>
                    <div class="product-price" >
                    	<input type="text" class="amount" value="${doll.product_price }원">
                    	<input type="text" id="member_id" hidden>
	                   	<input type="text" id="member_name" hidden>
	                   	<input type="text" id="member_phone" hidden>
	                   	<input type="text" id="member_email" hidden>
	                   	<input type="text" id="member_address1" hidden>
	                   	<input type="text" id="member_address2" hidden>
	                   	<input type="text" id="member_post_code" hidden>
                    </div>
                    <div class="button-group">
                    	<button class="button edit" onclick="payment(this)">구매하기</button>
                    </div>
                </div>
            </c:forEach>
            </div>

            <div class="product-container" id="category2">
                <c:forEach var="tumbler" items="${tumblerList}">
                <div class="product-card">
                    <img alt="" src="/resources/upload/${tumbler.product_img}">
                    <div class="product-name">
                    	<input type="text" class="productName2" value="${tumbler.product_name }">
                    </div>
                    <div class="product-price" >
                    	<input type="text" class="amount2" value="${tumbler.product_price }원">
                    </div>
                    <div class="button-group">
                       <button class="button edit" onclick="payment2(this)">구매하기</button>
                    </div>
                </div>
            </c:forEach>
            </div>

            <div class="product-container" id="category3">
            <c:forEach var="dish" items="${dishList}">
                <div class="product-card">
                    <img alt="" src="/resources/upload/${dish.product_img}">
                    <div class="product-name">
                    	<input type="text" class="productName3" value="${dish.product_name }">
                    </div>
                    <div class="product-price" >
                    	<input type="text" class="amount3" value="${dish.product_price }원">
                    </div>
                    <div class="button-group">
                    <button class="button edit" onclick="payment3(this)">구매하기</button>
                    </div>
                </div>
            </c:forEach>
            </div>

        </div>
    </div>
    <script type="text/javascript">
// 	 	객체 초기화
		var IMP = window.IMP;
		IMP.init("imp65450054");
		let id = $("#id").val();
		console.log(id);
			
		function payment(button){
			const productCard = button.closest('.product-card');
			const amountInput = productCard.querySelector('.amount');
		 	const amountValue = amountInput.value.replace('원', '').trim(); // "원" 제거 및 공백 제거
		    const amount = parseInt(amountValue, 10); // 문자열을 정수로 변환
		    const productNameSelect = productCard.querySelector('.productName');
		    const productName = productNameSelect.value;
		    console.log(productName);
			console.log(amount);
			
			if (id != "") {
		    	$.ajax({
			        url: 'paymentGetMember2',
			        type: 'GET',
			        data: {
			        	id: id
			        },
			        dataType: "JSON"
				}).done(function(result) {
	 				console.log(JSON.stringify(result));
					if(result){
						console.log(result.member_id);
						$("#member_id").val(result.member_id);
						$("#member_name").val(result.member_name);
						$("#member_phone").val(result.member_phone);
						$("#member_email").val(result.member_email);
						$("#member_address1").val(result.member_address1);
						$("#member_address2").val(result.member_address2);
						$("#member_post_code").val(result.member_post_code);
						
						//결제창에 들어갈 데이터 작업
				    	let memberId = $("#member_id").val();
				//     	console.log(id);
				    	let name = $("#member_name").val();
				    	let phone = $("#member_phone").val();
				    	let email = $("#member_email").val();
				    	let address = $("#member_address1").val() + " " + $("#member_address2").val();
				//     	console.log(address);
				    	let postCode = $("#member_post_code").val();
						let now = new Date();
				        console.log(now);
				    	let year = now.getFullYear();
				    	console.log(year);
				    	let month = now.getMonth() + 1;
				    	if(month >= 1 && month <= 9) {
				    		month = "0" + month;
				    	}
				    	let date = now.getDate();
				    	let hour = now.getHours();
				    	hour = (hour < 10)? "0" + hour : hour;
				    	let min = (now.getMinutes() < 10)? "0" + now.getMinutes() : now.getMinutes();
				    	let sec = (now.getSeconds() < 10)? "0" + now.getSeconds() : now.getSeconds();
				    	let random = Math.floor(Math.random() * 1000);
				    	let code = "ord" + year + month + date + hour + min + sec + "-" + random;
				    	console.log(code);
				    	
				    	// 결제창 호출
						IMP.request_pay(
					    		  {
					    		    channelKey: "channel-key-04137c4a-aa71-4ede-8f14-23bb0f17775d",
					    		    pay_method: "card",
					    		    merchant_uid: code, //상점에서 생성한 고유 주문번호
					    		    name: productName,
					    		    amount: amount,
					    		    buyer_email: email,
					    		    buyer_name: memberId,
					    		    buyer_tel: phone, //필수 파라미터 입니다.
					    		    buyer_addr: address,
					    		    buyer_postcode: postCode,
					    		    escrow: true, //에스크로 결제인 경우 설정
					    		    bypass: {
					    		      acceptmethod: "easypay", // 간편결제 버튼을 통합결제창에서 제외하려면 "noeasypay"
//				 	    		      acceptmethod: "cardpoint", // 카드포인트 사용시 설정(PC)
					    		    },
					    		  },
					    		  function (rsp) {
				 	    			console.log(rsp); //수신 정보 확인용
					    			// callback
									if (rsp.success) {
										$.ajax({
											url: "pamentSetMember2",
											type: "GET",
											data: {
												imp_uid: rsp.imp_uid,
												merchant_uid: rsp.merchant_uid,
												name: rsp.name,
												buyer_name: rsp.buyer_name,
												buyer_tel: rsp.buyer_tel,
												amount: rsp.paid_amount,
												pay_method: rsp.pay_method
											}
										}).done(function(result) {
											if(result == "true"){
										 	alert('결제 완료되었습니다');
										 	
											} else {
												alert('데이터 저장 실패!');
											}
										}).fail(function() {
												alert('데이터 저장 실패!');
										});
									} else {
									    alert('결제 실패: ' + rsp.error_msg);
									}
								}
							);
					} else {
						alert("조회실패!")
					}
					
				}).fail(function() {
					alert("결제 할 수 없습니다.");
				});
		    } else {
		        // 조건이 거짓일 경우 처리할 내용
		        alert('로그인을 해주세요.');
		    }
		}
	
		function payment2(button){
			const productCard = button.closest('.product-card');
			const amountInput = productCard.querySelector('.amount2');
		 	const amountValue = amountInput.value.replace('원', '').trim(); // "원" 제거 및 공백 제거
		    const amount = parseInt(amountValue, 10); // 문자열을 정수로 변환
		    const productNameSelect = productCard.querySelector('.productName2');
		    const productName = productNameSelect.value;
		    console.log(productName);
			console.log(amount);
			
			if (id != "") {
		    	$.ajax({
			        url: 'paymentGetMember2',
			        type: 'GET',
			        data: {
			        	id: id
			        },
			        dataType: "JSON"
				}).done(function(result) {
	 				console.log(JSON.stringify(result));
					if(result){
						console.log(result.member_id);
						$("#member_id").val(result.member_id);
						$("#member_name").val(result.member_name);
						$("#member_phone").val(result.member_phone);
						$("#member_email").val(result.member_email);
						$("#member_address1").val(result.member_address1);
						$("#member_address2").val(result.member_address2);
						$("#member_post_code").val(result.member_post_code);
						
						//결제창에 들어갈 데이터 작업
				    	let memberId = $("#member_id").val();
				//     	console.log(id);
				    	let name = $("#member_name").val();
				    	let phone = $("#member_phone").val();
				    	let email = $("#member_email").val();
				    	let address = $("#member_address1").val() + " " + $("#member_address2").val();
				//     	console.log(address);
				    	let postCode = $("#member_post_code").val();
						let now = new Date();
				        console.log(now);
				    	let year = now.getFullYear();
				    	console.log(year);
				    	let month = now.getMonth() + 1;
				    	if(month >= 1 && month <= 9) {
				    		month = "0" + month;
				    	}
				    	let date = now.getDate();
				    	let hour = now.getHours();
				    	hour = (hour < 10)? "0" + hour : hour;
				    	let min = (now.getMinutes() < 10)? "0" + now.getMinutes() : now.getMinutes();
				    	let sec = (now.getSeconds() < 10)? "0" + now.getSeconds() : now.getSeconds();
				    	let random = Math.floor(Math.random() * 1000);
				    	let code = "ord" + year + month + date + hour + min + sec + "-" + random;
				    	console.log(code);
				    	
				    	// 결제창 호출
						IMP.request_pay(
					    		  {
					    		    channelKey: "channel-key-04137c4a-aa71-4ede-8f14-23bb0f17775d",
					    		    pay_method: "card",
					    		    merchant_uid: code, //상점에서 생성한 고유 주문번호
					    		    name: productName,
					    		    amount: amount,
					    		    buyer_email: email,
					    		    buyer_name: memberId,
					    		    buyer_tel: phone, //필수 파라미터 입니다.
					    		    buyer_addr: address,
					    		    buyer_postcode: postCode,
					    		    escrow: true, //에스크로 결제인 경우 설정
					    		    bypass: {
					    		      acceptmethod: "easypay", // 간편결제 버튼을 통합결제창에서 제외하려면 "noeasypay"
	//			 	    		      acceptmethod: "cardpoint", // 카드포인트 사용시 설정(PC)
					    		    },
					    		  },
					    		  function (rsp) {
				 	    			console.log(rsp); //수신 정보 확인용
					    			// callback
									if (rsp.success) {
										$.ajax({
											url: "pamentSetMember2",
											type: "GET",
											data: {
												imp_uid: rsp.imp_uid,
												merchant_uid: rsp.merchant_uid,
												name: rsp.name,
												buyer_name: rsp.buyer_name,
												buyer_tel: rsp.buyer_tel,
												amount: rsp.paid_amount,
												pay_method: rsp.pay_method
											}
										}).done(function(result) {
											if(result == "true"){
										 	alert('결제 완료되었습니다');
										 	
											} else {
												alert('데이터 저장 실패!');
											}
										}).fail(function() {
												alert('데이터 저장 실패!');
										});
									} else {
									    alert('결제 실패: ' + rsp.error_msg);
									}
								}
							);
					} else {
						alert("조회실패!")
					}
					
				}).fail(function() {
					alert("결제 할 수 없습니다.");
				});
		    } else {
		        // 조건이 거짓일 경우 처리할 내용
		        alert('로그인을 해주세요.');
		    }
		}
		
		function payment3(button){
			const productCard = button.closest('.product-card');
			const amountInput = productCard.querySelector('.amount3');
		 	const amountValue = amountInput.value.replace('원', '').trim(); // "원" 제거 및 공백 제거
		    const amount = parseInt(amountValue, 10); // 문자열을 정수로 변환
		    const productNameSelect = productCard.querySelector('.productName3');
		    const productName = productNameSelect.value;
		    console.log(productName);
			console.log(amount);
		    
			if (id != "") {
		    	$.ajax({
			        url: 'paymentGetMember2',
			        type: 'GET',
			        data: {
			        	id: id
			        },
			        dataType: "JSON"
				}).done(function(result) {
	 				console.log(JSON.stringify(result));
					if(result){
						console.log(result.member_id);
						$("#member_id").val(result.member_id);
						$("#member_name").val(result.member_name);
						$("#member_phone").val(result.member_phone);
						$("#member_email").val(result.member_email);
						$("#member_address1").val(result.member_address1);
						$("#member_address2").val(result.member_address2);
						$("#member_post_code").val(result.member_post_code);
						
						//결제창에 들어갈 데이터 작업
				    	let memberId = $("#member_id").val();
				//     	console.log(id);
				    	let name = $("#member_name").val();
				    	let phone = $("#member_phone").val();
				    	let email = $("#member_email").val();
				    	let address = $("#member_address1").val() + " " + $("#member_address2").val();
				//     	console.log(address);
				    	let postCode = $("#member_post_code").val();
						let now = new Date();
				        console.log(now);
				    	let year = now.getFullYear();
				    	console.log(year);
				    	let month = now.getMonth() + 1;
				    	if(month >= 1 && month <= 9) {
				    		month = "0" + month;
				    	}
				    	let date = now.getDate();
				    	let hour = now.getHours();
				    	hour = (hour < 10)? "0" + hour : hour;
				    	let min = (now.getMinutes() < 10)? "0" + now.getMinutes() : now.getMinutes();
				    	let sec = (now.getSeconds() < 10)? "0" + now.getSeconds() : now.getSeconds();
				    	let random = Math.floor(Math.random() * 1000);
				    	let code = "ord" + year + month + date + hour + min + sec + "-" + random;
				    	console.log(code);
				    	
				    	// 결제창 호출
						IMP.request_pay(
					    		  {
					    		    channelKey: "channel-key-04137c4a-aa71-4ede-8f14-23bb0f17775d",
					    		    pay_method: "card",
					    		    merchant_uid: code, //상점에서 생성한 고유 주문번호
					    		    name: productName,
					    		    amount: amount,
					    		    buyer_email: email,
					    		    buyer_name: memberId,
					    		    buyer_tel: phone, //필수 파라미터 입니다.
					    		    buyer_addr: address,
					    		    buyer_postcode: postCode,
					    		    escrow: true, //에스크로 결제인 경우 설정
					    		    bypass: {
					    		      acceptmethod: "easypay", // 간편결제 버튼을 통합결제창에서 제외하려면 "noeasypay"
	//			 	    		      acceptmethod: "cardpoint", // 카드포인트 사용시 설정(PC)
					    		    },
					    		  },
					    		  function (rsp) {
				 	    			console.log(rsp); //수신 정보 확인용
					    			// callback
									if (rsp.success) {
										$.ajax({
											url: "pamentSetMember2",
											type: "GET",
											data: {
												imp_uid: rsp.imp_uid,
												merchant_uid: rsp.merchant_uid,
												name: rsp.name,
												buyer_name: rsp.buyer_name,
												buyer_tel: rsp.buyer_tel,
												amount: rsp.paid_amount,
												pay_method: rsp.pay_method
											}
										}).done(function(result) {
											if(result == "true"){
										 	alert('결제 완료되었습니다');
										 	
											} else {
												alert('데이터 저장 실패!');
											}
										}).fail(function() {
												alert('데이터 저장 실패!');
										});
									} else {
									    alert('결제 실패: ' + rsp.error_msg);
									}
								}
							);
					} else {
						alert("조회실패!")
					}
					
				}).fail(function() {
					alert("결제 할 수 없습니다.");
				});
		    } else {
		        // 조건이 거짓일 경우 처리할 내용
		        alert('로그인을 해주세요.');
		    }
			
		}
    
    
    
    
    
    
    
    
    
    </script>
</body>
</html>
