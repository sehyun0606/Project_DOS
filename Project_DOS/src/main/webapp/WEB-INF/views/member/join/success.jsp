<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/styles_footer.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        h1 {
            font-weight: bold;
            margin-bottom: 20px; /* 제목과 버튼 간격 조정 */
        }
        .btn-custom {
            background-color: red; /* 버튼 배경색 */
            color: white; /* 버튼 텍스트 색상 */
            border: none; /* 버튼 테두리 제거 */
            width: 150px;
        }
        .btn-custom:hover {
            background-color: darkred; /* 버튼 호버 색상 */
        }
        article {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 500px; /* 헤더 높이를 제외한 높이 */
            text-align: center;
        }
    </style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/top.jsp"></jsp:include>
	</header>
	<article>
		<h1>회원가입 성공!</h1><br>
		<p>지금 당장 로그인 하세요!</p><br>
		<a href="MemberLogin" class="btn btn-custom">로그인</a> <!-- 로그인 페이지 링크 -->
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
