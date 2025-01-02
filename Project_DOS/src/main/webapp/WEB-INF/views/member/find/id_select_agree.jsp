<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>본인 인증</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
		    <a href="phoneVerification.jsp" class="btn btn-primary btn-custom">휴대폰 본인 인증</a>
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
</body>
</html>
