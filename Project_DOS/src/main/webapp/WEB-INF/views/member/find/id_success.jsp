<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        h1 {
            font-weight: bold;
            margin-bottom: 20px; /* 제목과 버튼 간격 조정 */
        }
        .btn-custom {
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
		<h1>고객님의 아이디는</h1><br>
		<p>ID : xxxxx</p><br>
		<div class="container">
		    <a href="MemberLogin" class="btn btn-dark btn-custom">로그인</a>
		    <a href="FindPasswd" class="btn btn-secondary btn-custom">비밀번호 찾기</a>
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
