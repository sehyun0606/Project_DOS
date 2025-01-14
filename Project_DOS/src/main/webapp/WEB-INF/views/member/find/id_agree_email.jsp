<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이메일 인증</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    
    <style>
        .card {
            width: 400px; /* 카드의 너비 설정 */
            padding: 20px; /* 패딩 추가 */
            border-radius: 10px; /* 모서리 둥글게 */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
        }
        h1 {
            margin-bottom: 20px;
            font-weight: bold;
        }
        .btn-custom {
            width: 150px; /* 버튼의 너비를 100%로 설정 */
        }
        article {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 60px); /* 헤더 높이를 제외한 높이 */
        }
		.success-message {
		   color: green; /* 성공 메시지 색상 */
		}
		
		.error-message {
		    color: red; /* 오류 메시지 색상 */
		}
	</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<article>
    	<h1 class="text-center">이메일 인증</h1>
		<div class="card">
		    <form action="FindIdSuccess">
		        <div class="mb-3 ">
		            <label for="email" class="form-label">Email</label>
		            <div class="input-group">
		                <input type="email" class="form-control" id="email" name="member_email" placeholder="이메일을 입력하세요" required="required">
		                <button class="btn btn-outline-secondary" type="button" id="sendMail" >인증 번호 보내기</button>
		            </div>
		        </div>
		        <div class="mb-3">
		            <label for="text" class="form-label">인증번호</label>
		            <div class="input-group">
		                <input type="text" class="form-control" id="emailAuthCode" name="emailAuthCode" placeholder="인증번호를 입력하세요" required="required">
		                <button class="btn btn-outline-secondary" type="button" id="authCode">인증</button><br>
		            </div>
				    <div id="resultMessage" class="mt-3"></div> <!-- 인증 성공 메시지 -->
		        </div>
		        <div class="d-flex justify-content-center mt-2">
		        <button type="submit" class="btn btn-dark " >다음으로</button>
		        </div>
		    </form>
		</div>
	</article>
	<br>
	<br>
	<footer>
		<jsp:include page="/WEB-INF/views/inc/footer.jsp"></jsp:include>
	</footer>
		
	<script type="text/javascript">
		$("#sendMail").click(function(){
			let email = $("#email").val();
			if (email == "") {
	            alert("이메일을 입력하세요.");
	            return;
			}
			// AJAX 요청으로 이메일 전송
		    $.ajax({
		        url: 'sendAuthMail',
		        type: 'GET',
		        data: {
		        	email: email
		        }
			}).done(function(result){
				alert("메일 발송 성공!")
			}).fail(function(){
				alert("메일 전송 실패!");
			});
		});
		
		$("#authCode").click(function(){
			let code = $("#emailAuthCode").val();
			let email = $("#email").val();
			if(code == ""){
				alert("인증번호를 입력하세요!");
				return;
			}
			
			$.ajax({
				url: 'authCodeCheck',
				type: 'GET',
				data: {
					email : email,
					code : code
				}
			}).done(function(result){
				if(result.trim() == "true") {
					console.log("인증성공!");
					$("#resultMessage").text("인증 성공!").removeClass("error-message").addClass("success-message").show();
				} else {
					console.log("인증실패!");
					$("#resultMessage").text("인증 실패!").removeClass("success-message").addClass("error-message").show();
				}
			}).fail(function() {
				alert("AJEX 요청 오류!");		
			});
		});
		
	</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
