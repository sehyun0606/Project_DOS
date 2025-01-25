<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Membership</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        function toggleCheckboxes(checkbox) {
            const checkboxes = document.querySelectorAll('.dependent-checkbox');
            checkboxes.forEach(cb => {
                cb.checked = checkbox.checked; // "모두 동의합니다." 체크박스 상태에 따라 체크
            });
        }
    </script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <style>
    
        body {
            background-color: #f8f9fa; /* 배경색 */
        }
        .membership-card {
            background-color: #e7f1ff; /* 카드 배경색 */
            border-radius: 10px; /* 모서리 둥글게 */
            padding: 20px; /* 패딩 추가 */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
            text-align: center; /* 텍스트 중앙 정렬 */
            margin-bottom: 20px; /* 카드 간격 */
        }
        h1 {
            text-align: center;
            margin: 30px 0; /* 제목과 카드 간격 */
            font-weight: bold;
        }
        .btn-custom {
            width: 300px; /* 버튼 너비 100% */
        }
        
        .button-container {
            display: flex;
            justify-content: center; /* 버튼을 중앙 정렬 */
            gap: 10px; /* 버튼 간격 */
            margin-top: 20px; /* 버튼 위쪽 여백 */
        }
        
         .checkbox-label {
            cursor: pointer; /* 커서를 포인터로 변경 */
        }
    </style>
</head>
<body>
	<nav>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</nav>

	<div class="container mt-5">
		<input type="hidden" id="id" value="${sessionScope.sId}">
	    <h1>MEMBERSHIP</h1>
	    <div class="row">
	        <div class="col-md-4 membership-card">
	            <img src="${pageContext.request.contextPath}/resources/images/whiteSun.png" alt="WHITH" class="mb-3" />
	            <h3 style="color: white">WHITE</h3>
	            <hr>
	            <p><b>선정 기준</b>: 7회 이상 방문 시 자동 습득 또는,<br> 멤버쉽 바로 결제</p>
	            <p><b>혜택 내용</b>: 전체 가격에 5% 포인트 적립,<br>
									 식전빵 +1,<br>
								     연 1회 쿠폰 지급(스테이크 1개 무료)</p>
	            <p><b>혜택 기간</b>: 2025-01-01 ~ 2025-12-31</p>
	        </div>
	        <div class="col-md-4 membership-card">
	            <img src="${pageContext.request.contextPath}/resources/images/redSun.png" alt="RED" class="mb-3" />
	            <h3 style="color: red">RED</h3>
	            <hr>
	            <p><b>선정 기준</b>: 화이트 등급에서 포인트 30000점 이상<br> 적립 시 승급, 월간 1번 이상 방문</p>
	            <p><b>혜택 내용</b>: 전체 가격에 5% 포인트 적립,<br>
	            			  식전빵 +1,<br>
	                          연 1회 쿠폰 지급(스테이크 1개 무료)</p>
	            <p><b>혜택 기간</b>: 2025-01-01 ~ 2025-12-31</p>
	        </div>
	        <div class="col-md-4 membership-card">
	            <img src="${pageContext.request.contextPath}/resources/images/blackSun.png" alt="BLACK" class="mb-3" />
	            <h3>BLACK</h3>
	            <hr>
	            <p><b>선정 기준</b>: 레드 등급 1년 유지시 승급</p>
	            <p><b>혜택 내용</b>: 식전빵 무제한,<br>
									 무료음료 + 1,<br>
									 전체 가격에 7% 포인트 적립,<br>
									 매달 쿠폰 지급(스테이크 1개 무료)</p>
	            <p><b>혜택 기간</b>: 2025-01-01 ~ 2025-12-31</p>
	        </div>
	    </div>
	     <div class="button-container">
			<button class="btn btn-success btn-custom" id="membershipButton">멤버십 가입</button>
			<button class="btn btn-secondary btn-custom" onclick="window.history.back()">뒤로가기</button>
   		 </div>
	</div>
	
	<!-- 모달 -->
    <div class="modal fade" id="membershipModal" tabindex="-1" aria-labelledby="membershipModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="membershipModalLabel">결제 동의</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                   	<input type="text" id="member_id" hidden>
                   	<input type="text" id="member_name" hidden>
                   	<input type="text" id="member_phone" hidden>
                   	<input type="text" id="member_email" hidden>
                   	<input type="text" id="member_address1" hidden>
                   	<input type="text" id="member_address2" hidden>
                   	<input type="text" id="member_post_code" hidden>
                </div>
                <div class="modal-body">
                    <form>
                    	<div>
                    		<b><span id="amount">50000</span><span>원</span></b>
						</div>
                    	<br>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="agreeAll" onclick="toggleCheckboxes(this)">
                            <label class="form-check-label checkbox-label" for="agreeAll">
                                모두 동의합니다. (선택 동의 포함)
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input dependent-checkbox" type="checkbox" id="agree1">
                            <label class="form-check-label" for="agree1">
                                (필수) 멤버십 정기결제 동의
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input dependent-checkbox" type="checkbox" id="agree2">
                            <label class="form-check-label" for="agree2">
                                (필수) 이용약관 및 결제 및 멤버십 유의사항
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input dependent-checkbox" type="checkbox" id="agree3">
                            <label class="form-check-label" for="agree3">
                                (필수) 멤버십 제3자 개인정보 제공
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input dependent-checkbox" type="checkbox" id="agree4">
                            <label class="form-check-label" for="agree4">
                                (선택) 멤버십 혜택 및 프로모션 알림 동의
                            </label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="payment()">결제하기</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
	<br>
	<br>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/footer.jsp"></jsp:include>
	</footer>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
