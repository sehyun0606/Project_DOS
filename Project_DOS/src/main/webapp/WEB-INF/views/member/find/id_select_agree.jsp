<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>본인 인증</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <style>
        .container {
            text-align: center;
        }
        .btn-custom {
            width: 200px; /* 버튼 너비 조정 */
            margin: 10px; /* 버튼 간격 조정 */
        }
        h1 {
            margin-bottom: 20px;
            font-weight: bold;
        }
        p {
            margin-bottom: 30px;
        }
        
         article {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 60px); /* 헤더 높이를 제외한 높이 */
            text-align: center;
        }
    </style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<article>
		<div class="container">
		    <h1>본인인증</h1>
		    <p>본인 인증 방법을 선택 해주세요.</p>
		    <a href="javascript:phoneVerification();" class="btn btn-primary btn-custom">휴대폰 본인 인증</a>
		    <a href="FindAgreeEmail" class="btn btn-secondary btn-custom">email 본인 인증</a>
		</div>
	</article>
	<br>
	<br>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/footer.jsp"></jsp:include>
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
			var IMP = window.IMP;
			IMP.init("imp65450054");
			
			function phoneVerification() {
				let now = new Date();
		    	let year = now.getFullYear();
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
			    // IMP.certification(param, callback) 호출
			    IMP.certification(
			        {
			            // param
			            channelKey: "channel-key-0ff2dd57-d9b3-4f25-b95e-7664f4e2f266",
			            // 주문 번호
			            merchant_uid: code,
			            
			            m_redirect_url: "https://your.redirect.url/here",
			            // PC환경에서는 popup 파라미터가 무시되고 항상 true로 적용됨
			            popup: true,
			        },
			        function (rsp) {
			        	console.log(rsp);
			            // callback
			            if (rsp.success) {
			                // 인증 성공 시 로직
			                alert('인증 성공: ' + rsp.imp_uid);
			            } else {
			                // 인증 실패 시 로직
			                alert('인증 실패: ' + rsp.error_msg);
			            }
			        }
			    );
			}
		</script>
</body>
</html>
