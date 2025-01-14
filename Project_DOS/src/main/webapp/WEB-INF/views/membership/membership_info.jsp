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
			<button class="btn btn-success btn-custom" data-bs-toggle="modal" data-bs-target="#membershipModal">멤버십 가입</button>
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
                </div>
                <div class="modal-body">
                    <form>
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
                    <button type="button" class="btn btn-primary" onclick="checkAgreement()">결제하기</button>
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
    function checkAgreement() {
        // 체크박스 상태 확인
        const agreePersonalInfo = document.getElementById('agree1').checked;
        const agreeProcessing = document.getElementById('agree2').checked;
        const agreeMarketing = document.getElementById('agree3').checked;

        // 하나라도 체크되지 않은 경우 경고창 표시
        if (!agreePersonalInfo || !agreeProcessing || !agreeMarketing) {
            alert("필수 항목에 체크하셔야합니다.");
        } else {
            // 모든 체크박스에 동의한 경우, 다음 단계로 진행 (예: 폼 제출)
            alert("약관에 동의하셨습니다.");
            window.location.href="SelectAgree";
            // 여기서 폼 제출이나 다음 단계로 진행하는 코드를 추가할 수 있습니다.
        }
    }
</script>
</body>
</html>