<script>
	// 객체 초기화
	var IMP = window.IMP;
	IMP.init("imp65450054");
	let amount = $("#amount").text();
	console.log(amount);
	let id = $("#id").val();
	console.log(id);
	
	$("#membershipButton").click(function() {
	    if (id != "") {
	    	$.ajax({
		        url: 'paymentGetMember',
		        type: 'GET',
		        data: {
		        	id: id
		        },
		        dataType: "JSON"
			}).done(function(result) {
// 				console.log(JSON.stringify(result));
				if(result){
					console.log(result.member_id);
					$("#member_id").val(result.member_id);
					$("#member_name").val(result.member_name);
					$("#member_phone").val(result.member_phone);
					$("#member_email").val(result.member_email);
					$("#member_address1").val(result.member_address1);
					$("#member_address2").val(result.member_address2);
					$("#member_post_code").val(result.member_post_code);
			        // 조건이 참일 경우 모달 열기
		    		$("#membershipModal").modal('show');
				} else {
					alert("조회실패!")
				}
				
			}).fail(function() {
				alert("가입 할 수 없습니다.");
			});
	    } else {
	        // 조건이 거짓일 경우 처리할 내용
	        alert('로그인을 해주세요.');
	    }
	});
    
    function payment(){
    	// 체크박스 상태 확인
        const agreePersonalInfo = document.getElementById('agree1').checked;
        const agreeProcessing = document.getElementById('agree2').checked;
        const agreeMarketing = document.getElementById('agree3').checked;
		
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
    	
    	let id = $("#member_id").val();
//     	console.log(id);
    	let name = $("#member_name").val();
    	let phone = $("#member_phone").val();
    	let email = $("#member_email").val();
    	let address = $("#member_address1").val() + " " + $("#member_address2").val();
//     	console.log(address);
    	let postCode = $("#member_post_code").val();
        // 하나라도 체크되지 않은 경우 경고창 표시
        if (!agreePersonalInfo || !agreeProcessing || !agreeMarketing) {
            alert("필수 항목에 체크하셔야합니다.");
        } else {
            // 모든 체크박스에 동의한 경우, 다음 단계로 진행
            alert("약관에 동의하셨습니다.");
         	// 결제창 호출 
		    IMP.request_pay(
	    		  {
	    		    channelKey: "channel-key-04137c4a-aa71-4ede-8f14-23bb0f17775d",
	    		    pay_method: "card",
	    		    merchant_uid: code, //상점에서 생성한 고유 주문번호
	    		    name: "DOS 멤버쉽",
	    		    amount: 1,
	    		    buyer_email: email,
	    		    buyer_name: id,
	    		    buyer_tel: phone, //필수 파라미터 입니다.
	    		    buyer_addr: address,
	    		    buyer_postcode: postCode,
	    		    escrow: true, //에스크로 결제인 경우 설정
	    		    bypass: {
	    		      acceptmethod: "easypay", // 간편결제 버튼을 통합결제창에서 제외하려면 "noeasypay"
// 	    		      acceptmethod: "cardpoint", // 카드포인트 사용시 설정(PC)
	    		    },
	    		  },
	    		  function (rsp) {
// 	    			console.log(rsp); 수신 정보 확인용
	    			// callback
					if (rsp.success) {
						$.ajax({
							url: "pamentSetMember",
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
								$("#membershipModal").modal('hide');
						 	alert('멤버쉽 가입을 축하드립니다!');
						 	
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
        }
    }
</script>
</body>
</html>