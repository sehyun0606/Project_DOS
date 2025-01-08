<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>약관 동의</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .agreement-container {
            max-width: 600px;
            margin: auto;
            padding: 2rem;
            background-color: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 0.5rem;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .agreement-title {
            font-weight: bold;
            margin-top: 1.5rem;
        }
        .agreement-content {
            background-color: #f1f1f1;
            padding: 1rem;
            border-radius: 0.25rem;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	
	<article>
	<div class="agreement-container mt-5">
	    <h1 class="text-center mb-4">약관 동의</h1>
	    <p class="text-center">이용약관과 개인정보처리방침에 대한 안내를 읽고 동의해 주세요.</p>

	    <div class="mb-4">
	        <h5 class="agreement-title">(*) 개인정보 수집 및 이용에 대한 동의</h5>
	        <div class="agreement-content">
	            <p>약관 동의가 가지는 의미 등...</p>
	            <p>모르겠다면 아래쪽 설명서가 약관 동의 참조</p>
	        </div>
	        <div class="form-check form-check-inline">
	            <input type="radio" class="form-check-input" name="personalInfo" id="agreePersonalInfo" value="agree">
	            <label class="form-check-label" for="agreePersonalInfo">동의합니다</label>
	        </div>
	   	 <div class="form-check form-check-inline">	
	            <input type="radio" class="form-check-input" name="personalInfo" id="disagreePersonalInfo" value="disagree">
	            <label class="form-check-label" for="disagreePersonalInfo">동의하지 않습니다</label>
	        </div>
	    </div>

	    <div class="mb-4">
	        <h5 class="agreement-title">(*) 개인정보 처리 위탁에 대한 동의</h5>
	        <div class="agreement-content">
	            <p>약관 동의가 가지는 의미 등...</p>
	            <p>모르겠다면 아래쪽 설명서가 약관 동의 참조</p>
	        </div>
	        <div class="form-check form-check-inline">
	            <input type="radio" class="form-check-input" name="processing" id="agreeProcessing" value="agree">
	            <label class="form-check-label" for="agreeProcessing">동의합니다</label>
	        </div>
	    	<div class="form-check form-check-inline">
	            <input type="radio" class="form-check-input" name="processing" id="disagreeProcessing" value="disagree">
	            <label class="form-check-label" for="disagreeProcessing">동의하지 않습니다</label>
	        </div>
	    </div>
	
	    <div class="mb-4">
	        <h5 class="agreement-title">(*) DOS 광고정보 수신 동의</h5>
	        <div class="agreement-content">
	            <p>약관 동의가 가지는 의미 등...</p>
	            <p>모르겠다면 아래쪽 설명서가 약관 동의 참조</p>
	        </div>
	        <div class="form-check form-check-inline">
	            <input type="radio" class="form-check-input" name="marketing" id="agreeMarketing" value="agree">
	            <label class="form-check-label" for="agreeMarketing">동의합니다</label>
	        </div>
	        <div class="form-check form-check-inline">
	            <input type="radio" class="form-check-input" name="marketing" id="disagreeMarketing" value="disagree">
	            <label class="form-check-label" for="disagreeMarketing">동의하지 않습니다</label>
	        </div>
	    </div>

	    <div class="text-center mt-4">
	        <button class="btn btn-dark btn-wide" onclick="checkAgreement()">확인</button>&nbsp;
	        <button class="btn btn-secondary btn-wide" onclick="history.back()">뒤로가기</button>
	    </div>
	</div>
	</article>
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
        const agreePersonalInfo = document.getElementById('agreePersonalInfo').checked;
        const agreeProcessing = document.getElementById('agreeProcessing').checked;
        const agreeMarketing = document.getElementById('agreeMarketing').checked;

        // 하나라도 체크되지 않은 경우 경고창 표시
        if (!agreePersonalInfo || !agreeProcessing || !agreeMarketing) {
            alert("모든 약관에 동의해야 합니다.");
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
